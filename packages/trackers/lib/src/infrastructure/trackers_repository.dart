import 'package:grpc/grpc.dart';
import 'package:grpc/service_api.dart';

import '../client/grpc_client.dart';
import '../domain/trackers_repository_interface.dart';
import '../proto/gen/trackers.pb.dart';

class TrackersRepository implements TrackersRepositoryInterface {
  @override
  Future<GetTrackersResponse> getTracker(int id) async {
    final request = GetTrackersRequest.create()..id = '$id';
    final response = await client.getTrackers(request);

    return response;
  }
}