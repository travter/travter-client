import 'package:auth_repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../data_repository.dart';

abstract class DataRepositoryInterface {
  Future<RequestResult<Unit>> createExpenseTracker(ExpensesTracker tracker);

  Future<RequestResult<Unit>> removeExpenseTracker(String id);

  Future<RequestResult<Unit>> updateExpenseTracker(ExpensesTracker tracker);

  Future<RequestResult<Unit>> createExpense(Expense expense);

  Future<RequestResult<Unit>> removeExpense(String id);

  Future<RequestResult<Unit>> updateExpense(Expense expense);

  Future<RequestResult<Unit>> createJourney(Journey journey);

  Future<RequestResult<Unit>> removeJourney(String id);

  Future<RequestResult<Unit>> updateJourney(Journey journey);

  Future<RequestResult<Unit>> createCollaborativeJourney(
      CollaborativeJourney collaborativeJourney);

  Future<RequestResult<Unit>> removeCollaborativeJourney(String id);

  Future<RequestResult<Unit>> updateCollaborativeJourney(
      CollaborativeJourney collaborativeJourney);

  Future<Either<RequestFailure, Stream<List<ExpensesTracker>>>>
      getAllUsersExpenseTrackers(String userId);

  Future<Either<RequestFailure, Stream<List<Journey>>>> getAllUsersJourneys(
      String userId);

  Future<Either<RequestFailure, Stream<List<CollaborativeJourney>>>>
      getAllUsersCollaborativeJourneys(String userId);

  Future<RequestResult<Unit>> saveImagesToStorage(List<String> imagesPaths);

  // Future<Either<RequestFailure, List<Friend>>> getUserFriends(String userId);

  Future<RequestResult<User>> saveAndRetrieveUser(User user);
}
