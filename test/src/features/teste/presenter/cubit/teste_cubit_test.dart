
import 'package:ailos_core/ailos_core.dart';
import 'package:flutter_test/flutter_test.dart';

class TesteUsecaseMock extends Mock implements TesteUsecase {}


void main() {
  late TesteCubit testeCubit;
  late TesteUsecaseMock testeUseCaseMock;

  setUp(
    () {
    
    },
  );

  blocTest(
    'Shoud return the correct states for ...',
    build: () => authAccountTokenCubit,
    act: (_) {
      
    },
    expect: () => [
      
    ],
    act: (bloc) => bloc.,
  );
  }
