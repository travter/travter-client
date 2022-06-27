import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../domain/collaborative_journey/collaborative_journey.dart';
import '../domain/core/firestore_exception.dart';
import '../domain/core/typedefs.dart';
import '../domain/data_repository_interface.dart';
import '../domain/expenses_tracker/expense.dart';
import '../domain/expenses_tracker/expenses_tracker.dart';
import '../domain/journey/journey.dart';
import '../domain/request_failure.dart';

class DataRepository implements DataRepositoryInterface {
  DataRepository({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Future<RequestResult> createExpenseTracker(ExpensesTracker tracker) async {
    try {
      await _firestore
          .collection('users')
          .doc(tracker.ownerId)
          .collection('expense_trackers')
          .add(tracker.toJson())
          .onError(
            (error, _) => throw FirestoreException(error.toString()),
          );
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }

    return right(unit);
  }

  @override
  Future<RequestResult> createCollaborativeJourney(CollaborativeJourney collaborativeJourney) {
    // TODO: implement createCollaborativeJourney
    throw UnimplementedError();
  }

  @override
  Future<RequestResult> createExpense(Expense expense) {
    // TODO: implement createExpense
    throw UnimplementedError();
  }

  @override
  Future<RequestResult> createJourney(Journey journey) {
    // TODO: implement createJourney
    throw UnimplementedError();
  }

  @override
  Future<RequestResult> removeCollaborativeJourney(String id) {
    // TODO: implement removeCollaborativeJourney
    throw UnimplementedError();
  }

  @override
  Future<RequestResult> removeExpense(String id) {
    // TODO: implement removeExpense
    throw UnimplementedError();
  }

  @override
  Future<RequestFailure> removeExpenseTracker(String id) {
    // TODO: implement removeExpenseTracker
    throw UnimplementedError();
  }

  @override
  Future<RequestResult> removeJourney(String id) {
    // TODO: implement removeJourney
    throw UnimplementedError();
  }

  @override
  Future<RequestResult> updateCollaborativeJourney(CollaborativeJourney collaborativeJourney) {
    // TODO: implement updateCollaborativeJourney
    throw UnimplementedError();
  }

  @override
  Future<RequestResult> updateExpense(Expense expense) {
    // TODO: implement updateExpense
    throw UnimplementedError();
  }

  @override
  Future<RequestResult> updateExpenseTracker(ExpensesTracker tracker) {
    // TODO: implement updateExpenseTracker
    throw UnimplementedError();
  }

  @override
  Future<RequestResult> updateJourney(Journey journey) {
    // TODO: implement updateJourney
    throw UnimplementedError();
  }
}
