import 'dart:io';

import '../helpers/constants.dart';

class DatasourceWriter {
  static void createDatasource({
    required String datasourceImplPath,
    required String featureNameInCamelCase,
    required String testDir,
    required String featureName,
    required String datasourceInterfaceFileName,
    required String datasourceImplFileName,
  }) {
    final datasourceInterfaceFile = File(
      '$datasourceImplPath/${featureNameInCamelCase}_datasource.dart',
    );
    final datasourceImplFile = File(
      '$datasourceImplPath/${featureNameInCamelCase}_datasource_impl.dart',
    );
    final datasourceTestFile = File(
      '$testDir/$featureName/data/datasource/${featureNameInCamelCase}_datasource_impl_test.dart',
    );
    datasourceInterfaceFile.writeAsString(
      Constants.datasource(
        datasourceInterfaceFileName,
      ),
    );
    datasourceImplFile.writeAsString(
      Constants.datasourceImpl(
        datasourceInterfaceFileName,
        datasourceImplFileName,
        featureNameInCamelCase,
      ),
    );
    datasourceTestFile.writeAsString(
      Constants.datasourceTest(
        datasourceInterfaceFileName,
        datasourceImplFileName,
      ),
    );
  }
}
