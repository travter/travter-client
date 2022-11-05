import 'package:grpc/grpc.dart';

import '../proto/gen/trackers.pbgrpc.dart';

final channel = ClientChannel(
  'localhost',
  port: 50051,
);

final client = TrackerClient(channel);
