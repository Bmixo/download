///
//  Generated code. Do not modify.
//  source: server.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Download$json = const {
  '1': 'Download',
  '2': const [
    const {'1': 'URL', '3': 1, '4': 1, '5': 9, '10': 'URL'},
    const {'1': 'FilePath', '3': 2, '4': 1, '5': 9, '10': 'FilePath'},
    const {'1': 'FileName', '3': 3, '4': 1, '5': 9, '10': 'FileName'},
    const {'1': 'DownloadSize', '3': 4, '4': 1, '5': 3, '10': 'DownloadSize'},
    const {'1': 'Progress', '3': 5, '4': 1, '5': 1, '10': 'Progress'},
    const {'1': 'FileSize', '3': 6, '4': 1, '5': 3, '10': 'FileSize'},
    const {'1': 'ErrorReason', '3': 7, '4': 1, '5': 9, '10': 'ErrorReason'},
    const {'1': 'FileRemoved', '3': 8, '4': 1, '5': 5, '10': 'FileRemoved'},
    const {'1': 'DownloadError', '3': 9, '4': 1, '5': 5, '10': 'DownloadError'},
    const {'1': 'Downloading', '3': 10, '4': 1, '5': 5, '10': 'Downloading'},
    const {'1': 'Suspend', '3': 11, '4': 1, '5': 5, '10': 'Suspend'},
    const {'1': 'DownloadFinish', '3': 12, '4': 1, '5': 5, '10': 'DownloadFinish'},
    const {'1': 'Trash', '3': 13, '4': 1, '5': 5, '10': 'Trash'},
    const {'1': 'OpsDelJob', '3': 14, '4': 1, '5': 5, '10': 'OpsDelJob'},
    const {'1': 'OpsDelJobComplete', '3': 15, '4': 1, '5': 5, '10': 'OpsDelJobComplete'},
    const {'1': 'DownloadBytesPerSecond', '3': 16, '4': 1, '5': 1, '10': 'DownloadBytesPerSecond'},
    const {'1': 'UploadBytesPerSecond', '3': 17, '4': 1, '5': 1, '10': 'UploadBytesPerSecond'},
  ],
};

const AddTaskIn$json = const {
  '1': 'AddTaskIn',
  '2': const [
    const {'1': 'Link', '3': 1, '4': 1, '5': 9, '10': 'Link'},
  ],
};

const AddTaskOut$json = const {
  '1': 'AddTaskOut',
  '2': const [
    const {'1': 'ErrorMsg', '3': 1, '4': 1, '5': 9, '10': 'ErrorMsg'},
  ],
};

const SelectDownLoadPathIn$json = const {
  '1': 'SelectDownLoadPathIn',
};

const SelectDownLoadPathOut$json = const {
  '1': 'SelectDownLoadPathOut',
  '2': const [
    const {'1': 'ErrorMsg', '3': 1, '4': 1, '5': 9, '10': 'ErrorMsg'},
    const {'1': 'PathDir', '3': 2, '4': 1, '5': 9, '10': 'PathDir'},
  ],
};

const GetDownloadingIn$json = const {
  '1': 'GetDownloadingIn',
};

const GetDownloadingOut$json = const {
  '1': 'GetDownloadingOut',
  '2': const [
    const {'1': 'ErrorMsg', '3': 1, '4': 1, '5': 9, '10': 'ErrorMsg'},
    const {'1': 'Download', '3': 2, '4': 3, '5': 11, '6': '.server.Download', '10': 'Download'},
  ],
};

const GetDownloadFinishIn$json = const {
  '1': 'GetDownloadFinishIn',
};

const GetDownloadFinishOut$json = const {
  '1': 'GetDownloadFinishOut',
  '2': const [
    const {'1': 'ErrorMsg', '3': 1, '4': 1, '5': 9, '10': 'ErrorMsg'},
    const {'1': 'Download', '3': 2, '4': 3, '5': 11, '6': '.server.Download', '10': 'Download'},
  ],
};

const GetTrashIn$json = const {
  '1': 'GetTrashIn',
};

const GetTrashOut$json = const {
  '1': 'GetTrashOut',
  '2': const [
    const {'1': 'ErrorMsg', '3': 1, '4': 1, '5': 9, '10': 'ErrorMsg'},
    const {'1': 'Download', '3': 2, '4': 3, '5': 11, '6': '.server.Download', '10': 'Download'},
  ],
};

const NotifyStreamIn$json = const {
  '1': 'NotifyStreamIn',
};

const NotifyStreamOut$json = const {
  '1': 'NotifyStreamOut',
  '2': const [
    const {'1': 'ErrorMsg', '3': 1, '4': 1, '5': 9, '10': 'ErrorMsg'},
    const {'1': 'Download', '3': 2, '4': 3, '5': 11, '6': '.server.Download', '10': 'Download'},
    const {'1': 'Title', '3': 3, '4': 1, '5': 9, '10': 'Title'},
    const {'1': 'DownloadBytesPerSecond', '3': 4, '4': 1, '5': 1, '10': 'DownloadBytesPerSecond'},
    const {'1': 'UploadBytesPerSecond', '3': 5, '4': 1, '5': 1, '10': 'UploadBytesPerSecond'},
  ],
};

const GetPathInfoIn$json = const {
  '1': 'GetPathInfoIn',
};

const GetPathInfoOut$json = const {
  '1': 'GetPathInfoOut',
  '2': const [
    const {'1': 'ErrorMsg', '3': 1, '4': 1, '5': 9, '10': 'ErrorMsg'},
    const {'1': 'DownloadPath', '3': 2, '4': 1, '5': 9, '10': 'DownloadPath'},
  ],
};

