package download

import (
	"context"
	"fmt"
	"path/filepath"
	"strings"

	pb "github.com/Bmixo/download/server/api/v1"
	"github.com/Bmixo/download/server/plugin/download/grab"
	"github.com/ncruces/zenity"
)

func (self *API) AddTask(ctx context.Context, in *pb.AddTaskIn) (*pb.AddTaskOut, error) {
	if in.Link == "" {
		return &pb.AddTaskOut{ErrorMsg: "link null"}, nil
	}
	accept := []string{"http://", "https://"}
	num := -1
	for _, j := range accept {
		num = strings.Index(in.Link, j)
		if num == 0 {
			break
		}
	}
	if num != 0 {
		return &pb.AddTaskOut{ErrorMsg: "下载链接不支持"}, nil
	}
	req, err := grab.NewRequest(self.downloadProvider.config.DownloadPath, in.Link)
	if err != nil {
		return &pb.AddTaskOut{ErrorMsg: "内部错误"}, nil
	}
	if self.downloadProvider.checkTaskExist(base64Encode(req.URL().String())) == false {
		self.downloadProvider.DownChan <- req
	} else {
		return &pb.AddTaskOut{ErrorMsg: "任务已存在"}, nil
	}
	return &pb.AddTaskOut{}, nil
}

func (self *API) SelectDownLoadPath(ctx context.Context, in *pb.SelectDownLoadPathIn) (*pb.SelectDownLoadPathOut, error) {
	path, err := zenity.SelectFileSave(zenity.Directory())
	if err != nil || path == "" {
		return &pb.SelectDownLoadPathOut{PathDir: "", ErrorMsg: "路径选择失败"}, nil
	}
	absPath, err := filepath.Abs(path)
	if err != nil {
		return &pb.SelectDownLoadPathOut{PathDir: "", ErrorMsg: "路径选择失败"}, nil
	}
	err = self.downloadProvider.config.UpdateConfig(self.downloadProvider.db,
		DownloadConfig{Name: "default"}, DownloadConfig{Name: "default", DownloadPath: absPath})
	if err != nil {
		return &pb.SelectDownLoadPathOut{PathDir: "", ErrorMsg: "路径修改失败"}, nil
	}
	self.downloadProvider.config.DownloadPath = absPath
	return &pb.SelectDownLoadPathOut{PathDir: absPath, ErrorMsg: "路径修改成功"}, nil
}
func (self *API) GetDownloading(ctx context.Context, in *pb.GetDownloadingIn) (*pb.GetDownloadingOut, error) {
	var downloads []*pb.Download
	self.downloadProvider.db.Where(Download{Downloading: 1}).Find(&downloads)
	return &pb.GetDownloadingOut{Download: downloads, ErrorMsg: ""}, nil
}

func (self *API) GetDownloadFinish(ctx context.Context, in *pb.GetDownloadFinishIn) (*pb.GetDownloadFinishOut, error) {
	var downloads []*pb.Download
	self.downloadProvider.db.Where(Download{DownloadFinish: 1}).Find(&downloads)
	return &pb.GetDownloadFinishOut{Download: downloads, ErrorMsg: ""}, nil
}

func (self *API) GetTrash(ctx context.Context, in *pb.GetTrashIn) (*pb.GetTrashOut, error) {
	var downloads []*pb.Download
	self.downloadProvider.db.Where(Download{Trash: 1}).Find(&downloads)
	return &pb.GetTrashOut{Download: downloads, ErrorMsg: ""}, nil
}

func (self *API) NotifySteam(in *pb.NotifyStreamIn, stream pb.DownloadProvider_NotifySteamServer) error {
	fmt.Println("connect suss...")
	stream.Send(&pb.NotifyStreamOut{Title: "Connect suss.."})
	for {
		if stream.Send(<-self.downloadProvider.notifyStream) != nil {
			break
		}
	}
	fmt.Println("connect exit...")
	return nil
}

func (self *API) GetPathInfo(ctx context.Context, in *pb.GetPathInfoIn) (*pb.GetPathInfoOut, error) {
	return &pb.GetPathInfoOut{DownloadPath: self.downloadProvider.config.DownloadPath, ErrorMsg: ""}, nil
}

// func (self *API) ChangeDownloadStatus(ctx context.Context, in *pb.AddTaskIn) (*pb.AddTaskOut, error) {
// 	// defer self.uiRefleshComplete()
// 	var data string
// 	var ok bool
// 	downloads := []Download{}
// 	if data, ok = arguments.(string); !ok {
// 		return "内部错误代码 001", nil
// 	}

// 	if err := json.Unmarshal([]byte(data), &downloads); err != nil {
// 		return "内部错误代码 002", nil
// 	}
// 	for _, download := range downloads {
// 		if download.OpsDelJob == 1 {
// 			self.downloadProvider.deleteJob(download)
// 			return "", nil
// 		}
// 		if download.OpsDelJobComplete == 1 {
// 			self.downloadProvider.deleteFile(download)
// 			self.downloadProvider.deleteJob(download)
// 			return "", nil
// 		}
// 	}
// 	return "", nil
// }
