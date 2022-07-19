import 'package:data_repository/data_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:traveler/application/search/search_bloc.dart';

class MockDataRepository extends Mock implements DataRepository {}

void main() {
  group('SearchBloc', () {
    late SearchBloc searchBloc;
    late DataRepository dataRepository;

    setUp(() {
      dataRepository = MockDataRepository();
      searchBloc = SearchBloc(dataRepository);
    });

    test('yes', () {
      const yes = 'yes';
      expect(yes, 'yes');
    });
  });
}
