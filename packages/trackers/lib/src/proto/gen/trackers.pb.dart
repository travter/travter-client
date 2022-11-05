///
//  Generated code. Do not modify.
//  source: trackers.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GetTrackersRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetTrackersRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'trackers'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  GetTrackersRequest._() : super();
  factory GetTrackersRequest({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory GetTrackersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTrackersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTrackersRequest clone() => GetTrackersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTrackersRequest copyWith(void Function(GetTrackersRequest) updates) => super.copyWith((message) => updates(message as GetTrackersRequest)) as GetTrackersRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTrackersRequest create() => GetTrackersRequest._();
  GetTrackersRequest createEmptyInstance() => create();
  static $pb.PbList<GetTrackersRequest> createRepeated() => $pb.PbList<GetTrackersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTrackersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTrackersRequest>(create);
  static GetTrackersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetTrackersResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetTrackersResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'trackers'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trackers')
    ..hasRequiredFields = false
  ;

  GetTrackersResponse._() : super();
  factory GetTrackersResponse({
    $core.String? trackers,
  }) {
    final _result = create();
    if (trackers != null) {
      _result.trackers = trackers;
    }
    return _result;
  }
  factory GetTrackersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTrackersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTrackersResponse clone() => GetTrackersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTrackersResponse copyWith(void Function(GetTrackersResponse) updates) => super.copyWith((message) => updates(message as GetTrackersResponse)) as GetTrackersResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTrackersResponse create() => GetTrackersResponse._();
  GetTrackersResponse createEmptyInstance() => create();
  static $pb.PbList<GetTrackersResponse> createRepeated() => $pb.PbList<GetTrackersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTrackersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTrackersResponse>(create);
  static GetTrackersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get trackers => $_getSZ(0);
  @$pb.TagNumber(1)
  set trackers($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrackers() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrackers() => clearField(1);
}

