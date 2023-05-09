import 'dart:io';

import '../helpers/constants.dart';

class RepositoryWriter {
  static void createRepository({
    required String path,
    required String featureNameInCamelCase,
    required String repositoryImplPath,
    required String testDir,
    required String featureName,
    required String repositoryInterfaceFileName,
    required String repositoryImplFileName,
    required String datasourceInterfaceFileName,
  }) {
    final respositoryInterfaceFile = File(
      '$path/${featureNameInCamelCase}_repository.dart',
    );
    final respositoryImplFile = File(
      '$repositoryImplPath/${featureNameInCamelCase}_repository_impl.dart',
    );
    final repositoryTestFile = File(
      '$testDir/$featureName/data/repository/${featureNameInCamelCase}_repository_impl_test.dart',
    );
    respositoryInterfaceFile.writeAsString(
      Constants.repositoryInterface(
        repositoryInterfaceFileName,
      ),
    );
    respositoryImplFile.writeAsString(
      Constants.repositoryImpl(
        repositoryImplFileName,
        repositoryInterfaceFileName,
        datasourceInterfaceFileName,
        featureName,
      ),
    );
    repositoryTestFile.writeAsString(
      Constants.repositoryTest(
        datasourceInterfaceFileName,
        repositoryInterfaceFileName,
        repositoryImplFileName,
      ),
    );
  }
}
