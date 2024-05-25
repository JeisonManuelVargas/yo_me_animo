import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yo_me_animo/features/detail_movie/data/data_sources/detail_movie_data_source.dart';
import 'package:yo_me_animo/features/detail_movie/data/repositories/detail_movie_repository_impl.dart';
import 'package:yo_me_animo/features/detail_movie/domain/repositories/detail_movie_repository.dart';
import 'package:yo_me_animo/features/detail_movie/domain/usecases/get_genres_list_use_case.dart';
import 'package:yo_me_animo/features/detail_movie/presentation/cubit/detail_movie_cubit.dart';
import 'package:yo_me_animo/features/home/data/data_sources/home_data_source.dart';
import 'package:yo_me_animo/features/home/data/repositories/home_repository_impl.dart';
import 'package:yo_me_animo/features/home/domain/repositories/home_auth_repository.dart';
import 'package:yo_me_animo/features/home/domain/usecases/get_coin_list_use_case.dart';
import 'package:yo_me_animo/features/home/presentation/cubit/home_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl

    //cubit
    ..registerFactory<DetailMovieCubit>(() => DetailMovieCubit(
      getMovieListUseCase: sl(),
      getListGenresUseCase: sl(),
    ))
    ..registerFactory<HomeCubit>(() => HomeCubit(getCoinListUseCase: sl()))

    //user Case
    ..registerFactory<GetMovieListUseCase>(
      () => GetMovieListUseCase(homeRepository: sl()),
    )
    ..registerFactory<GetListGenresUseCase>(
      () => GetListGenresUseCase(detailMovieRepository: sl()),
    )

    //Repository
    ..registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(homeDataSource: sl()),
    )
    ..registerFactory<DetailMovieRepository>(
      () => DetailMovieRepositoryImpl(detailMovieDataSource: sl()),
    )
    //Dara source
    ..registerFactory<HomeDataSource>(() => HomeDataSourceImpl(db: sl()))
    ..registerFactory<DetailMovieDataSource>(() => DetailMovieDataSourceImpl(db: sl()))
    
    
    
    ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance)
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}
