
import 'package:grpc/service_api.dart';

import '../proto/gen/trackers.pb.dart';

abstract class TrackersRepositoryInterface{
  Future<GetTrackersResponse> getTracker(int id);
}
