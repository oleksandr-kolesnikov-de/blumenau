/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

// Core service locator, that contains all important classes:

import 'package:blumenau/features/table/data/datasources/exchange_table_excel.dart';
import 'package:blumenau/features/table/data/datasources/exchange_table_hive.dart';
import 'package:blumenau/features/table/data/models/schedule_item_hive_model.dart';
import 'package:blumenau/features/table/data/repositories/table_repository_impl.dart';
import 'package:blumenau/features/table/domain/repositories/table_repository.dart';
import 'package:blumenau/features/table/domain/usecases/add_entry.dart';
import 'package:blumenau/features/table/domain/usecases/delete_entry.dart';
import 'package:blumenau/features/table/domain/usecases/load_courts.dart';
import 'package:blumenau/features/table/domain/usecases/load_schedule.dart';
import 'package:blumenau/features/table/domain/usecases/try_pin.dart';
import 'package:blumenau/features/table/presentation/bloc/helpers/get_key_for_appointment.dart';
import 'package:blumenau/features/table/presentation/bloc/table_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final core = GetIt.instance;

Future configureCore() async => await init();

Future<void> init() async {
  // BLoC

  core.registerFactory(() => TableBloc(core(), core(), core(), core(), core()));

  // Table UseCases
  core.registerLazySingleton(() => LoadSchedule(core()));
  core.registerLazySingleton(() => LoadCourts(core()));
  core.registerLazySingleton(() => AddEntry(core()));
  core.registerLazySingleton(() => DeleteEntry(core()));
  core.registerLazySingleton(() => TryPin(core()));

  // Table Helpers
  core.registerLazySingleton(() => GetKeyForAppointment());

  // Repository
  core.registerLazySingleton<TableRepository>(
      () => TableRepositoryImpl(core(), core()));

  // DataSources
  core.registerLazySingleton<ExchangeTableHive>(() => ExchangeTableHiveImpl());
  core.registerLazySingleton<ExchangeTableExcel>(
      () => ExchangeTableExcelImpl());

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  core.registerLazySingleton(() => sharedPreferences);

  // Initialize Hive and register adapters
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(ScheduleItemHiveModelAdapter());
}
