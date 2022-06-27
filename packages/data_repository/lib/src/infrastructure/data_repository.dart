import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../domain/core/typedefs.dart';
import '../domain/data_repository_interface.dart';
import '../domain/expenses_tracker/expenses_tracker.dart';

class DataRepository implements DataRepositoryInterface {
  DataRepository({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Future<RequestResult> createExpenseTracker(ExpensesTracker tracker) async {
    await _firestore
        .collection('users')
        .doc(tracker.ownerId)
        .collection('expense_trackers')
        .add(tracker.toJson());

    return right(unit);
  }
}
