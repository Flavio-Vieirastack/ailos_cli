import 'dart:io';

import '../helpers/constants.dart';

class PageWriter {
  static void createPage({
    required String path,
    required String featureNameInCamelCase,
    required String testDir,
    required String featureName,
    required String capitalizedFeatureName,
  }) {
    final pageFile = File(
      '$path/${featureNameInCamelCase}_page.dart',
    );
    final pageTestFile = File(
      '$testDir/$featureName/presenter/pages/${featureNameInCamelCase}_page_test.dart',
    );
    pageFile.writeAsString(
      Constants.page(capitalizedFeatureName),
    );
    pageTestFile.writeAsString(
      Constants.pageTest(),
    );
  }
}
