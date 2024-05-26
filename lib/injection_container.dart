import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yo_me_animo/features/home/presentation/cubit/home_cubit.dart';
import 'package:yo_me_animo/features/home/data/data_sources/home_data_source.dart';
import 'package:yo_me_animo/features/login/data/data_sources/login_data_source.dart';
import 'package:yo_me_animo/features/login/data/repositories/login_repository_impl.dart';
import 'package:yo_me_animo/features/login/domain/repositories/login_repository.dart';
import 'package:yo_me_animo/features/login/domain/use_case/get_data_user_use_case.dart';
import 'package:yo_me_animo/features/login/domain/use_case/validate_user_with_email_and_password_use_case.dart';
import 'package:yo_me_animo/features/login/presentation/cubit/login_cubit.dart';
import 'package:yo_me_animo/features/register/presentation/cubit/register_cubit.dart';
import 'package:yo_me_animo/features/home/data/repositories/home_repository_impl.dart';
import 'package:yo_me_animo/features/home/domain/usecases/get_coin_list_use_case.dart';
import 'package:yo_me_animo/features/home/domain/repositories/home_auth_repository.dart';
import 'package:yo_me_animo/features/register/data/data_sources/register_data_source.dart';
import 'package:yo_me_animo/features/detail_movie/presentation/cubit/detail_movie_cubit.dart';
import 'package:yo_me_animo/features/register/domain/use_case/create_data_user_use_case.dart';
import 'package:yo_me_animo/features/register/data/repositories/register_repository_impl.dart';
import 'package:yo_me_animo/features/detail_movie/domain/usecases/get_genres_list_use_case.dart';
import 'package:yo_me_animo/features/detail_movie/data/data_sources/detail_movie_data_source.dart';
import 'package:yo_me_animo/features/detail_movie/domain/repositories/detail_movie_repository.dart';
import 'package:yo_me_animo/features/detail_movie/data/repositories/detail_movie_repository_impl.dart';
import 'package:yo_me_animo/features/register/domain/repositories/validate_phone_number_repository.dart';
import 'package:yo_me_animo/features/register/domain/use_case/create_user_with_email_and_password_use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    //cubit
    ..registerFactory<HomeCubit>(() => HomeCubit(getCoinListUseCase: sl()))
    ..registerFactory<DetailMovieCubit>(() => DetailMovieCubit(getMovieListUseCase: sl(), getListGenresUseCase: sl(),))
    ..registerFactory<LoginCubit>(() => LoginCubit(getDataUserUseCase: sl(), validateUserWithEmailAndPasswordUseCase: sl()))
    ..registerFactory<RegisterCubit>(() => RegisterCubit(createDataUserUseCase: sl(), createUserWithEmailAndPasswordUseCase: sl()))

    //user Case
    ..registerFactory<ValidateUserWithEmailAndPasswordUseCase>(
      () => ValidateUserWithEmailAndPasswordUseCase(loginRepository: sl()),
    )
    ..registerFactory<GetDataUserUseCase>(
      () => GetDataUserUseCase(loginRepository: sl()),
    )
    ..registerFactory<GetMovieListUseCase>(
      () => GetMovieListUseCase(homeRepository: sl()),
    )
    ..registerFactory<CreateDataUserUseCase>(
      () => CreateDataUserUseCase(registerRepository: sl()),
    )
    ..registerFactory<CreateUserWithEmailAndPasswordUseCase>(
      () => CreateUserWithEmailAndPasswordUseCase(registerRepository: sl()),
    )
    ..registerFactory<GetListGenresUseCase>(
      () => GetListGenresUseCase(detailMovieRepository: sl()),
    )

    //Repository
    ..registerFactory<LoginRepository>(
      () => LoginRepositoryImpl(loginDataSource: sl()),
    )
    ..registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(homeDataSource: sl()),
    )
    ..registerFactory<RegisterRepository>(
      () => RegisterRepositoryImpl(registerDataSource: sl()),
    )
    ..registerFactory<DetailMovieRepository>(
      () => DetailMovieRepositoryImpl(detailMovieDataSource: sl()),
    )
    //Dara source
    ..registerFactory<HomeDataSource>(() => HomeDataSourceImpl(db: sl()))
    ..registerFactory<LoginDataSource>(() => LoginDataSourceImpl(db: sl(), auth: sl()))
    ..registerFactory<DetailMovieDataSource>(() => DetailMovieDataSourceImpl(db: sl()))
    ..registerFactory<RegisterDataSource>(() => RegisterDataSourceImpl(db: sl(), auth: sl()))

    
    
    ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance)
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}
