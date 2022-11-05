
import 'package:grpc/service_api.dart';

import '../proto/gen/trackers.pb.dart';

abstract class TrackersRepositoryInterface{
  Future<void> getTracker(int id);
}
