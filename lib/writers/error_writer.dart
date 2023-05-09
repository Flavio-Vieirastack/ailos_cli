import 'dart:io';

import '../helpers/constants.dart';

class ErrorWriter {
  static void createError({
    required String path,
    required String featureNameInCamelCase,
    required String testDir,
    required String featureName,
    required String capitalizedFeatureName,
  }) {
    final errorFile = File('$path/${featureNameInCamelCase}_failure.dart');
    final errorTestFile = File(
      '$testDir/$featureName/domain/errors/${featureNameInCamelCase}_failure_test.dart',
    );
    errorFile.writeAsString(
      Constants.error(
        capitalizedFeatureName,
      ),
    );
    errorTestFile.writeAsString(Constants.errorTest());
  }
}
