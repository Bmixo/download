import 'package:Trace/api/v1/server.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:Trace/api.dart';
class TransactionSheet extends StatefulWidget {
  TransactionSheet(
    this.loadPortfolio,
    this.marketListData, {
    Key key,
    this.snapshot,
    this.symbol,
  }) : super(key: key);

  final Function loadPortfolio;
  final List marketListData;

  final Map snapshot;
  final String symbol;

  @override
  TransactionSheetState createState() => new TransactionSheetState();
}

class TransactionSheetState extends State<TransactionSheet> {
  TextEditingController _downloadLinkController = new TextEditingController();

  FocusNode _quantityFocusNode = new FocusNode();

  Color errorColor = Colors.red;
  Color okColor = Colors.black;
  Color validColor;

  String downloadLink;
  Color downloadLinkTextColor;

  Map totalQuantities;

  @override
  void initState() {
    super.initState();
    downloadLinkTextColor = okColor;

  }

  @override
  Widget build(BuildContext context) {
    validColor = Theme.of(context).textTheme.body2.color;
    return new Container(
        decoration: new BoxDecoration(
          border: new Border(
              top: new BorderSide(color: Theme.of(context).bottomAppBarColor)),
          color: Theme.of(context).primaryColor,
        ),
        padding: const EdgeInsets.only(
            top: 8.0, bottom: 8.0, right: 16.0, left: 16.0),
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: new Text(
                                "添加任务",
                            style: Theme.of(context).textTheme.body2.apply(
                                fontSizeFactor: 1.2, fontWeightDelta: 2))),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          padding: const EdgeInsets.only(right: 4.0),
                          child: new TextField(
                            focusNode: _quantityFocusNode,
                            controller: _downloadLinkController,
                            autocorrect: false,
                            onChanged: (String value) async {
                              downloadLink = value;
                              setState(() {});
                            },
                            // onSubmitted: (_) => FocusScope.of(context)
                            //     .requestFocus(_priceFocusNode),
                            style: Theme.of(context)
                                .textTheme
                                .body2
                                .apply(color: downloadLinkTextColor),
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              hintText: "请输入下载链接",
                            ),
                          ),
                        ),
                      ],
                    ),
                    new Row(
                      children: <Widget>[
                        Container(
                          width: 35,
                          height: 35,
                          margin: EdgeInsets.only(
                              left: 10, top: 10, right: 10, bottom: 2),
                          child: FlatButton(
                              onPressed: () => _selectPath(this.context),
                              // color: Color.fromARGB(0, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              // textColor: Color.fromARGB(255, 0, 0, 0),
                              padding: EdgeInsets.all(-10),
                              child: Image.asset(
                                "assets/images/floder.png",
                              )),
                        ),
                      ],
                    ),
                  ]),
              new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Container(
                    child: new FloatingActionButton(
                        child: Icon(Icons.check),
                        //symbol != null &&
                        elevation: downloadLink != null &&
                                downloadLink != "" // 正常情况下浮动的距离
                            // &&
                            // exchange != null &&
                            // price != null
                            ? 4.0
                            : 0.0,
                        //symbol != null &&
                        backgroundColor:
                            downloadLink != "" && downloadLink != null
                                // &&
                                // exchange != null &&
                                // price != null
                                ? Colors.green
                                : Theme.of(context).disabledColor,
                        foregroundColor: Theme.of(context).iconTheme.color,
                        onPressed: () {
                          print(downloadLink);
                          _download(this.context);
                        }),
                  )
                ],
              )
            ]));
  }

  void ShowWarringDialog(BuildContext context, String info) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          // margin: EdgeInsets.only(bottom: 20.0),
          child: SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            title: Text(info),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    color: Colors.grey,
                    child: Text("确定"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Container(
                    width: 10.0,
                  ),
                ],
              )
            ],
          ),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.25),
            borderRadius: BorderRadius.circular(4.0),
          ),
        );
      },
    );
  }
  void _selectPath(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return Container(
              decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.001),
            borderRadius: BorderRadius.circular(4.0),
          ));
        });
    SelectDownLoadPathOut info =await selectDownLoadPath();
    if (info.errorMsg != "") {
      Navigator.pop(context);
      ShowWarringDialog(context, info.errorMsg);
    }
    setState(() {});
  }

  void _download(BuildContext context) async {
    if (_downloadLinkController.text == "") {
      ShowWarringDialog(context, "请输入下载地址");
      setState(() {});
      return;
    }
    AddTaskOut info = await addTask(_downloadLinkController.text);
    _downloadLinkController.clear();
    if (info.errorMsg != "") {
      ShowWarringDialog(context, info.errorMsg);
      setState(() {});
      return;
    }
    Navigator.of(context).pop();
    setState(() {});
  }
}
