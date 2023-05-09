import 'dart:io';

import '../helpers/constants.dart';

class UsecaseWriter {
  static void createUsecase({
    required String featureNameInCamelCase,
    required String path,
    required String testDir,
    required String featureName,
    required String usecaseInterfaceFileName,
    required String usecaseImplFileName,
    required String repositoryInterfaceFileName,
  }) {
    final usecaseFile = File('$path/${featureNameInCamelCase}_usecase.dart');
    final usecaseTestFile = File(
      '$testDir/$featureName/domain/usecase/${featureNameInCamelCase}_usecase_impl_test.dart',
    );
    usecaseFile.writeAsString(
      Constants.usecaseInterface(
        usecaseInterfaceFileName,
      ),
    );
    final usecaseImplFile = File(
      '$path/${featureNameInCamelCase}_usecase_impl.dart',
    );
    usecaseImplFile.writeAsString(
      Constants.usecaseImpl(
        featureNameInCamelCase,
        usecaseImplFileName,
        usecaseInterfaceFileName,
      ),
    );
    usecaseTestFile.writeAsString(
      Constants.usecaseTest(
        repositoryInterfaceFileName,
        usecaseInterfaceFileName,
        usecaseImplFileName,
      ),
    );
  }
}
