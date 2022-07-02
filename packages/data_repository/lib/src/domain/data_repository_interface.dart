import 'package:dartz/dartz.dart';

import '../../data_repository.dart';
import 'core/typedefs.dart';
import 'core/request_failure.dart';

abstract class DataRepositoryInterface {
  Future<RequestResult> createExpenseTracker(ExpensesTracker tracker);

  Future<RequestResult> removeExpenseTracker(String id);

  Future<RequestResult> updateExpenseTracker(ExpensesTracker tracker);

  Future<RequestResult> createExpense(Expense expense);

  Future<RequestResult> removeExpense(String id);

  Future<RequestResult> updateExpense(Expense expense);

  Future<RequestResult> createJourney(Journey journey);

  Future<RequestResult> removeJourney(String id);

  Future<RequestResult> updateJourney(Journey journey);

  Future<RequestResult> createCollaborativeJourney(
      CollaborativeJourney collaborativeJourney);

  Future<RequestResult> removeCollaborativeJourney(String id);

  Future<RequestResult> updateCollaborativeJourney(
      CollaborativeJourney collaborativeJourney);

  Future<Either<RequestFailure, Stream<List<ExpensesTracker>>>>
      getAllUsersExpenseTrackers(String userId);

  Future<Either<RequestFailure, Stream<List<Journey>>>> getAllUsersJourneys(
      String userId);
}
