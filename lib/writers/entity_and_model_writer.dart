import 'dart:io';

import 'package:basic_utils/basic_utils.dart';

import '../helpers/capitalize.dart';
import '../helpers/constants.dart';

class EntityAndModelWriter {
  static void createEntity({
    required Set<String> data,
    required String path,
    required String modelPath,
    required String testDir,
    required String featureName,
  }) {
    for (var dataToWrite in data) {
      final camelCaseEntity =
          StringUtils.camelCaseToLowerUnderscore(dataToWrite);
      final camelCaseModel = camelCaseEntity.replaceAll('Entity', 'Model');
      final entityFile = File('$path/${camelCaseEntity}_entity.dart');
      final modelFile = File('$modelPath/${camelCaseModel}_model.dart');
      final captalizedString = capitalize(dataToWrite);
      final entityName = '${captalizedString}Entity';
      final modelName = '${captalizedString}Model';
      entityFile.writeAsString(
        Constants.entity(entityName),
      );
      modelFile.writeAsString(
        Constants.model(modelName),
      );
      final entityTestFile = File(
        '$testDir/$featureName/domain/entity/${camelCaseEntity}_entity_test.dart',
      );
      final modelTestFile = File(
        '$testDir/$featureName/data/model/${camelCaseModel}_model_test.dart',
      );
      modelTestFile.writeAsString(
        Constants.modelTest(),
      );
      entityTestFile.writeAsString(
        Constants.entityTest(),
      );
    }
  }
}
