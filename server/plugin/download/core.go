package download

import (
	"encoding/base64"
	"errors"
	"fmt"
	"log"
	"os"
	"strings"
	"time"

	pb "github.com/Bmixo/download/server/api/v1"

	"github.com/cavaliercoder/grab"
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

func (self *DownloadProvider) downloadProviderMain() {

	for {
		req := <-self.DownChan

		go func(url64 string, self *DownloadProvider) {
			err := self.addDownload(Download{URL: url64, Downloading: 1, FileName: getFileName(req.URL().String())})
			self.notify("下载完成")
			if err != nil {
				log.Println(err)
			}
			self.DownloadMap[url64] = self.downloadClient.Do(req)
			t := time.NewTicker(250 * time.Millisecond)
			defer t.Stop()
		Loop:
			for {
				select {
				case <-t.C:
					self.updateDownload(Download{URL: url64},
						Download{DownloadSize: self.DownloadMap[url64].BytesComplete(),
							Downloading: 1,
							FilePath:    self.DownloadPath,
							FileSize:    self.DownloadMap[url64].Size(),
							Progress:    self.DownloadMap[url64].Progress()})
					self.notify("正在下载")
					fmt.Printf("  transferred %v / %v  bytes (%.2f%%)\n",
						self.DownloadMap[url64].BytesComplete(),
						self.DownloadMap[url64].Size(),
						100*self.DownloadMap[url64].Progress())
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

	downloadProvider := DownloadProvider{
		downloadClient: grab.NewClient(),
		DownChan:       make(chan *grab.Request, 10),
		DownloadMap:    make(map[string]*grab.Response),
		DownloadPath:   ".",
		notifyStream:   make(chan *pb.NotifyStreamOut, 1000),
		db:             db,
	}

	downloadProvider.db.AutoMigrate(&Download{})
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
	switch title {
	case "正在下载":
		self.db.Where(Download{Downloading: 1}).Find(&downloads)
	case "下载完成":
		self.db.Where(Download{DownloadFinish: 1}).Find(&downloads)
	}
	self.notifyStream <- &pb.NotifyStreamOut{
		Download: downloads,
		Title:    title,
	}

	fmt.Println(title, "end")

}
func download2pb(download interface{}) *pb.Download {
	return download.(*pb.Download)
}
