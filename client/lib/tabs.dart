import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'itemTrash.dart';
import 'itemDownloading.dart';
import 'itemDownloadFinish.dart';
import 'portfolio/transaction_sheet.dart';
import 'package:Trace/api.dart';

class Tabs extends StatefulWidget {
  Tabs(
      {this.toggleTheme,
      this.savePreferences,
      this.handleUpdate,
      this.darkEnabled,
      this.themeMode,
      this.switchOLED,
      this.darkOLED});

  final Function toggleTheme;
  final Function handleUpdate;
  final Function savePreferences;

  final bool darkEnabled;
  final String themeMode;

  final Function switchOLED;
  final bool darkOLED;

  @override
  TabsState createState() => new TabsState();
}

class TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  TabController _tabController;
  TextEditingController _textController = new TextEditingController();
  int _tabIndex = 0;

  bool isSearching = false;
  String filter;

  bool sheetOpen = false;

  _handleFilter(value) {
    if (value == null) {
      isSearching = false;
      filter = null;
    } else {
      filter = value;
      isSearching = true;
    }
    setState(() {});
  }

  _startSearch() {
    setState(() {
      isSearching = true;
    });
  }

  _stopSearch() {
    setState(() {
      isSearching = false;
      filter = null;
      _textController.clear();
    });
  }

  _handleTabChange() {
    updateStatus("下载完成");
    updateStatus("下载完成");
    updateStatus("垃圾箱");
    _tabIndex = _tabController.animation.value.round();
    if (isSearching) {
      _stopSearch();
    } else {
      setState(() {});
    }
  }

  _openTransaction() {
    setState(() {
      sheetOpen = true;
    });
    _scaffoldKey.currentState
        .showBottomSheet((BuildContext context) {
          return new TransactionSheet(
            () {
              setState(() {
                // _makePortfolioDisplay();
              });
            },
            marketListData,
          );
        })
        .closed
        .whenComplete(() {
          setState(() {
            sheetOpen = false;
          });
        });
  }

  @override
  void initState() {
    updateStatus("下载完成");
    updateStatus("下载完成");
    updateStatus("垃圾箱");
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
    _tabController.animation.addListener(() {
      if (_tabController.animation.value.round() != _tabIndex) {
        _handleTabChange();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  ScrollController _scrollController = new ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        bottomNavigationBar: new Container(
          height: 30,
          decoration: new BoxDecoration(
              border: new Border(
            top: new BorderSide(color: Theme.of(context).bottomAppBarColor),
          )),
          child: new Row(
            children: <Widget>[
              new SizedBox(
                width: 8,
              ),
              new Text("下载", style: Theme.of(context).textTheme.caption),
              new SizedBox(
                width: 10,
              ),
              ValueListenableBuilder(
                builder: (BuildContext context, int value, Widget child) {
                  return Text(
                      calcSize(downloadData.downloadBytesPerSecond) + "MB/S",
                      style: Theme.of(context).primaryTextTheme.body2.apply(
                            color: Colors.green,
                            fontSizeFactor: 0.9,
                          ));
                },
                valueListenable: updateDownloadDetail,
              ),
              new SizedBox(
                width: 10,
              ),
              new Text("上传", style: Theme.of(context).textTheme.caption),
              new SizedBox(
                width: 10,
              ),
              ValueListenableBuilder(
                builder: (BuildContext context, int value, Widget child) {
                  return Text(
                      calcSize(downloadData.uploadBytesPerSecond) + "MB/S",
                      style: Theme.of(context).primaryTextTheme.body2.apply(
                            color: Colors.green,
                            fontSizeFactor: 0.9,
                          ));
                },
                valueListenable: updateDownloadDetail,
              ),
            ],
          ),
        ),
        key: _scaffoldKey,
        drawer: new Drawer(
            child: new Scaffold(
                bottomNavigationBar: new Container(
                    decoration: new BoxDecoration(
                        border: new Border(
                      top: new BorderSide(
                          color: Theme.of(context).bottomAppBarColor),
                    )),
                    child: new ListTile(
                      onTap: widget.toggleTheme,
                      leading: new Icon(
                          widget.darkEnabled
                              ? Icons.brightness_3
                              : Icons.brightness_7,
                          color: Theme.of(context).buttonColor),
                      title: new Text(widget.themeMode,
                          style: Theme.of(context)
                              .textTheme
                              .body2
                              .apply(color: Theme.of(context).buttonColor)),
                    )),
                body: new ListView(
                  children: <Widget>[
                    new ListTile(
                      leading: new Icon(Icons.settings),
                      title: new Text("Settings"),
                      onTap: () => Navigator.pushNamed(context, "/settings"),
                    ),
                  ],
                ))),
        floatingActionButton: _tabIndex == 0 ? _transactionFAB(context) : null,
        body: new NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                title: [
                  new Text("正在下载"),
                  isSearching
                      ? new TextField(
                          controller: _textController,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          style: Theme.of(context).textTheme.subhead,
                          onChanged: (value) => _handleFilter(value),
                          autofocus: true,
                          textCapitalization: TextCapitalization.none,
                          decoration: new InputDecoration.collapsed(
                              hintText: 'Search names and symbols...'),
                        )
                      : new GestureDetector(
                          onTap: () => _startSearch(),
                          child: new Text("下载完成"),
                        ),
                  new Text("垃圾箱"),
                ][_tabIndex],
                actions: <Widget>[
                  [
                    new Container(),
                    isSearching
                        ? new IconButton(
                            icon: new Icon(Icons.close),
                            onPressed: () => _stopSearch())
                        : new IconButton(
                            icon: new Icon(Icons.search,
                                color:
                                    Theme.of(context).primaryIconTheme.color),
                            onPressed: () => _startSearch()),
                    new Container(),
                  ][_tabIndex],
                ],
                pinned: true,
                floating: true,
                titleSpacing: 3.0,
                elevation: appBarElevation,
                forceElevated: innerBoxIsScrolled,
                bottom: new PreferredSize(
                    preferredSize: const Size.fromHeight(38.0),
                    child: new Container(
                      height: 38.0,
                      child: new TabBar(
                        controller: _tabController,
                        indicatorColor: Theme.of(context).accentIconTheme.color,
                        unselectedLabelColor: Theme.of(context).disabledColor,
                        labelColor: Theme.of(context).accentIconTheme.color,
                        tabs: <Tab>[
                          new Tab(icon: new Icon(Icons.cloud_download)),
                          new Tab(icon: new Icon(Icons.file_download)),
                          new Tab(icon: new Icon(Icons.restore_from_trash)),
                        ],
                      ),
                    )),
              )
            ];
          },
          body: new TabBarView(
            controller: _tabController,
            children: [
              portfolioPage(context),
              downloadFinish(context),
              trash(context)
            ], //切换位置
          ),
        ));
  }

  Widget _transactionFAB(BuildContext context) {
    return sheetOpen
        ? new FloatingActionButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Icon(Icons.close),
            foregroundColor: Theme.of(context).iconTheme.color,
            backgroundColor: Theme.of(context).accentIconTheme.color,
            elevation: 4.0,
            tooltip: "Close Transaction",
          )
        : new FloatingActionButton.extended(
            onPressed: _openTransaction,
            icon: Icon(Icons.add),
            label: new Text("添加任务"),
            foregroundColor: Theme.of(context).iconTheme.color,
            backgroundColor: Theme.of(context).accentIconTheme.color,
            elevation: 4.0,
            tooltip: "添加任务",
          );
  }

  final portfolioColumnProps = [.25, .35, .3];

  Future<Null> _refreshPortfolioPage() async {
    updateDownloadDetail.notifyListeners();
    print("------reflesh------");
    setState(() {});
  }

  List portfolioSortType = ["holdings", true];
  List sortedPortfolioDisplay;
  _sortPortfolioDisplay() {
    sortedPortfolioDisplay = portfolioDisplay;
    if (portfolioSortType[1]) {
      if (portfolioSortType[0] == "holdings") {
        sortedPortfolioDisplay.sort((a, b) =>
            (b["price_usd"] * b["total_quantity"])
                .toDouble()
                .compareTo((a["price_usd"] * a["total_quantity"]).toDouble()));
      } else {
        sortedPortfolioDisplay.sort((a, b) =>
            b[portfolioSortType[0]].compareTo(a[portfolioSortType[0]]));
      }
    } else {
      if (portfolioSortType[0] == "holdings") {
        sortedPortfolioDisplay.sort((a, b) =>
            (a["price_usd"] * a["total_quantity"])
                .toDouble()
                .compareTo((b["price_usd"] * b["total_quantity"]).toDouble()));
      } else {
        sortedPortfolioDisplay.sort((a, b) =>
            a[portfolioSortType[0]].compareTo(b[portfolioSortType[0]]));
      }
    }
  }

  final PageStorageKey _downloadFinish = new PageStorageKey("DownloadFinish");
  final PageStorageKey _trash = new PageStorageKey("Trash");
  final PageStorageKey _portfolioKey = new PageStorageKey("portfolio");

  Widget portfolioPage(BuildContext context) {
    return new RefreshIndicator(
        key: _portfolioKey,
        onRefresh: _refreshPortfolioPage,
        child: new CustomScrollView(
          slivers: <Widget>[
            new SliverList(
                delegate: new SliverChildListDelegate(<Widget>[
              new Container(
                margin: const EdgeInsets.only(left: 6.0, right: 6.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        bottom: new BorderSide(
                            color: Theme.of(context).dividerColor,
                            width: 1.0))),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new InkWell(
                      onTap: () {
                        if (portfolioSortType[0] == "symbol") {
                          portfolioSortType[1] = !portfolioSortType[1];
                        } else {
                          portfolioSortType = ["symbol", false];
                        }
                        setState(() {
                          _sortPortfolioDisplay();
                        });
                      },
                      child: new Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        width: MediaQuery.of(context).size.width *
                            portfolioColumnProps[0],
                        child: portfolioSortType[0] == "symbol"
                            ? new Text(
                                portfolioSortType[1] == true
                                    ? "名称 " + upArrow
                                    : "名称 " + downArrow,
                                style: Theme.of(context).textTheme.body2)
                            : new Text(
                                "名称",
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .apply(color: Theme.of(context).hintColor),
                              ),
                      ),
                    ),
                    new InkWell(
                      onTap: () {
                        if (portfolioSortType[0] == "holdings") {
                          portfolioSortType[1] = !portfolioSortType[1];
                        } else {
                          portfolioSortType = ["holdings", true];
                        }
                        setState(() {
                          _sortPortfolioDisplay();
                        });
                      },
                      child: new Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        width: MediaQuery.of(context).size.width *
                            portfolioColumnProps[1],
                        child: portfolioSortType[0] == "holdings"
                            ? new Text(
                                portfolioSortType[1] == true
                                    ? "大小 " + downArrow
                                    : "大小 " + upArrow,
                                style: Theme.of(context).textTheme.body2)
                            : new Text("大小",
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .apply(color: Theme.of(context).hintColor)),
                      ),
                    ),
                    new InkWell(
                      onTap: () {
                        if (portfolioSortType[0] == "percent_change_24h") {
                          portfolioSortType[1] = !portfolioSortType[1];
                        } else {
                          portfolioSortType = ["percent_change_24h", true];
                        }
                        setState(() {
                          _sortPortfolioDisplay();
                        });
                      },
                      child: new Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        width: MediaQuery.of(context).size.width *
                            portfolioColumnProps[2],
                        child: portfolioSortType[0] == "percent_change_24h"
                            ? new Text(
                                portfolioSortType[1] == true
                                    ? "速度 " + downArrow
                                    : "速度 " + upArrow,
                                style: Theme.of(context).textTheme.body2)
                            : new Text("速度",
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .apply(color: Theme.of(context).hintColor)),
                      ),
                    ),
                  ],
                ),
              ),
            ])),
            ValueListenableBuilder(
              builder: (BuildContext context, int value, Widget child) {
                return downloadListData["正在下载"].length != 0
                    ? ListItemDownloading(context)
                    : new SliverFillRemaining(
                        child: new Container(
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.symmetric(vertical: 40.0),
                            child: new Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text("当前无进行中任务",
                                    style: Theme.of(context).textTheme.caption),
                              ],
                            )));
              },
              valueListenable: updateDownloadDetail,
              // 如果child 的构建成本很高，并且不依赖于通知程序的值，则child参数非常有用。
              // child: DownloadDetail(item.expandedValue),
            )
          ],
        ));
  }

  Future<Null> _refresdownloadFinishPage() async {
    updateStatus("下载完成");
    setState(() {});
  }

  Widget downloadFinish(BuildContext context) {
    return new RefreshIndicator(
        key: _downloadFinish,
        onRefresh: _refresdownloadFinishPage,
        child: new CustomScrollView(
          slivers: <Widget>[
            new SliverList(
                delegate: new SliverChildListDelegate(<Widget>[
              new Container(
                margin: const EdgeInsets.only(left: 6.0, right: 6.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        bottom: new BorderSide(
                            color: Theme.of(context).dividerColor,
                            width: 1.0))),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new InkWell(
                      onTap: () {
                        if (portfolioSortType[0] == "symbol") {
                          portfolioSortType[1] = !portfolioSortType[1];
                        } else {
                          portfolioSortType = ["symbol", false];
                        }
                        setState(() {
                          _sortPortfolioDisplay();
                        });
                      },
                      child: new Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        width: MediaQuery.of(context).size.width *
                            portfolioColumnProps[0],
                        child: portfolioSortType[0] == "symbol"
                            ? new Text(
                                portfolioSortType[1] == true
                                    ? "名称 " + upArrow
                                    : "名称 " + downArrow,
                                style: Theme.of(context).textTheme.body2)
                            : new Text(
                                "名称",
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .apply(color: Theme.of(context).hintColor),
                              ),
                      ),
                    ),
                    new InkWell(
                      onTap: () {
                        if (portfolioSortType[0] == "holdings") {
                          portfolioSortType[1] = !portfolioSortType[1];
                        } else {
                          portfolioSortType = ["holdings", true];
                        }
                        setState(() {
                          _sortPortfolioDisplay();
                        });
                      },
                      child: new Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        width: MediaQuery.of(context).size.width *
                            portfolioColumnProps[1],
                        child: portfolioSortType[0] == "holdings"
                            ? new Text(
                                portfolioSortType[1] == true
                                    ? "大小 " + downArrow
                                    : "大小 " + upArrow,
                                style: Theme.of(context).textTheme.body2)
                            : new Text("大小",
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .apply(color: Theme.of(context).hintColor)),
                      ),
                    ),
                    new InkWell(
                      onTap: () {
                        if (portfolioSortType[0] == "percent_change_24h") {
                          portfolioSortType[1] = !portfolioSortType[1];
                        } else {
                          portfolioSortType = ["percent_change_24h", true];
                        }
                        setState(() {
                          _sortPortfolioDisplay();
                        });
                      },
                      child: new Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        width: MediaQuery.of(context).size.width *
                            portfolioColumnProps[2],
                        child: portfolioSortType[0] == "percent_change_24h"
                            ? new Text(
                                portfolioSortType[1] == true
                                    ? "完成时间 " + downArrow
                                    : "完成时间 " + upArrow,
                                style: Theme.of(context).textTheme.body2)
                            : new Text("完成时间",
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .apply(color: Theme.of(context).hintColor)),
                      ),
                    ),
                  ],
                ),
              ),
            ])),
            ValueListenableBuilder(
              builder: (BuildContext context, int value, Widget child) {
                return downloadListData["下载完成"].length != 0
                    ? ListItemDownFinish(context)
                    : new SliverFillRemaining(
                        child: new Container(
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.symmetric(vertical: 40.0),
                            child: new Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text("还没有完成的任务",
                                    style: Theme.of(context).textTheme.caption),
                              ],
                            )));
              },
              valueListenable: updateDownloadDetail,
              // 如果child 的构建成本很高，并且不依赖于通知程序的值，则child参数非常有用。
              // child: DownloadDetail(item.expandedValue),
            )
          ],
        ));
  }

  Widget trash(BuildContext context) {
    return new RefreshIndicator(
        key: _trash,
        onRefresh: _refreshPortfolioPage,
        child: new CustomScrollView(
          slivers: <Widget>[
            new SliverList(
                delegate: new SliverChildListDelegate(<Widget>[
              new Container(
                margin: const EdgeInsets.only(left: 6.0, right: 6.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        bottom: new BorderSide(
                            color: Theme.of(context).dividerColor,
                            width: 1.0))),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new InkWell(
                      onTap: () {
                        if (portfolioSortType[0] == "symbol") {
                          portfolioSortType[1] = !portfolioSortType[1];
                        } else {
                          portfolioSortType = ["symbol", false];
                        }
                        setState(() {
                          _sortPortfolioDisplay();
                        });
                      },
                      child: new Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        width: MediaQuery.of(context).size.width *
                            portfolioColumnProps[0],
                        child: portfolioSortType[0] == "symbol"
                            ? new Text(
                                portfolioSortType[1] == true
                                    ? "名称 " + upArrow
                                    : "名称 " + downArrow,
                                style: Theme.of(context).textTheme.body2)
                            : new Text(
                                "名称",
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .apply(color: Theme.of(context).hintColor),
                              ),
                      ),
                    ),
                    new InkWell(
                      onTap: () {
                        if (portfolioSortType[0] == "holdings") {
                          portfolioSortType[1] = !portfolioSortType[1];
                        } else {
                          portfolioSortType = ["holdings", true];
                        }
                        setState(() {
                          _sortPortfolioDisplay();
                        });
                      },
                      child: new Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        width: MediaQuery.of(context).size.width *
                            portfolioColumnProps[1],
                        child: portfolioSortType[0] == "holdings"
                            ? new Text(
                                portfolioSortType[1] == true
                                    ? "大小 " + downArrow
                                    : "大小 " + upArrow,
                                style: Theme.of(context).textTheme.body2)
                            : new Text("大小",
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .apply(color: Theme.of(context).hintColor)),
                      ),
                    ),
                    new InkWell(
                      onTap: () {
                        if (portfolioSortType[0] == "percent_change_24h") {
                          portfolioSortType[1] = !portfolioSortType[1];
                        } else {
                          portfolioSortType = ["percent_change_24h", true];
                        }
                        setState(() {
                          _sortPortfolioDisplay();
                        });
                      },
                      child: new Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        width: MediaQuery.of(context).size.width *
                            portfolioColumnProps[2],
                        child: portfolioSortType[0] == "percent_change_24h"
                            ? new Text(
                                portfolioSortType[1] == true
                                    ? "删除时间 " + downArrow
                                    : "删除时间 " + upArrow,
                                style: Theme.of(context).textTheme.body2)
                            : new Text("删除时间",
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .apply(color: Theme.of(context).hintColor)),
                      ),
                    ),
                  ],
                ),
              ),
            ])),
            portfolioMap.isNotEmpty
                ? new SliverList(
                    delegate: new SliverChildBuilderDelegate(
                        (context, index) => new ListItemTrash(
                            sortedPortfolioDisplay[index],
                            portfolioColumnProps),
                        childCount: sortedPortfolioDisplay != null
                            ? sortedPortfolioDisplay.length
                            : 0))
                : new SliverFillRemaining(
                    child: new Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.symmetric(vertical: 40.0),
                        child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text("还没有完成的任务",
                                style: Theme.of(context).textTheme.caption),
                          ],
                        ))),
          ],
        ));
  }
}
