import 'package:flutter/material.dart';
import 'main.dart';
import 'package:Trace/api.dart';
class ListItemDownFinish extends StatefulWidget {
  ListItemDownFinish(this.context);
  BuildContext context;
  State createState() => CFFCFCF();
}

class CFFCFCF extends State<ListItemDownFinish> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: new SliverChildBuilderDelegate(
      (context, index) => buildx(context, index),
      // childCount: sortedPortfolioDisplay != null
      //     ? sortedPortfolioDisplay.length
      //     : 0
      childCount: downloadListData["下载完成"].length,
    ));
  }

  @override
  Widget buildx(BuildContext context, index) {
    var jsonData = downloadListData["下载完成"][index];

    var status = "";
    if (jsonData.downloadFinish == 1) {
      status = "下载完成";
    }
    var fileTitle = jsonData.fileName;

    // var fileTitle =
    //     String.fromCharCodes(base64Decode(jsonData["URL"])).split("/").last;
    return new InkWell(
        onTap: () {
          print("TAP");
        },
        child: Dismissible(

            // Key
            key: Key('111'),
            // Child
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 150,
                    height: 15,
                    child: new Text(fileTitle,
                        style: new TextStyle(fontWeight: FontWeight.w500)),
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(calcSize(int642double(jsonData.fileSize))),
                      Text(status),
                    ],
                  ),
                ],
              ),
            )));
  }
}
