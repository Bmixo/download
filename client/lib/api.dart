import 'main.dart';
import 'api/v1/server.pb.dart';
//import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart' as fixnum;

Future<AddTaskOut> addTask(String link) async {
  return await stub.addTask(AddTaskIn()..link = link);
}

Future<GetDownloadingOut> getDownloading() async {
  return await stub.getDownloading(GetDownloadingIn());
}

Future<GetPathInfoOut> getPathInfo() async {
  return await stub.getPathInfo(GetPathInfoIn());
}

Future<GetDownloadFinishOut> getDownloadFinish() async {
  return await stub.getDownloadFinish(GetDownloadFinishIn());
}

Future<GetTrashOut> getTrash() async {
  return await stub.getTrash(GetTrashIn());
}

Future<SelectDownLoadPathOut> selectDownLoadPath() async {
  return await stub.selectDownLoadPath(SelectDownLoadPathIn());
}

notifySteam() async {
  while (true) {
    try {
      var responses = stub.notifySteam(NotifyStreamIn());
      //,options: CallOptions(timeout: Duration(seconds: 2)));
      await for (var note in responses) {
        switch (note.title) {
          case "正在下载":
            downloadListData["正在下载"] = note.download;
            break;
          case "下载完成":
            downloadListData["下载完成"] = note.download;
            break;
          case "垃圾箱":
            downloadListData["垃圾箱"] = note.download;
            break;
          case "uiReflesh":
            updateStatus("垃圾箱");
            updateStatus("正在下载");
            updateStatus("下载完成");
            break;
          default:
            print("Call: " + note.title);
            break;
        }
        downloadData.downloadBytesPerSecond = note.downloadBytesPerSecond;
        downloadData.uploadBytesPerSecond = note.uploadBytesPerSecond;
        updateDownloadDetail.notifyListeners();
      }
    } catch (e) {
    }
  }
}

void updateStatus(String type) async {
  switch (type) {
    case "正在下载":
      downloadListData["正在下载"] = (await getDownloading()).download;
      break;
    case "下载完成":
      downloadListData["下载完成"] = (await getDownloadFinish()).download;
      break;
    case "垃圾箱":
      downloadListData["垃圾箱"] = (await getTrash()).download;
      break;
  }
}
//fixnum.Int64 
double int642double(fixnum.Int64 intnum){
  return intnum.toDouble();
}
String calcSize(double byteSize) {
  // double byteSize = byteSizeInt.toDouble();
  double power = 1024;
  double n = 0;
  Map<int, String> powerN = {0: '', 1: 'KB', 2: 'MB', 3: 'GB', 4: 'TB'};
  while (byteSize > power) {
    byteSize /= power;
    n += 1;
    if (n >= 4) {
      break;
    }
  }
  return byteSize.toStringAsFixed(2) + powerN[n];
}
