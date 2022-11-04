import 'dart:io';

import 'package:auth_repository/auth_repository.dart';
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
  DataRepository({ FirebaseStorage? storage})
      : _storage = storage ?? FirebaseStorage.instance;

  final FirebaseStorage _storage;

  /*
  final _expensesStreamController =
      BehaviorSubject<List<ExpensesTracker>>.seeded(const []);
  final _journeysStreamController =
      BehaviorSubject<List<Journey>>.seeded(const []);
  final _collaborativeJourneysStreamController =
      BehaviorSubject<List<CollaborativeJourney>>.seeded(const []);

   */

  @override
  Future<RequestResult<Unit>> addJourneyToFavorites(String userId, String journeyId) {
    // TODO: implement addJourneyToFavorites
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> addUserToFriends(String friendId, String userId) {
    // TODO: implement addUserToFriends
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> authorizeUserToExpense(String userId, String expenseId) {
    // TODO: implement authorizeUserToExpense
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> createCollaborativeJourney(CollaborativeJourney collaborativeJourney) {
    // TODO: implement createCollaborativeJourney
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> createExpense(Expense expense) {
    // TODO: implement createExpense
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> createExpenseTracker(ExpensesTracker tracker) {
    // TODO: implement createExpenseTracker
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> createJourney(Journey journey) {
    // TODO: implement createJourney
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<List<User>>> fetchUsersFriends(List<String> friendsIds) {
    // TODO: implement fetchUsersFriends
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> followUser(String toggledUserId, String userId) {
    // TODO: implement followUser
    throw UnimplementedError();
  }

  @override
  Future<Either<RequestFailure, Stream<List<CollaborativeJourney>>>> getAllUsersCollaborativeJourneys(String userId) {
    // TODO: implement getAllUsersCollaborativeJourneys
    throw UnimplementedError();
  }

  @override
  Future<Either<RequestFailure, Stream<List<ExpensesTracker>>>> getAllUsersExpenseTrackers(String userId) {
    // TODO: implement getAllUsersExpenseTrackers
    throw UnimplementedError();
  }

  @override
  Future<Either<RequestFailure, Stream<List<Journey>>>> getAllUsersJourneys(String userId) {
    // TODO: implement getAllUsersJourneys
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<User>> getUserData(String userId) {
    // TODO: implement getUserData
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<String>> getUserProfilePictureUrl(String userId) {
    // TODO: implement getUserProfilePictureUrl
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> getUsersAuthorizedTrackers(String userId) {
    // TODO: implement getUsersAuthorizedTrackers
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<SearchResult>> performSearch(String query) {
    // TODO: implement performSearch
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> removeCollaborativeJourney(String id) {
    // TODO: implement removeCollaborativeJourney
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> removeExpense(String id) {
    // TODO: implement removeExpense
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> removeExpenseTracker(String id) {
    // TODO: implement removeExpenseTracker
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> removeJourney(String id) {
    // TODO: implement removeJourney
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> removeJourneyFromFavorites(String userId, String journeyId) {
    // TODO: implement removeJourneyFromFavorites
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> removeUserFromFriends(String friendId, String userId) {
    // TODO: implement removeUserFromFriends
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<User>> saveAndRetrieveUser(User user) {
    // TODO: implement saveAndRetrieveUser
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> saveImagesToStorage(List<String> imagesPaths) {
    // TODO: implement saveImagesToStorage
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> unFollowUser(String toggledUserId, String userId) {
    // TODO: implement unFollowUser
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> updateCollaborativeJourney(CollaborativeJourney collaborativeJourney) {
    // TODO: implement updateCollaborativeJourney
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> updateExpense(Expense expense) {
    // TODO: implement updateExpense
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> updateExpenseTracker(ExpensesTracker tracker) {
    // TODO: implement updateExpenseTracker
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> updateJourney(Journey journey) {
    // TODO: implement updateJourney
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<Unit>> updateUser(Map<String, Object?> fieldsToUpdate, String userId) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

}
