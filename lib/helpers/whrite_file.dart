import 'package:ailos_feature_cli/writers/cubit_writer.dart';
import 'package:ailos_feature_cli/writers/datasource_writer.dart';
import 'package:ailos_feature_cli/writers/entity_and_model_writer.dart';
import 'package:ailos_feature_cli/writers/error_writer.dart';
import 'package:ailos_feature_cli/writers/page_writer.dart';
import 'package:ailos_feature_cli/writers/repository_wirter.dart';
import 'package:ailos_feature_cli/writers/usecase_writer.dart';
import 'package:basic_utils/basic_utils.dart';
import 'capitalize.dart';

void writeFile({
  required Set<String> data,
  required String path,
  required String featureName,
  required String featureNameRaw,
  required String finalDir,
  String? modelPath,
  String? repositoryImplPath,
  String? datasourceImplPath,
  bool writeEntity = false,
  bool writeUsecase = false,
  bool writeRepository = false,
  bool writeDatasource = false,
  bool writePage = false,
  bool writeCubit = false,
  bool writeError = false,
}) {
  final capitalizedFeatureName = capitalize(featureNameRaw);
  final usecaseInterfaceFileName = '${capitalizedFeatureName}Usecase';
  final usecaseImplFileName = '${capitalizedFeatureName}UsecaseImpl';

  final repositoryInterfaceFileName = '${capitalizedFeatureName}Repository';
  final repositoryImplFileName = '${capitalizedFeatureName}RepositoryImpl';

  final datasourceInterfaceFileName = '${capitalizedFeatureName}Datasource';
  final datasourceImplFileName = '${capitalizedFeatureName}DatasourceImpl';
  final testDir = finalDir.replaceAll('/lib', '/test');
  final featureNameInCamelCase =
      StringUtils.camelCaseToLowerUnderscore(featureName);
  if (writeEntity) {
    EntityAndModelWriter.createEntity(
      data: data,
      path: path,
      modelPath: modelPath ?? '',
      testDir: testDir,
      featureName: featureName,
    );
  } else if (writeUsecase) {
    UsecaseWriter.createUsecase(
      featureNameInCamelCase: featureNameInCamelCase,
      path: path,
      testDir: testDir,
      featureName: featureName,
      usecaseInterfaceFileName: usecaseInterfaceFileName,
      usecaseImplFileName: usecaseImplFileName,
      repositoryInterfaceFileName: repositoryInterfaceFileName,
    );
  } else if (writeRepository) {
    RepositoryWriter.createRepository(
      path: path,
      featureNameInCamelCase: featureNameInCamelCase,
      repositoryImplPath: repositoryImplPath ?? '',
      testDir: testDir,
      featureName: featureName,
      repositoryInterfaceFileName: repositoryInterfaceFileName,
      repositoryImplFileName: repositoryImplFileName,
      datasourceInterfaceFileName: datasourceInterfaceFileName,
    );
  } else if (writeDatasource) {
    DatasourceWriter.createDatasource(
      datasourceImplPath: datasourceImplPath ?? '',
      featureNameInCamelCase: featureNameInCamelCase,
      testDir: testDir,
      featureName: featureName,
      datasourceInterfaceFileName: datasourceInterfaceFileName,
      datasourceImplFileName: datasourceImplFileName,
    );
  } else if (writePage) {
    PageWriter.createPage(
      path: path,
      featureNameInCamelCase: featureNameInCamelCase,
      testDir: testDir,
      featureName: featureName,
      capitalizedFeatureName: capitalizedFeatureName,
    );
  } else if (writeCubit) {
    CubitWriter.createCubit(
      path: path,
      featureNameInCamelCase: featureNameInCamelCase,
      testDir: testDir,
      featureName: featureName,
      capitalizedFeatureName: capitalizedFeatureName,
    );
  } else if (writeError) {
    ErrorWriter.createError(
      path: path,
      featureNameInCamelCase: featureNameInCamelCase,
      testDir: testDir,
      featureName: featureName,
      capitalizedFeatureName: capitalizedFeatureName,
    );
  }
}
