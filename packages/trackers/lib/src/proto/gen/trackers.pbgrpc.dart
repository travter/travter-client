///
//  Generated code. Do not modify.
//  source: trackers.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'trackers.pb.dart' as $0;
export 'trackers.pb.dart';

class TrackerClient extends $grpc.Client {
  static final _$getTrackers =
      $grpc.ClientMethod<$0.GetTrackersRequest, $0.GetTrackersResponse>(
          '/trackers.Tracker/GetTrackers',
          ($0.GetTrackersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetTrackersResponse.fromBuffer(value));

  TrackerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetTrackersResponse> getTrackers(
      $0.GetTrackersRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTrackers, request, options: options);
  }
}

abstract class TrackerServiceBase extends $grpc.Service {
  $core.String get $name => 'trackers.Tracker';

  TrackerServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.GetTrackersRequest, $0.GetTrackersResponse>(
            'GetTrackers',
            getTrackers_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetTrackersRequest.fromBuffer(value),
            ($0.GetTrackersResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetTrackersResponse> getTrackers_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetTrackersRequest> request) async {
    return getTrackers(call, await request);
  }

  $async.Future<$0.GetTrackersResponse> getTrackers(
      $grpc.ServiceCall call, $0.GetTrackersRequest request);
}
