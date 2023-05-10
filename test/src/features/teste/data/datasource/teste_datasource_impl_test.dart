import 'package:ailos_core/ailos_core.dart';
import 'package:test/test.dart';

class MockRestClientGet extends Mock implements RestClientGet {}

void main() {
  late MockRestClientGet mockRestClientGet;
  late TesteDatasource testeDatasource;

  setUp(() {
    mockRestClientGet = _MockRestClientGet();
    testeDatasource =
        TesteDatasourceImpl();
  });

  whenRestClientGet() => when(() => restClientGet.get(
    path: any(named: 'path'),
    queryParams: any(named: 'queryParams'),
    headers: any(named: 'headers')));

  test('should return a correct value for ...', () async {
    whenRestClientGet().thenAnswer((invocation) async => RestClientResponse(
        data: json.decode(_responseMock()), statusCode: 200));

    final sut = await testeDatasource.;//TODO add
    expect(result, isA<null>());//TODO add
    verify(() => mockRestClientGet. )// TODO Add
        .called(greaterThanOrEqualTo(1));
  });

  test(
      'should return a correct error value for ...',
      () async {
    
    whenRestClientGet().thenThrow(Exception());//TODO add

    final sut = testeDatasource.;//TODO add

    expect(sut, throwsA(isA<null>()));//TODO add
    
  });
 
}
