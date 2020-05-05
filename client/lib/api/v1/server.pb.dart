///
//  Generated code. Do not modify.
//  source: server.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Download extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Download', package: const $pb.PackageName('server'), createEmptyInstance: create)
    ..aOS(1, 'URL', protoName: 'URL')
    ..aOS(2, 'FilePath', protoName: 'FilePath')
    ..aOS(3, 'FileName', protoName: 'FileName')
    ..aInt64(4, 'DownloadSize', protoName: 'DownloadSize')
    ..a<$core.double>(5, 'Progress', $pb.PbFieldType.OD, protoName: 'Progress')
    ..aInt64(6, 'FileSize', protoName: 'FileSize')
    ..aOS(7, 'ErrorReason', protoName: 'ErrorReason')
    ..a<$core.int>(8, 'FileRemoved', $pb.PbFieldType.O3, protoName: 'FileRemoved')
    ..a<$core.int>(9, 'DownloadError', $pb.PbFieldType.O3, protoName: 'DownloadError')
    ..a<$core.int>(10, 'Downloading', $pb.PbFieldType.O3, protoName: 'Downloading')
    ..a<$core.int>(11, 'Suspend', $pb.PbFieldType.O3, protoName: 'Suspend')
    ..a<$core.int>(12, 'DownloadFinish', $pb.PbFieldType.O3, protoName: 'DownloadFinish')
    ..a<$core.int>(13, 'Trash', $pb.PbFieldType.O3, protoName: 'Trash')
    ..a<$core.int>(14, 'OpsDelJob', $pb.PbFieldType.O3, protoName: 'OpsDelJob')
    ..a<$core.int>(15, 'OpsDelJobComplete', $pb.PbFieldType.O3, protoName: 'OpsDelJobComplete')
    ..hasRequiredFields = false
  ;

  Download._() : super();
  factory Download() => create();
  factory Download.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Download.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Download clone() => Download()..mergeFromMessage(this);
  Download copyWith(void Function(Download) updates) => super.copyWith((message) => updates(message as Download));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Download create() => Download._();
  Download createEmptyInstance() => create();
  static $pb.PbList<Download> createRepeated() => $pb.PbList<Download>();
  @$core.pragma('dart2js:noInline')
  static Download getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Download>(create);
  static Download _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uRL => $_getSZ(0);
  @$pb.TagNumber(1)
  set uRL($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasURL() => $_has(0);
  @$pb.TagNumber(1)
  void clearURL() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get filePath => $_getSZ(1);
  @$pb.TagNumber(2)
  set filePath($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFilePath() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilePath() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fileName => $_getSZ(2);
  @$pb.TagNumber(3)
  set fileName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFileName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileName() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get downloadSize => $_getI64(3);
  @$pb.TagNumber(4)
  set downloadSize($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDownloadSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearDownloadSize() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get progress => $_getN(4);
  @$pb.TagNumber(5)
  set progress($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasProgress() => $_has(4);
  @$pb.TagNumber(5)
  void clearProgress() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get fileSize => $_getI64(5);
  @$pb.TagNumber(6)
  set fileSize($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFileSize() => $_has(5);
  @$pb.TagNumber(6)
  void clearFileSize() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get errorReason => $_getSZ(6);
  @$pb.TagNumber(7)
  set errorReason($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasErrorReason() => $_has(6);
  @$pb.TagNumber(7)
  void clearErrorReason() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get fileRemoved => $_getIZ(7);
  @$pb.TagNumber(8)
  set fileRemoved($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFileRemoved() => $_has(7);
  @$pb.TagNumber(8)
  void clearFileRemoved() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get downloadError => $_getIZ(8);
  @$pb.TagNumber(9)
  set downloadError($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDownloadError() => $_has(8);
  @$pb.TagNumber(9)
  void clearDownloadError() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get downloading => $_getIZ(9);
  @$pb.TagNumber(10)
  set downloading($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDownloading() => $_has(9);
  @$pb.TagNumber(10)
  void clearDownloading() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get suspend => $_getIZ(10);
  @$pb.TagNumber(11)
  set suspend($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSuspend() => $_has(10);
  @$pb.TagNumber(11)
  void clearSuspend() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get downloadFinish => $_getIZ(11);
  @$pb.TagNumber(12)
  set downloadFinish($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasDownloadFinish() => $_has(11);
  @$pb.TagNumber(12)
  void clearDownloadFinish() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get trash => $_getIZ(12);
  @$pb.TagNumber(13)
  set trash($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasTrash() => $_has(12);
  @$pb.TagNumber(13)
  void clearTrash() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get opsDelJob => $_getIZ(13);
  @$pb.TagNumber(14)
  set opsDelJob($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasOpsDelJob() => $_has(13);
  @$pb.TagNumber(14)
  void clearOpsDelJob() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get opsDelJobComplete => $_getIZ(14);
  @$pb.TagNumber(15)
  set opsDelJobComplete($core.int v) { $_setSignedInt32(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasOpsDelJobComplete() => $_has(14);
  @$pb.TagNumber(15)
  void clearOpsDelJobComplete() => clearField(15);
}

class AddTaskIn extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AddTaskIn', package: const $pb.PackageName('server'), createEmptyInstance: create)
    ..aOS(1, 'Link', protoName: 'Link')
    ..hasRequiredFields = false
  ;

  AddTaskIn._() : super();
  factory AddTaskIn() => create();
  factory AddTaskIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddTaskIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AddTaskIn clone() => AddTaskIn()..mergeFromMessage(this);
  AddTaskIn copyWith(void Function(AddTaskIn) updates) => super.copyWith((message) => updates(message as AddTaskIn));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddTaskIn create() => AddTaskIn._();
  AddTaskIn createEmptyInstance() => create();
  static $pb.PbList<AddTaskIn> createRepeated() => $pb.PbList<AddTaskIn>();
  @$core.pragma('dart2js:noInline')
  static AddTaskIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddTaskIn>(create);
  static AddTaskIn _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get link => $_getSZ(0);
  @$pb.TagNumber(1)
  set link($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLink() => $_has(0);
  @$pb.TagNumber(1)
  void clearLink() => clearField(1);
}

class AddTaskOut extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AddTaskOut', package: const $pb.PackageName('server'), createEmptyInstance: create)
    ..aOS(1, 'ErrorMsg', protoName: 'ErrorMsg')
    ..hasRequiredFields = false
  ;

  AddTaskOut._() : super();
  factory AddTaskOut() => create();
  factory AddTaskOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddTaskOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AddTaskOut clone() => AddTaskOut()..mergeFromMessage(this);
  AddTaskOut copyWith(void Function(AddTaskOut) updates) => super.copyWith((message) => updates(message as AddTaskOut));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddTaskOut create() => AddTaskOut._();
  AddTaskOut createEmptyInstance() => create();
  static $pb.PbList<AddTaskOut> createRepeated() => $pb.PbList<AddTaskOut>();
  @$core.pragma('dart2js:noInline')
  static AddTaskOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddTaskOut>(create);
  static AddTaskOut _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get errorMsg => $_getSZ(0);
  @$pb.TagNumber(1)
  set errorMsg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErrorMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorMsg() => clearField(1);
}

class SelectDownLoadPathIn extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SelectDownLoadPathIn', package: const $pb.PackageName('server'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  SelectDownLoadPathIn._() : super();
  factory SelectDownLoadPathIn() => create();
  factory SelectDownLoadPathIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SelectDownLoadPathIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SelectDownLoadPathIn clone() => SelectDownLoadPathIn()..mergeFromMessage(this);
  SelectDownLoadPathIn copyWith(void Function(SelectDownLoadPathIn) updates) => super.copyWith((message) => updates(message as SelectDownLoadPathIn));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SelectDownLoadPathIn create() => SelectDownLoadPathIn._();
  SelectDownLoadPathIn createEmptyInstance() => create();
  static $pb.PbList<SelectDownLoadPathIn> createRepeated() => $pb.PbList<SelectDownLoadPathIn>();
  @$core.pragma('dart2js:noInline')
  static SelectDownLoadPathIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SelectDownLoadPathIn>(create);
  static SelectDownLoadPathIn _defaultInstance;
}

class SelectDownLoadPathOut extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SelectDownLoadPathOut', package: const $pb.PackageName('server'), createEmptyInstance: create)
    ..aOS(1, 'ErrorMsg', protoName: 'ErrorMsg')
    ..aOS(2, 'PathDir', protoName: 'PathDir')
    ..hasRequiredFields = false
  ;

  SelectDownLoadPathOut._() : super();
  factory SelectDownLoadPathOut() => create();
  factory SelectDownLoadPathOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SelectDownLoadPathOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SelectDownLoadPathOut clone() => SelectDownLoadPathOut()..mergeFromMessage(this);
  SelectDownLoadPathOut copyWith(void Function(SelectDownLoadPathOut) updates) => super.copyWith((message) => updates(message as SelectDownLoadPathOut));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SelectDownLoadPathOut create() => SelectDownLoadPathOut._();
  SelectDownLoadPathOut createEmptyInstance() => create();
  static $pb.PbList<SelectDownLoadPathOut> createRepeated() => $pb.PbList<SelectDownLoadPathOut>();
  @$core.pragma('dart2js:noInline')
  static SelectDownLoadPathOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SelectDownLoadPathOut>(create);
  static SelectDownLoadPathOut _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get errorMsg => $_getSZ(0);
  @$pb.TagNumber(1)
  set errorMsg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErrorMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorMsg() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get pathDir => $_getSZ(1);
  @$pb.TagNumber(2)
  set pathDir($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPathDir() => $_has(1);
  @$pb.TagNumber(2)
  void clearPathDir() => clearField(2);
}

class GetDownloadingIn extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetDownloadingIn', package: const $pb.PackageName('server'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetDownloadingIn._() : super();
  factory GetDownloadingIn() => create();
  factory GetDownloadingIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDownloadingIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetDownloadingIn clone() => GetDownloadingIn()..mergeFromMessage(this);
  GetDownloadingIn copyWith(void Function(GetDownloadingIn) updates) => super.copyWith((message) => updates(message as GetDownloadingIn));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetDownloadingIn create() => GetDownloadingIn._();
  GetDownloadingIn createEmptyInstance() => create();
  static $pb.PbList<GetDownloadingIn> createRepeated() => $pb.PbList<GetDownloadingIn>();
  @$core.pragma('dart2js:noInline')
  static GetDownloadingIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDownloadingIn>(create);
  static GetDownloadingIn _defaultInstance;
}

class GetDownloadingOut extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetDownloadingOut', package: const $pb.PackageName('server'), createEmptyInstance: create)
    ..aOS(1, 'ErrorMsg', protoName: 'ErrorMsg')
    ..pc<Download>(2, 'Download', $pb.PbFieldType.PM, protoName: 'Download', subBuilder: Download.create)
    ..hasRequiredFields = false
  ;

  GetDownloadingOut._() : super();
  factory GetDownloadingOut() => create();
  factory GetDownloadingOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDownloadingOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetDownloadingOut clone() => GetDownloadingOut()..mergeFromMessage(this);
  GetDownloadingOut copyWith(void Function(GetDownloadingOut) updates) => super.copyWith((message) => updates(message as GetDownloadingOut));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetDownloadingOut create() => GetDownloadingOut._();
  GetDownloadingOut createEmptyInstance() => create();
  static $pb.PbList<GetDownloadingOut> createRepeated() => $pb.PbList<GetDownloadingOut>();
  @$core.pragma('dart2js:noInline')
  static GetDownloadingOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDownloadingOut>(create);
  static GetDownloadingOut _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get errorMsg => $_getSZ(0);
  @$pb.TagNumber(1)
  set errorMsg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErrorMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorMsg() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Download> get download => $_getList(1);
}

class GetDownloadFinishIn extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetDownloadFinishIn', package: const $pb.PackageName('server'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetDownloadFinishIn._() : super();
  factory GetDownloadFinishIn() => create();
  factory GetDownloadFinishIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDownloadFinishIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetDownloadFinishIn clone() => GetDownloadFinishIn()..mergeFromMessage(this);
  GetDownloadFinishIn copyWith(void Function(GetDownloadFinishIn) updates) => super.copyWith((message) => updates(message as GetDownloadFinishIn));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetDownloadFinishIn create() => GetDownloadFinishIn._();
  GetDownloadFinishIn createEmptyInstance() => create();
  static $pb.PbList<GetDownloadFinishIn> createRepeated() => $pb.PbList<GetDownloadFinishIn>();
  @$core.pragma('dart2js:noInline')
  static GetDownloadFinishIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDownloadFinishIn>(create);
  static GetDownloadFinishIn _defaultInstance;
}

class GetDownloadFinishOut extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetDownloadFinishOut', package: const $pb.PackageName('server'), createEmptyInstance: create)
    ..aOS(1, 'ErrorMsg', protoName: 'ErrorMsg')
    ..pc<Download>(2, 'Download', $pb.PbFieldType.PM, protoName: 'Download', subBuilder: Download.create)
    ..hasRequiredFields = false
  ;

  GetDownloadFinishOut._() : super();
  factory GetDownloadFinishOut() => create();
  factory GetDownloadFinishOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDownloadFinishOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetDownloadFinishOut clone() => GetDownloadFinishOut()..mergeFromMessage(this);
  GetDownloadFinishOut copyWith(void Function(GetDownloadFinishOut) updates) => super.copyWith((message) => updates(message as GetDownloadFinishOut));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetDownloadFinishOut create() => GetDownloadFinishOut._();
  GetDownloadFinishOut createEmptyInstance() => create();
  static $pb.PbList<GetDownloadFinishOut> createRepeated() => $pb.PbList<GetDownloadFinishOut>();
  @$core.pragma('dart2js:noInline')
  static GetDownloadFinishOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDownloadFinishOut>(create);
  static GetDownloadFinishOut _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get errorMsg => $_getSZ(0);
  @$pb.TagNumber(1)
  set errorMsg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErrorMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorMsg() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Download> get download => $_getList(1);
}

class GetTrashIn extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetTrashIn', package: const $pb.PackageName('server'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetTrashIn._() : super();
  factory GetTrashIn() => create();
  factory GetTrashIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTrashIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetTrashIn clone() => GetTrashIn()..mergeFromMessage(this);
  GetTrashIn copyWith(void Function(GetTrashIn) updates) => super.copyWith((message) => updates(message as GetTrashIn));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTrashIn create() => GetTrashIn._();
  GetTrashIn createEmptyInstance() => create();
  static $pb.PbList<GetTrashIn> createRepeated() => $pb.PbList<GetTrashIn>();
  @$core.pragma('dart2js:noInline')
  static GetTrashIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTrashIn>(create);
  static GetTrashIn _defaultInstance;
}

class GetTrashOut extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetTrashOut', package: const $pb.PackageName('server'), createEmptyInstance: create)
    ..aOS(1, 'ErrorMsg', protoName: 'ErrorMsg')
    ..pc<Download>(2, 'Download', $pb.PbFieldType.PM, protoName: 'Download', subBuilder: Download.create)
    ..hasRequiredFields = false
  ;

  GetTrashOut._() : super();
  factory GetTrashOut() => create();
  factory GetTrashOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTrashOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetTrashOut clone() => GetTrashOut()..mergeFromMessage(this);
  GetTrashOut copyWith(void Function(GetTrashOut) updates) => super.copyWith((message) => updates(message as GetTrashOut));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTrashOut create() => GetTrashOut._();
  GetTrashOut createEmptyInstance() => create();
  static $pb.PbList<GetTrashOut> createRepeated() => $pb.PbList<GetTrashOut>();
  @$core.pragma('dart2js:noInline')
  static GetTrashOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTrashOut>(create);
  static GetTrashOut _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get errorMsg => $_getSZ(0);
  @$pb.TagNumber(1)
  set errorMsg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErrorMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorMsg() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Download> get download => $_getList(1);
}

class NotifyStreamIn extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NotifyStreamIn', package: const $pb.PackageName('server'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  NotifyStreamIn._() : super();
  factory NotifyStreamIn() => create();
  factory NotifyStreamIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotifyStreamIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  NotifyStreamIn clone() => NotifyStreamIn()..mergeFromMessage(this);
  NotifyStreamIn copyWith(void Function(NotifyStreamIn) updates) => super.copyWith((message) => updates(message as NotifyStreamIn));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NotifyStreamIn create() => NotifyStreamIn._();
  NotifyStreamIn createEmptyInstance() => create();
  static $pb.PbList<NotifyStreamIn> createRepeated() => $pb.PbList<NotifyStreamIn>();
  @$core.pragma('dart2js:noInline')
  static NotifyStreamIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotifyStreamIn>(create);
  static NotifyStreamIn _defaultInstance;
}

class NotifyStreamOut extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NotifyStreamOut', package: const $pb.PackageName('server'), createEmptyInstance: create)
    ..aOS(1, 'ErrorMsg', protoName: 'ErrorMsg')
    ..pc<Download>(2, 'Download', $pb.PbFieldType.PM, protoName: 'Download', subBuilder: Download.create)
    ..aOS(3, 'title')
    ..hasRequiredFields = false
  ;

  NotifyStreamOut._() : super();
  factory NotifyStreamOut() => create();
  factory NotifyStreamOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotifyStreamOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  NotifyStreamOut clone() => NotifyStreamOut()..mergeFromMessage(this);
  NotifyStreamOut copyWith(void Function(NotifyStreamOut) updates) => super.copyWith((message) => updates(message as NotifyStreamOut));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NotifyStreamOut create() => NotifyStreamOut._();
  NotifyStreamOut createEmptyInstance() => create();
  static $pb.PbList<NotifyStreamOut> createRepeated() => $pb.PbList<NotifyStreamOut>();
  @$core.pragma('dart2js:noInline')
  static NotifyStreamOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotifyStreamOut>(create);
  static NotifyStreamOut _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get errorMsg => $_getSZ(0);
  @$pb.TagNumber(1)
  set errorMsg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErrorMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorMsg() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Download> get download => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);
}

