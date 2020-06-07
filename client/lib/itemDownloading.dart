import 'package:flutter/material.dart';
import 'main.dart';
import 'package:Download/api.dart';
import 'package:fixnum/fixnum.dart' as fixnum;
class ListItemDownloading extends StatefulWidget {
  @override
  State createState() => CFFCFCF();
  ListItemDownloading(this.context);
  BuildContext context;
}

class CFFCFCF extends State<ListItemDownloading> {
  @override
  void initState() {
    updateStatus("正在下载");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: new SliverChildBuilderDelegate(
      (context, index) => itemDownloading(context, index),
      childCount: downloadListData["正在下载"].length,
    ));
  }

  Widget itemDownloading(BuildContext context, index) {
    var jsonData = downloadListData["正在下载"][index];

    var status = "";
    if (jsonData.downloading == 1) {
      status = "正在下载";
    }
    if (jsonData.suspend == 1) {
      status = "暂停";
    }
    if (jsonData.downloadError == 1) {
      status = "下载错误"; //下载成为
    }
    double progressValue =jsonData.progress;
    var fileTitle = jsonData.fileName;

    // var fileTitle =
    //     String.fromCharCodes(base64Decode(jsonData["URL"])).split("/").last;

    return new InkWell(
        onTap: () {
          print("TAP");
        },
        child: new Dismissible(
          // Key
          key: Key('111'),
          // Child
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(fileTitle,
                    style: new TextStyle(fontWeight: FontWeight.w500)),
                new Icon(Icons.file_download),
              ],
            ),
            leading: new Icon(
              Icons.file_download,
              color: Colors.blue[500],
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: progressValue,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(calcSize(int642double(jsonData.downloadSize)) +
                        "/" +
                        calcSize(int642double(jsonData.fileSize))),
                    Text(status),
                  ],
                ),
              ],
            ),
          ),
          //右滑删除
          // onDismissed: (direction) {
          //   downloadListData[type].removeAt(index);
          // },
        ));
  }
}
