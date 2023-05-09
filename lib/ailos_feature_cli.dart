import 'dart:io';

import 'package:ailos_feature_cli/helpers/whrite_file.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:cli_script/cli_script.dart';

void main(List<String> args) async {
  final entityAndModelNames = <String>{};
  final currentDir = Directory.current;
  final finalDir = '${currentDir.path}/lib/src/features';
  print('Duretorio atual: $currentDir');
  //final finalDir = '${currentDir.path}/scr/features'; //! Descomentar para teste
  print('🚀 Type your feature name 🚀');
  final featureNameRaw = stdin.readLineSync();
  final featureName =
      StringUtils.camelCaseToLowerUnderscore(featureNameRaw ?? '');
  String exit = '';
  print(
    '🚨 Type all entity/model names for $featureNameRaw ⛔️without "Entity" or "Model" at the end⛔️, and in ⛔️CamelCase⛔️. (Obs: Type "e" to exit)🚨',
  );
  while (exit.toLowerCase() != 'e') {
    final entitieName = stdin.readLineSync();
    exit = entitieName ?? '';
    if (entitieName != null && entitieName != 'e') {
      entityAndModelNames.add(entitieName);
      print(
        '⚡️ Your entities/Models ${entityAndModelNames.toString()} ⚡️',
      );
    }
  }

  final pathToDatasource = '$finalDir/$featureName/data/datasource';
  final pathToRepositoryInterface = '$finalDir/$featureName/domain/repository';
  final pathToRepositoryImpl = '$finalDir/$featureName/data/repository';
  final pathToUsecase = '$finalDir/$featureName/domain/usecase';
  final pathToEntity = '$finalDir/$featureName/domain/entity';
  final pathToModel = '$finalDir/$featureName/data/model';
  final pathToPage = '$finalDir/$featureName/presenter/pages';
  final pathToCubit = '$finalDir/$featureName/presenter/cubits';
  final pathToError = '$finalDir/$featureName/domain/errors';
  final testDir = finalDir.replaceAll('/lib', '/test');

  final mkdir = Platform.isMacOS ? 'mkdir -p' : 'mkdir';
  wrapMain(() async {
    await run("$mkdir $finalDir/$featureName");
    await run("$mkdir $testDir/$featureName");
    await run("$mkdir $finalDir/$featureName/data");
    await run("$mkdir $testDir/$featureName/data");
    await run("$mkdir $finalDir/$featureName/data/datasource");
    await run("$mkdir $testDir/$featureName/data/datasource");
    await run("$mkdir $finalDir/$featureName/data/repository");
    await run("$mkdir $testDir/$featureName/data/repository");
    await run("$mkdir $finalDir/$featureName/data/model");
    await run("$mkdir $testDir/$featureName/data/model");
    await run("$mkdir $finalDir/$featureName/domain");
    await run("$mkdir $testDir/$featureName/domain");
    await run("$mkdir $finalDir/$featureName/domain/usecase");
    await run("$mkdir $testDir/$featureName/domain/usecase");
    await run("$mkdir $finalDir/$featureName/domain/repository");
    await run("$mkdir $testDir/$featureName/domain/entity");
    await run("$mkdir $testDir/$featureName/domain/errors");
    await run("$mkdir $finalDir/$featureName/domain/errors");
    await run("$mkdir $testDir/$featureName/presenter/pages");
    await run("$mkdir $testDir/$featureName/presenter/widget");
    await run("$mkdir $testDir/$featureName/presenter/cubit");
    await run("$mkdir $finalDir/$featureName/presenter/pages");
    await run("$mkdir $finalDir/$featureName/presenter/widgets");
    await run("$mkdir $finalDir/$featureName/presenter/cubits");
    await run("$mkdir $finalDir/$featureName/domain/entity").then((_) {
      writeFile(
        data: entityAndModelNames,
        path: pathToEntity,
        writeEntity: true,
        featureName: featureName,
        finalDir: finalDir,
        modelPath: pathToModel,
        featureNameRaw: featureNameRaw ?? '',
      );
      writeFile(
        data: {},
        path: pathToUsecase,
        featureName: featureName,
        writeUsecase: true,
        finalDir: finalDir,
        featureNameRaw: featureNameRaw ?? '',
      );
      writeFile(
        data: {},
        path: pathToRepositoryInterface,
        featureName: featureName,
        writeRepository: true,
        finalDir: finalDir,
        repositoryImplPath: pathToRepositoryImpl,
        featureNameRaw: featureNameRaw ?? '',
      );
      writeFile(
        data: {},
        path: pathToDatasource,
        featureName: featureName,
        writeDatasource: true,
        finalDir: finalDir,
        datasourceImplPath: pathToDatasource,
        featureNameRaw: featureNameRaw ?? '',
      );
      writeFile(
        data: {},
        path: pathToPage,
        featureName: featureName,
        writePage: true,
        finalDir: finalDir,
        featureNameRaw: featureNameRaw ?? '',
      );
      writeFile(
        data: {},
        path: pathToCubit,
        featureName: featureName,
        writeCubit: true,
        finalDir: finalDir,
        featureNameRaw: featureNameRaw ?? '',
      );
      writeFile(
        data: {},
        path: pathToError,
        featureName: featureName,
        writeError: true,
        finalDir: finalDir,
        featureNameRaw: featureNameRaw ?? '',
      );
    }).then(
      (_) {
        entityAndModelNames.clear();
        print('✅ Feature created ✅');
        print('✅ Tests created ✅');
        print('⛔️Verify your test folder before send a pull request⛔️');
      },
    );
  });
}
