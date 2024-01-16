import 'package:advicer/application/advicer/advicer_bloc.dart';
import 'package:advicer/domain/repositories/advicer_repository.dart';
import 'package:advicer/domain/usecases/advicer_usecases.dart';
import 'package:advicer/infrastructure/datasources/advicer_remote_datasource.dart';
import 'package:advicer/infrastructure/repositories/advicer_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance; // sl = service locator

Future<void> init() async {
  //! Blocs
  sl.registerFactory(() => AdvicerBloc(usecases: sl()));

  //! Usecases
  sl.registerLazySingleton(() => AdvicerUsecases(advicerRepository: sl()));

  //! Repositories
  sl.registerLazySingleton<AdvicerRepository>(() => AdvicerRepositoryImpl(advicerRemoteDatasource: sl()));

  //! Datasources
  sl.registerLazySingleton<AdvicerRemoteDatasource>(() => AdvicerRemoteDatasourceImpl(client: sl()));

  //! Extern
  sl.registerLazySingleton(() => http.Client());
}