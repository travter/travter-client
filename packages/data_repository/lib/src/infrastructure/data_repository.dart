import 'dart:io';

import 'package:auth_repository/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rxdart/subjects.dart';

import '../domain/collaborative_journey/collaborative_journey.dart';
import '../domain/core/firestore_exception.dart';
import '../domain/core/request_failure.dart';
import '../domain/core/typedefs.dart';
import '../domain/data_repository_interface.dart';
import '../domain/expenses_tracker/expense.dart';
import '../domain/expenses_tracker/expenses_tracker.dart';
import '../domain/journey/journey.dart';

class DataRepository implements DataRepositoryInterface {
  DataRepository({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  final _expensesStreamController =
      BehaviorSubject<List<ExpensesTracker>>.seeded(const []);
  final _journeysStreamController =
      BehaviorSubject<List<Journey>>.seeded(const []);
  final _collaborativeJourneysStreamController =
      BehaviorSubject<List<CollaborativeJourney>>.seeded(const []);

  @override
  Future<RequestResult<Unit>> createExpenseTracker(ExpensesTracker tracker) async {
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
  Future<RequestResult<Unit>> createCollaborativeJourney(
      CollaborativeJourney collaborativeJourney) async {
    try {
      final journeys = [..._collaborativeJourneysStreamController.value];

      await _firestore
          .collection('collaborative_journeys')
          .add(collaborativeJourney.toJson())
          .onError(
            (error, _) => throw FirestoreException(error.toString()),
          );
      journeys.add(collaborativeJourney);
      _collaborativeJourneysStreamController.add(journeys);
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }

    return right(unit);
  }

  @override
  Future<RequestResult<Unit>> createExpense(Expense expense) async {
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
  Future<RequestResult<Unit>> createJourney(Journey journey) async {
    try {
      final journeys = [..._journeysStreamController.value];
      await _firestore.collection('journeys').add(journey.toJson()).onError(
            (error, _) => throw FirestoreException(error.toString()),
          );
      journeys.add(journey);
      _journeysStreamController.add(journeys);
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
    return right(unit);
  }

  @override
  Future<RequestResult<Unit>> removeCollaborativeJourney(String id) async {
    try {
      await _firestore.collection('collaborative_journeys').doc(id).delete();
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }

    return right(unit);
  }

  @override
  Future<RequestResult<Unit>> removeExpense(String id) async {
    try {
      await _firestore.collection('expenses').doc(id).delete();
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
    return right(unit);
  }

  @override
  Future<RequestResult<Unit>> removeExpenseTracker(String id) async {
    try {
      await _firestore.collection('expense_trackers').doc(id).delete();
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
    return right(unit);
  }

  @override
  Future<RequestResult<Unit>> removeJourney(String id) async {
    try {
      await _firestore.collection('journeys').doc(id).delete();
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
    return right(unit);
  }

  @override
  Future<RequestResult<Unit>> updateCollaborativeJourney(
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
  Future<RequestResult<Unit>> updateExpense(Expense expense) async {
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
  Future<RequestResult<Unit>> updateExpenseTracker(ExpensesTracker tracker) async {
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
  Future<RequestResult<Unit>> updateJourney(Journey journey) async {
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

  @override
  Future<Either<RequestFailure, Stream<List<ExpensesTracker>>>>
      getAllUsersExpenseTrackers(String userId) async {
    try {
      final collection = _firestore.collection('expense_trackers');
      final query = await collection.where('ownerId', isEqualTo: userId).get();
      final trackers = query.docs
          .map(
            (el) => ExpensesTracker.fromJson(el.data()),
          )
          .toList();
      _expensesStreamController.add(trackers);
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }

    return right(_expensesStreamController.asBroadcastStream());
  }

  @override
  Future<Either<RequestFailure, Stream<List<Journey>>>> getAllUsersJourneys(
      String userId) async {
    try {
      final collection = _firestore.collection('journeys');
      final query = await collection.where('ownerId', isEqualTo: userId).get();
      final journeys = query.docs
          .map(
            (el) => Journey.fromJson(el.data()),
          )
          .toList();
      _journeysStreamController.add(journeys);
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }

    return right(_journeysStreamController.asBroadcastStream());
  }

  @override
  Future<Either<RequestFailure, Stream<List<CollaborativeJourney>>>>
      getAllUsersCollaborativeJourneys(String userId) async {
    try {
      final collection = _firestore.collection('collaborative_journeys');
      final query = await collection.where('ownerId', isEqualTo: userId).get();
      final collaborativeJourneys = query.docs
          .map(
            (el) => CollaborativeJourney.fromJson(el.data()),
          )
          .toList();
      _collaborativeJourneysStreamController.add(collaborativeJourneys);
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }

    return right(_collaborativeJourneysStreamController.asBroadcastStream());
  }

  @override
  Future<RequestResult<Unit>> saveImagesToStorage(List<String> imagesPaths) async {
    final storageRef = FirebaseStorage.instance.ref();

    for (final imagePath in imagesPaths) {
      final file = File(imagePath);
      final imageRef = storageRef.child('images/${file.path.split('/').last}');
      try {
        await imageRef.putFile(file);
      } on FirebaseException catch (err) {
        return left(const RequestFailure.serverError());
      }
    }

    return right(unit);
  }

  @override
  Future<RequestResult<User>> saveAndRetrieveUser(User user) async {
    try {
      final query = await _firestore.collection('users').where('uid', isEqualTo: user.uid).get();
      if(query.docs.isNotEmpty) {
        return right(User.fromJson(query.docs.first.data()));
      }
      await _firestore.collection('users').add(user.toJson()).onError(
            (error, _) => throw FirestoreException(error.toString()),
          );
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }

    return right(user);
  }

/*
  @override
  Future<Either<RequestFailure, List<Friend>>> getUserFriends(String userId) {
    var friendsList = <Friend>[];
    try {
      final collection = _firestore.collection('users').doc(userId).collection(collectionPath);
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }

    return right(friendsList);
  }
   */

}
