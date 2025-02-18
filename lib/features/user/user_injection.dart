import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:user_auth_clean_architecture/features/user/data/datasource/user_remote_data_source.dart';
import 'package:user_auth_clean_architecture/features/user/data/repository/user_repository_impl.dart';
import 'package:user_auth_clean_architecture/features/user/domain/repositories/user_repository.dart';
import 'package:user_auth_clean_architecture/features/user/domain/usecases/login_usecase.dart';
import 'package:user_auth_clean_architecture/features/user/presentation/bloc/user_bloc.dart';

final sl = GetIt.instance; // Service Locator

Future<void> initUserDependencies() async {
  sl.registerLazySingleton(() => HttpClient());

  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(dataSource: sl()),
  );


  sl.registerLazySingleton(() => LoginUsecase(repository: sl()));

  
  sl.registerFactory(
    () => UserBloc(
      sl(),
    ),
  );
}
