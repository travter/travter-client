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
import '../domain/search/search_result.dart';

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
  Future<RequestResult<Unit>> createExpenseTracker(
      ExpensesTracker tracker) async {
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
  Future<RequestResult<Unit>> updateExpenseTracker(
      ExpensesTracker tracker) async {
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
      final query = await collection.where('authorizedUsers', arrayContainsAny: [userId]).get();
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
  Future<RequestResult<Unit>> saveImagesToStorage(
      List<String> imagesPaths) async {
    final storageRef = FirebaseStorage.instance.ref();

    for (final imagePath in imagesPaths) {
      final file = File(imagePath);
      final imageRef = storageRef.child('images/${file.path.split('/').last}');
      try {
        await imageRef.putFile(file);
      } on FirebaseException catch (_) {
        return left(const RequestFailure.serverError());
      }
    }

    return right(unit);
  }

  @override
  Future<RequestResult<User>> saveAndRetrieveUser(User user) async {
    try {
      final query = await _firestore
          .collection('users')
          .where('uid', isEqualTo: user.uid)
          .get();
      if (query.docs.isNotEmpty) {
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

  @override
  Future<RequestResult<Unit>> updateUser(
      Map<String, Object?> fieldsToUpdate, String userId) async {
    try {
      final user = await _firestore
          .collection('users')
          .where('uid', isEqualTo: userId)
          .get();

      final _user = user.docs.first;

      final userRef = _firestore.collection('users').doc(_user.id);

      await userRef.update(fieldsToUpdate).onError(
            (error, stackTrace) => throw FirestoreException(
              error.toString(),
            ),
          );
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
    return right(unit);
  }

  @override
  Future<RequestResult<User>> getUserData(String userId) async {
    try {
      final user = await _firestore
          .collection('users')
          .where('uid', isEqualTo: userId)
          .get();

      final _user = user.docs.first;

      return right(User.fromJson(_user.data()));
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
  }

  @override
  Future<RequestResult<Unit>> addJourneyToFavorites(
      String userId, String journeyId) async {
    try {
      final user = await _firestore
          .collection('users')
          .where('uid', isEqualTo: userId)
          .get();
      final _user = user.docs.first;
      final currentArray = User.fromJson(_user.data()).likedPostsIds;

      final userRef = _firestore.collection('users').doc(_user.id);
      await userRef.update({
        'likedPostsIds': <String>[...currentArray, journeyId],
      });

      return right(unit);
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
  }

  @override
  Future<RequestResult<Unit>> removeJourneyFromFavorites(
      String userId, String journeyId) async {
    try {
      final user = await _firestore
          .collection('users')
          .where('uid', isEqualTo: userId)
          .get();
      final _user = user.docs.first;
      final currentArray =
          List<String>.from(User.fromJson(_user.data()).likedPostsIds);

      final userRef = _firestore.collection('users').doc(_user.id);
      currentArray.remove(journeyId);

      await userRef.update({
        'likedPostsIds': currentArray,
      });

      return right(unit);
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
  }

  @override
  Future<RequestResult<SearchResult>> performSearch(String query) async {
    try {
      final userQueryResult = await _firestore
          .collection('users')
          .where('username', isEqualTo: query)
          .get();

      final foundUsers = userQueryResult.docs
          .map(
            (el) => User.fromJson(el.data()),
          )
          .toList();

      final journeyQueryResult = await _firestore
          .collection('users')
          .where('name', isEqualTo: query)
          .get();

      final foundJourneys = journeyQueryResult.docs
          .map(
            (el) => Journey.fromJson(el.data()),
          )
          .toList();

      final searchResult = SearchResult(
        foundJourneys: foundJourneys,
        foundUsers: foundUsers,
      );

      return right(searchResult);
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
  }

  @override
  Future<RequestResult<Unit>> addUserToFriends(
      String friendId, String userId) async {
    try {
      final _friendData = await _firestore
          .collection('users')
          .where('uid', isEqualTo: friendId)
          .get();
      final friendData = _friendData.docs.first;
      final _userData = await _firestore
          .collection('users')
          .where('uid', isEqualTo: userId)
          .get();
      final userData = _userData.docs.first;
      final friend = User.fromJson(friendData.data());
      final user = User.fromJson(userData.data());

      final friendRef = _firestore.collection('users').doc(friendData.id);
      await friendRef.update({
        'friends': <String>[
          ...friend.friends,
          user.uid,
        ],
      });

      final userRef = _firestore.collection('users').doc(userData.id);
      await userRef.update({
        'friends': <String>[
          ...user.friends,
          friend.uid,
        ],
      });

      return right(unit);
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
  }

  @override
  Future<RequestResult<Unit>> followUser(
      String toggledUserId, String userId) async {
    try {
      final _followedUser = await _firestore
          .collection('users')
          .where('uid', isEqualTo: toggledUserId)
          .get();
      final followedUser = _followedUser.docs.first;
      final currentFollowers = User.fromJson(followedUser.data()).followers;

      final followedUserRef =
          _firestore.collection('users').doc(followedUser.id);
      await followedUserRef.update({
        'followers': <String>[...currentFollowers, userId],
      });

      final _user = await _firestore
          .collection('users')
          .where('uid', isEqualTo: userId)
          .get();
      final user = _user.docs.first;
      final currentlyFollowing = User.fromJson(user.data()).following;

      final userRef = _firestore.collection('users').doc(user.id);
      await userRef.update({
        'following': <String>[...currentlyFollowing, toggledUserId],
      });

      return right(unit);
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
  }

  @override
  Future<RequestResult<Unit>> unFollowUser(
      String toggledUserId, String userId) async {
    try {
      final _followedUser = await _firestore
          .collection('users')
          .where('uid', isEqualTo: toggledUserId)
          .get();
      final followedUser = _followedUser.docs.first;
      final currentFollowers =
          List<String>.from(User.fromJson(followedUser.data()).followers);

      final followedUserRef =
          _firestore.collection('users').doc(followedUser.id);
      currentFollowers.remove(userId);
      await followedUserRef.update({
        'followers': currentFollowers,
      });

      final _user = await _firestore
          .collection('users')
          .where('uid', isEqualTo: userId)
          .get();
      final user = _user.docs.first;
      final currentlyFollowing =
          List<String>.from(User.fromJson(user.data()).following);
      final userRef = _firestore.collection('users').doc(user.id);
      currentlyFollowing.remove(toggledUserId);
      await userRef.update({
        'following': currentlyFollowing,
      });

      return right(unit);
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
  }

  @override
  Future<RequestResult<Unit>> removeUserFromFriends(
      String friendId, String userId) {
    // TODO: implement removeUserFromFriends
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<List<User>>> fetchUsersFriends(
      List<String> friendsIds) async {
    try {
      final emptyFriends = <User>[];
      if (friendsIds.isEmpty) {
        return right(emptyFriends);
      }
      final _friendData = await _firestore
          .collection('users')
          .where('uid', whereIn: friendsIds)
          .get();

      final friends = _friendData.docs
          .map(
            (el) => User.fromJson(el.data()),
          )
          .toList();

      return right(friends);
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
  }

  @override
  Future<RequestResult<Unit>> authorizeUserToExpense(
      String userId, String expenseId) async {
    try {
      final authorizedUserData = await _firestore
          .collection('users')
          .where('uid', isEqualTo: userId)
          .get();

      final userDoc = authorizedUserData.docs.first;
      final currentlyAuthorizedTrackers = List<String>.from(
          User.fromJson(userDoc.data()).authorizedExpenseTrackers);

      final userRef = _firestore.collection('users').doc(userDoc.id);
      await userRef.update({
        'authorizedExpenseTrackers': [
          ...currentlyAuthorizedTrackers,
          expenseId
        ],
      });

      return right(unit);
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
  }

  @override
  Future<RequestResult<Unit>> getUsersAuthorizedTrackers(String userId) async {
    try {
      final userData = await _firestore.collection('users').where('uid').get();
      final userDoc = userData.docs.first;
      final currentlyAuthorizedTrackers = List<String>.from(
          User.fromJson(userDoc.data()).authorizedExpenseTrackers);
      // for(final trackerId in currentlyAuthorizedTrackers) {}
      return right(unit);
    } on FirestoreException catch (_) {
      return left(const RequestFailure.serverError());
    }
  }
}
