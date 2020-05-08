package download

import (
	"encoding/base64"
	"errors"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"
	"time"

	pb "github.com/Bmixo/download/server/api/v1"

	"github.com/Bmixo/download/server/plugin/download/grab"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/sqlite"
)

func getFileName(urlRaw string) string {
	pos := strings.LastIndex(urlRaw, "/")
	if pos != 0 && len(urlRaw) > (pos+1) {
		return urlRaw[pos+1:]
	}
	return urlRaw

}
func (self *DownloadConfig) GetConfig(db *gorm.DB) *DownloadConfig {
	var downloadConfigs []*DownloadConfig
	db.Where(DownloadConfig{Name: "default"}).Find(&downloadConfigs)
	if len(downloadConfigs) != 0 {
		return downloadConfigs[0]
	}
	return &DownloadConfig{}
}
func (self *DownloadConfig) UpdateConfig(db *gorm.DB, oldConfig DownloadConfig, newConfig DownloadConfig) error {
	return db.Model(&DownloadConfig{}).Where(oldConfig).Updates(newConfig).Error
}

func InitConfig(db *gorm.DB) (*DownloadConfig, error) {
	var DownloadConfigs []*DownloadConfig

	for i := 0; i < 2; i++ {
		db.Where(DownloadConfig{Name: "default"}).Find(&DownloadConfigs)
		if len(DownloadConfigs) == 0 {
			absPath, err := filepath.Abs(".")
			if err != nil {
				panic(err)
			}
			if err := db.Create(&DownloadConfig{Name: "default", DownloadPath: absPath}).Error; err != nil {
				panic(err)
			}
		} else {
			return DownloadConfigs[0], nil
		}
	}
	return &DownloadConfig{}, errors.New("database error")
}
func (self *DownloadProvider) downloadProviderMain() {

	for {
		req := <-self.DownChan

		go func(url64 string, self *DownloadProvider) {
			err := self.addDownload(Download{URL: url64, Downloading: 1, FilePath: self.config.DownloadPath, FileName: getFileName(req.URL().String())})
			if err != nil {
				log.Println(err)
			}
			self.notify("正在下载")
			self.DownloadMap[url64] = self.downloadClient.Do(req)
			t := time.NewTicker(250 * time.Millisecond)
			defer t.Stop()
		Loop:
			for {
				select {
				case <-t.C:

					self.updateDownload(Download{URL: url64},
						Download{DownloadSize: self.DownloadMap[url64].BytesComplete(),
							Downloading:            1,
							FileSize:               self.DownloadMap[url64].Size(),
							DownloadBytesPerSecond: self.DownloadMap[url64].DownloadBytesPerSecond(),
							UploadBytesPerSecond:   0,
							Progress:               self.DownloadMap[url64].Progress()})
					self.notify("正在下载")
					fmt.Printf("  transferred %v / %v  bytes (%.2f%%) speed %v\n",
						self.DownloadMap[url64].BytesComplete(),
						self.DownloadMap[url64].Size(),
						100*self.DownloadMap[url64].Progress(),
						self.DownloadMap[url64].DownloadBytesPerSecond())
				case <-self.DownloadMap[url64].Done:
					break Loop
				}
			}

			if err := self.DownloadMap[url64].Err(); err != nil {
				self.updateDownload(Download{URL: url64},
					Download{
						Downloading:   1,
						DownloadError: 1,
						ErrorReason:   err.Error(),
					})

				fmt.Fprintf(os.Stderr, "Download failed: %v\n", err)
			} else {
				self.updateDownload(Download{URL: url64},
					Download{DownloadSize: self.DownloadMap[url64].Size(),
						FileSize:       self.DownloadMap[url64].Size(),
						Progress:       1.00,
						Downloading:    -1,
						DownloadFinish: 1,
					})
			}
			self.notify("正在下载")
			self.notify("下载完成")
			fmt.Printf("Download saved to ./%v \n", self.DownloadMap[url64].Filename)
			delete(self.DownloadMap, url64)
		}(base64Encode(req.URL().String()), self)
	}
}
func newDownloadProvider() *DownloadProvider {
	db, err := gorm.Open("sqlite3", "test.db")
	if err != nil {
		panic("连接数据库失败")
	}

	db.AutoMigrate(&DownloadConfig{})
	db.AutoMigrate(&Download{})
	config, err := InitConfig(db)
	if err != nil {
		panic(err)
	}
	downloadProvider := DownloadProvider{
		downloadClient: grab.NewClient(),
		DownChan:       make(chan *grab.Request, 10),
		DownloadMap:    make(map[string]*grab.Response),
		notifyStream:   make(chan *pb.NotifyStreamOut, 1000),
		db:             db,
		config:         config,
	}
	go downloadProvider.downloadProviderMain()
	return &downloadProvider
}

func (self *DownloadProvider) deleteFile(job Download) error {

	if job.FilePath == "" {
		return errors.New("file path empty")
	}
	fmt.Println("deleteFile", job.FilePath)
	return nil
}
func (self *DownloadProvider) deleteJob(job Download) {
	fmt.Println("deleteJob: ", job)
}

func base64Encode(input string) string {
	return base64.StdEncoding.EncodeToString([]byte(input))
}
func base64Decode(input string) ([]byte, error) {
	return base64.RawStdEncoding.DecodeString(input)
}
func (self *DownloadProvider) checkTaskExist(link64 string) bool {
	Downloads := []Download{}
	self.db.Where(&Download{URL: link64}).Find(&Downloads)
	if len(Downloads) != 0 {
		return true
	}
	return false
}
func (self *DownloadProvider) addDownload(Download Download) error {
	return self.db.Create(&Download).Error
}
func (self *DownloadProvider) updateDownload(oldDownload Download, newDownload Download) error {
	return self.db.Model(&Download{}).Where(oldDownload).Updates(newDownload).Error //
}
func (self *DownloadProvider) notify(title string) {
	fmt.Println(title, "start")
	var downloads []*pb.Download
	downloadBytesPerSecond := float64(0)
	uploadBytesPerSecond := float64(0)
	switch title {
	case "正在下载":
		self.db.Where(Download{Downloading: 1}).Find(&downloads)
		for i := 0; i < len(downloads); i++ {
			downloadBytesPerSecond += downloads[i].DownloadBytesPerSecond
			uploadBytesPerSecond += downloads[i].UploadBytesPerSecond
		}
	case "下载完成":
		self.db.Where(Download{DownloadFinish: 1}).Find(&downloads)
	}
	self.notifyStream <- &pb.NotifyStreamOut{
		Download:               downloads,
		Title:                  title,
		DownloadBytesPerSecond: downloadBytesPerSecond,
		UploadBytesPerSecond:   uploadBytesPerSecond,
	}
	fmt.Println(title, "downloadBytesPerSecond", downloadBytesPerSecond)

}
func download2pb(download interface{}) *pb.Download {
	return download.(*pb.Download)
}
