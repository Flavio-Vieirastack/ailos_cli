import 'package:ailos_core/ailos_core.dart';
import 'package:test/test.dart';

class TesteDatasourceMock extends Mock implements TesteDatasource {}

void main() {
  late TesteDatasourceMock testeDatasourceMock;
  late TesteRepository testeRepository;

  setUp(() {
    testeDatasourceMock = TesteDatasourceMock();
     testeRepository = TesteRepositoryImpl();
  });

  test(
      'Shoud return the correct value for ...',
      () async {

    when(() => testeDatasourceMock.) //TODO add
        .thenAnswer((_) async => null);//TODO add

    final sut = await testeRepository.;//TODO add
    expect(sut, Right(null));//TODO add
    verify(() => testeDatasourceMock. )// TODO Add
        .called(greaterThanOrEqualTo(1));
  });

  test('Shoud return the correct error value for ...', () async {
    when(() => testeDatasourceMock.)// TODO Add
        .thenThrow(null);// TODO Add

    final sut = await testeRepository.;//TODO add

    expect(sut, Left(null));//TODO add
  });
}
