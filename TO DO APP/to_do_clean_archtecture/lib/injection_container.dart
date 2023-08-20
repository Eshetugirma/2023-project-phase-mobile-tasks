import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/presentation/util/input_converter.dart';
import 'core/presentation/util/validator/validator.dart';
import 'features/todo_list/data/data_sources/task_local_data_source.dart';
import 'features/todo_list/data/data_sources/task_remote_data_source.dart';
import 'features/todo_list/data/repository/task_repository_impl.dart';
import 'features/todo_list/domain/repository/todo_list_repository.dart';
import 'features/todo_list/domain/usecases/usecases.dart' as usecases;
import 'features/todo_list/presentation/bloc/task_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //! Features - Todo
  // Bloc
  serviceLocator.registerFactory(
    () => TaskBloc(
        createTask: serviceLocator(),
        deleteTask: serviceLocator(),
        updateTask: serviceLocator(),
        getTask: serviceLocator(),
        getTasks: serviceLocator(),
        inputConverter: serviceLocator()),
  );

  // Use cases
  serviceLocator.registerLazySingleton(
    () => usecases.CreateTask(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => usecases.UpdateTask(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => usecases.DeleteTask(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => usecases.GetAllTasks(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => usecases.GetTask(serviceLocator()),
  );

  // Validators
  serviceLocator.registerLazySingleton(() => DateValidator());
  serviceLocator.registerLazySingleton(() => TitleValidator());
  serviceLocator.registerLazySingleton(() => DescriptionValidator());

  // Core
  serviceLocator.registerLazySingleton(() => InputConverter());
  serviceLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(serviceLocator()));

  // Repository
  serviceLocator.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(
      remoteDataSource: serviceLocator(),
      localDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );

  // Data sources
  serviceLocator.registerLazySingleton<TaskLocalDataSource>(
    () => TaskLocalDataSourceImpl(sharedPreferences: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<TaskRemoteDataSource>(
    () => TaskRemoteDataSourceImpl(client: serviceLocator()),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
  serviceLocator.registerLazySingleton(() => http.Client());
}
