import 'package:cloud_firestore/cloud_firestore.dart';

class DataRepository {
  DataRepository({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;
}
