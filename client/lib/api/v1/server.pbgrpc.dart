///
//  Generated code. Do not modify.
//  source: server.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'server.pb.dart' as $0;
export 'server.pb.dart';

class DownloadProviderClient extends $grpc.Client {
  static final _$addTask = $grpc.ClientMethod<$0.AddTaskIn, $0.AddTaskOut>(
      '/server.DownloadProvider/AddTask',
      ($0.AddTaskIn value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AddTaskOut.fromBuffer(value));
  static final _$selectDownLoadPath =
      $grpc.ClientMethod<$0.SelectDownLoadPathIn, $0.SelectDownLoadPathOut>(
          '/server.DownloadProvider/SelectDownLoadPath',
          ($0.SelectDownLoadPathIn value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SelectDownLoadPathOut.fromBuffer(value));
  static final _$getDownloading =
      $grpc.ClientMethod<$0.GetDownloadingIn, $0.GetDownloadingOut>(
          '/server.DownloadProvider/GetDownloading',
          ($0.GetDownloadingIn value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetDownloadingOut.fromBuffer(value));
  static final _$getDownloadFinish =
      $grpc.ClientMethod<$0.GetDownloadFinishIn, $0.GetDownloadFinishOut>(
          '/server.DownloadProvider/GetDownloadFinish',
          ($0.GetDownloadFinishIn value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetDownloadFinishOut.fromBuffer(value));
  static final _$getTrash = $grpc.ClientMethod<$0.GetTrashIn, $0.GetTrashOut>(
      '/server.DownloadProvider/GetTrash',
      ($0.GetTrashIn value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetTrashOut.fromBuffer(value));
  static final _$notifySteam =
      $grpc.ClientMethod<$0.NotifyStreamIn, $0.NotifyStreamOut>(
          '/server.DownloadProvider/NotifySteam',
          ($0.NotifyStreamIn value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.NotifyStreamOut.fromBuffer(value));

  DownloadProviderClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.AddTaskOut> addTask($0.AddTaskIn request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$addTask, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.SelectDownLoadPathOut> selectDownLoadPath(
      $0.SelectDownLoadPathIn request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$selectDownLoadPath, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.GetDownloadingOut> getDownloading(
      $0.GetDownloadingIn request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getDownloading, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.GetDownloadFinishOut> getDownloadFinish(
      $0.GetDownloadFinishIn request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getDownloadFinish, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.GetTrashOut> getTrash($0.GetTrashIn request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getTrash, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.NotifyStreamOut> notifySteam(
      $0.NotifyStreamIn request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$notifySteam, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class DownloadProviderServiceBase extends $grpc.Service {
  $core.String get $name => 'server.DownloadProvider';

  DownloadProviderServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AddTaskIn, $0.AddTaskOut>(
        'AddTask',
        addTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddTaskIn.fromBuffer(value),
        ($0.AddTaskOut value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.SelectDownLoadPathIn, $0.SelectDownLoadPathOut>(
            'SelectDownLoadPath',
            selectDownLoadPath_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.SelectDownLoadPathIn.fromBuffer(value),
            ($0.SelectDownLoadPathOut value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetDownloadingIn, $0.GetDownloadingOut>(
        'GetDownloading',
        getDownloading_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetDownloadingIn.fromBuffer(value),
        ($0.GetDownloadingOut value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetDownloadFinishIn, $0.GetDownloadFinishOut>(
            'GetDownloadFinish',
            getDownloadFinish_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetDownloadFinishIn.fromBuffer(value),
            ($0.GetDownloadFinishOut value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTrashIn, $0.GetTrashOut>(
        'GetTrash',
        getTrash_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTrashIn.fromBuffer(value),
        ($0.GetTrashOut value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.NotifyStreamIn, $0.NotifyStreamOut>(
        'NotifySteam',
        notifySteam_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.NotifyStreamIn.fromBuffer(value),
        ($0.NotifyStreamOut value) => value.writeToBuffer()));
  }

  $async.Future<$0.AddTaskOut> addTask_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AddTaskIn> request) async {
    return addTask(call, await request);
  }

  $async.Future<$0.SelectDownLoadPathOut> selectDownLoadPath_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.SelectDownLoadPathIn> request) async {
    return selectDownLoadPath(call, await request);
  }

  $async.Future<$0.GetDownloadingOut> getDownloading_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetDownloadingIn> request) async {
    return getDownloading(call, await request);
  }

  $async.Future<$0.GetDownloadFinishOut> getDownloadFinish_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetDownloadFinishIn> request) async {
    return getDownloadFinish(call, await request);
  }

  $async.Future<$0.GetTrashOut> getTrash_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetTrashIn> request) async {
    return getTrash(call, await request);
  }

  $async.Stream<$0.NotifyStreamOut> notifySteam_Pre(
      $grpc.ServiceCall call, $async.Future<$0.NotifyStreamIn> request) async* {
    yield* notifySteam(call, await request);
  }

  $async.Future<$0.AddTaskOut> addTask(
      $grpc.ServiceCall call, $0.AddTaskIn request);
  $async.Future<$0.SelectDownLoadPathOut> selectDownLoadPath(
      $grpc.ServiceCall call, $0.SelectDownLoadPathIn request);
  $async.Future<$0.GetDownloadingOut> getDownloading(
      $grpc.ServiceCall call, $0.GetDownloadingIn request);
  $async.Future<$0.GetDownloadFinishOut> getDownloadFinish(
      $grpc.ServiceCall call, $0.GetDownloadFinishIn request);
  $async.Future<$0.GetTrashOut> getTrash(
      $grpc.ServiceCall call, $0.GetTrashIn request);
  $async.Stream<$0.NotifyStreamOut> notifySteam(
      $grpc.ServiceCall call, $0.NotifyStreamIn request);
}
