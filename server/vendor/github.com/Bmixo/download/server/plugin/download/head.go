package download

import (
	pb "github.com/Bmixo/download/server/api/v1"

	"github.com/cavaliercoder/grab"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/sqlite"
)

type Download struct {
	gorm.Model
	URL               string `gorm:"not null;unique;index:DownloadUrlBase64"` //base64
	FilePath          string
	FileName          string
	DownloadSize      int64
	Progress          float64
	FileSize          int64
	ErrorReason       string
	FileRemoved       int //默认0 忽略 -1 否定 1 确定
	DownloadError     int
	Downloading       int
	Suspend           int
	DownloadFinish    int
	Trash             int
	OpsDelJob         int
	OpsDelJobComplete int
}

type DownloadProvider struct {
	downloadClient *grab.Client
	DownloadMap    map[string]*grab.Response
	DownChan       chan *grab.Request
	DownloadPath   string
	notifyStream   chan *pb.NotifyStreamOut
	db             *gorm.DB
}

type API struct {
	downloadProvider *DownloadProvider
}

func NewAPI() *API {
	return &API{
		downloadProvider: newDownloadProvider(),
	}
}
