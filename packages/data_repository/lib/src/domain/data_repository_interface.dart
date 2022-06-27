import 'core/typedefs.dart';

abstract class DataRepositoryInterface {
  Future<RequestResult> createExpenseTracker();
}