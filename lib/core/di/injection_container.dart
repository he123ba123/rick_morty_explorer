import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:connectivity_plus/connectivity_plus.dart'; // أضف هذا
import '../../features/characters/data/datasources/character_local_data_source.dart';
import '../../features/characters/data/datasources/character_remote_data_source.dart';
import '../../features/characters/data/repositories/character_repository_impl.dart';
import '../../features/characters/domain/repositories/character_repository.dart';
import '../../features/characters/domain/usecases/get_characters.dart';
import '../../features/characters/domain/usecases/get_character_details.dart';
import '../../features/characters/domain/usecases/search_characters.dart';
import '../../features/characters/domain/usecases/toggle_favorite.dart';
import '../../features/characters/presentation/bloc/cubit/character_details_cubit.dart';
import '../../features/characters/presentation/bloc/cubit/character_list_cubit.dart';
import '../../features/characters/presentation/bloc/cubit/favorites_cubit.dart';
import '../../features/characters/presentation/bloc/cubit/network_cubit.dart';
import '../../features/characters/presentation/bloc/cubit/search_cubit.dart';
import '../../core/network/network_info.dart'; 

final sl = GetIt.instance;

Future<void> init() async {
  
  await Hive.openBox('characters');
  await Hive.openBox('favorites');

  // Connectivity and NetworkInfo
sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectivity: sl()));
  sl.registerLazySingleton<NetworkCubit>(() => NetworkCubit(sl()));

  // Dio
  sl.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: "https://rickandmortyapi.com/api")));

  // Data sources
  sl.registerLazySingleton<CharacterRemoteDataSource>(
      () => CharacterRemoteDataSourceImpl(dio: sl()));
  
  sl.registerLazySingleton<CharacterLocalDataSource>(
    () => CharacterLocalDataSourceImpl(
      hiveBox: Hive.box('characters'), 
      charactersBox: Hive.box('characters'),  
      favoritesBox: Hive.box('favorites'),
    ),
  );
final favoritesBox = await Hive.openBox('favorites');

  
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(), favoritesBox: favoritesBox,
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetCharacters(sl()));
  sl.registerLazySingleton(() => SearchCharacters(sl()));
  sl.registerLazySingleton(() => GetCharacterDetails(sl()));
  sl.registerLazySingleton(() => ToggleFavorite(sl()));

  // Cubits
  sl.registerFactory(() => CharacterListCubit(sl()));
  sl.registerFactory(() => SearchCubit(sl()));
  sl.registerFactory(() => CharacterDetailsCubit(sl(), sl()));
  sl.registerFactory(() => FavoritesCubit(sl(), sl()));
}
