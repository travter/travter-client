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
  Future<RequestResult> createCollaborativeJourney(
      CollaborativeJourney collaborativeJourney) async {
    try {
      await _firestore
          .collection('collaborative_journeys')
          .add(collaborativeJourney.toJson())
          .onError(
            (error, _) => throw FirestoreException(error.toString()),
          );
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }

    return right(unit);
  }

  @override
  Future<RequestResult> createExpense(Expense expense) async {
    try {
      await _firestore.collection('expenses').add(expense.toJson()).onError(
            (error, _) => throw FirestoreException(error.toString()),
          );
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }

    return right(unit);
  }

  @override
  Future<RequestResult> createJourney(Journey journey) async {
    try {
      await _firestore.collection('journeys').add(journey.toJson()).onError(
            (error, _) => throw FirestoreException(error.toString()),
          );
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
    return right(unit);
  }

  @override
  Future<RequestResult> removeCollaborativeJourney(String id) async {
    try {
      await _firestore.collection('collaborative_journeys').doc(id).delete();
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }

    return right(unit);
  }

  @override
  Future<RequestResult> removeExpense(String id) async {
    try {
      await _firestore.collection('expenses').doc(id).delete();
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
    return right(unit);
  }

  @override
  Future<RequestResult> removeExpenseTracker(String id) async {
    try {
      await _firestore.collection('expense_trackers').doc(id).delete();
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
    return right(unit);
  }

  @override
  Future<RequestResult> removeJourney(String id) async {
    try {
      await _firestore.collection('journeys').doc(id).delete();
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
    return right(unit);
  }

  @override
  Future<RequestResult> updateCollaborativeJourney(
      CollaborativeJourney collaborativeJourney) async {
    try {
      await _firestore
          .collection('collaborative_journeys')
          .doc(collaborativeJourney.id)
          .update(collaborativeJourney.toJson());
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
    return right(unit);
  }

  @override
  Future<RequestResult> updateExpense(Expense expense) async {
    try {
      await _firestore
          .collection('expenses')
          .doc(expense.id)
          .update(expense.toJson());
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
    return right(unit);
  }

  @override
  Future<RequestResult> updateExpenseTracker(ExpensesTracker tracker) async {
    try {
      await _firestore
          .collection('expense_trackers')
          .doc(tracker.id)
          .update(tracker.toJson());
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
    return right(unit);
  }

  @override
  Future<RequestResult> updateJourney(Journey journey) async {
    try {
      await _firestore
          .collection('journeys')
          .doc(journey.id)
          .update(journey.toJson());
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
    return right(unit);
  }
}