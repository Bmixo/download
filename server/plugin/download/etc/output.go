package download

func (self *DownloadProvider) uiRefleshComplete() error {
	return self.Channel.InvokeMethod("uiReflesh", nil) //ui刷新
}
