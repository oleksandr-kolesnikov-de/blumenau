/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

// Core service locator, that contains all important classes:
// - all blocs
// - use cases
// - helpers
// - repositories
// - exchange classes
// - connectionTool
// - subscriptionTool
// - jsonTool
// - sharedPreferences instance

import 'package:blumenau/features/table/data/datasources/exchange_table_shared_prefs.dart';
import 'package:blumenau/features/table/data/repositories/table_repository_impl.dart';
import 'package:blumenau/features/table/domain/repositories/table_repository.dart';
import 'package:blumenau/features/table/domain/usecases/load_schedule.dart';
import 'package:blumenau/features/table/presentation/bloc/table_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final core = GetIt.instance;

Future configureCore() async => await init();

Future<void> init() async {
  // BLoC

  core.registerFactory(() => TableBloc(core()));

  // Table UseCases and Helpers
  core.registerLazySingleton(() => LoadSchedule(core()));

  // Repository
  core.registerLazySingleton<TableRepository>(
      () => TableRepositoryImpl(core()));

  // DataSources
  core.registerLazySingleton<ExchangeTableSharedPrefs>(
      () => ExchangeTableSharedPrefsImpl(core()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  core.registerLazySingleton(() => sharedPreferences);
}
