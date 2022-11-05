import 'package:grpc/grpc.dart' ;

import '../domain/trackers_repository_interface.dart';
import '../proto/gen/trackers.pb.dart' ;
import '../proto/gen/trackers.pbgrpc.dart' ;

class TrackersRepository implements TrackersRepositoryInterface {
  @override
  Future<void> getTracker(int id) async {
    final channel = ClientChannel(
      '10.0.2.2',
      port: 50051,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
        codecRegistry:
        CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
      ),
    );
    final client = TrackerClient(channel);
    try {
      final response = await client.getTrackers(GetTrackersRequest()..id ='$id');
      print("LOOOOOOOOOOOOOL: ${response}");
    } catch (e) {
      print("DUPA :( $e");
    }

    await channel.shutdown();
  }
}