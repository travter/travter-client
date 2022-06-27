import 'core/typedefs.dart';
import 'expenses_tracker/expenses_tracker.dart';

abstract class DataRepositoryInterface {
  Future<RequestResult> createExpenseTracker(ExpensesTracker tracker);
}