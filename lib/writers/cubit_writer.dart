import 'dart:io';

import '../helpers/constants.dart';

class CubitWriter {
  static void createCubit({
    required String path,
    required String featureNameInCamelCase,
    required String testDir,
    required String featureName,
    required String capitalizedFeatureName,
  }) {
    final cubitFile = File('$path/${featureNameInCamelCase}_cubit.dart');
    final stateFile = File('$path/${featureNameInCamelCase}_state.dart');
    final testCubitFile = File(
      '$testDir/$featureName/presenter/cubit/${featureNameInCamelCase}_cubit_test.dart',
    );
    cubitFile.writeAsString(
      Constants.cubit(
        capitalizedFeatureName,
        featureNameInCamelCase,
      ),
    );
    stateFile.writeAsString(
      Constants.state(
        capitalizedFeatureName,
        featureNameInCamelCase,
      ),
    );
    testCubitFile.writeAsString(
      Constants.cubitTest(
        capitalizedFeatureName,
        featureNameInCamelCase,
      ),
    );
  }
}
