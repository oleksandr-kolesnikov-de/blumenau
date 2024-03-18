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

import 'package:blumenau/features/table/presentation/bloc/table_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final core = GetIt.instance;

Future configureCore() async => await init();

Future<void> init() async {
  // BLoC

  core.registerFactory(() => TableBloc());

  // Table UseCases and Helpers
  /// core.registerLazySingleton(() => Foo(core()));

  // Repository
  // core.registerLazySingleton<TableRepository>(() =>
  //    TableRepositoryImpl(
  //        core(), core(), core(), core(), core(), core()));

  // DataSources
  //core.registerLazySingleton(() => ExchangeInitializationJSON(core(), core()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  core.registerLazySingleton(() => sharedPreferences);
}
