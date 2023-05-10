import 'package:ailos_core/ailos_core.dart';
import 'package:test/test.dart';

class TesteRepositoryMock extends Mock implements TesteRepository {}

void main() {
  late TesteRepositoryMock testeRepositoryMock;
  late TesteUsecase testeUsecase;

  setUp(() {
    testeRepositoryMock = TesteRepositoryMock();
    testeUsecase = TesteUsecaseImpl();
  });

  test('Shoud return a correct value for ...', () async {
    when(() => testeRepositoryMock. )// TODO Add
        .thenAnswer((_) async => const Right(null));
    final sut = await testeUsecase.

    expect(sut, const Right(null));

    verify(() => testeRepositoryMock. )// TODO Add
        .called(greaterThanOrEqualTo(1));
  });

  test('Shoud return a correct error value for ...', () async {
    when(() => testeRepositoryMock. )// TODO Add
        .thenAnswer((_) async => const Left(null));
    
    final sut = await testeUsecase.// TODO Add

    expect(sut, const Left(null));
  });
}

    