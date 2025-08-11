import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_morty_explorer/features/characters/presentation/pages/splash_screen.dart';
import 'core/di/injection_container.dart' as di;
import 'features/characters/presentation/bloc/cubit/character_details_cubit.dart';
import 'features/characters/presentation/bloc/cubit/character_list_cubit.dart';
import 'features/characters/presentation/bloc/cubit/favorites_cubit.dart';
import 'features/characters/presentation/bloc/cubit/network_cubit.dart';
import 'features/characters/presentation/bloc/cubit/search_cubit.dart';
import 'features/characters/presentation/pages/home_page.dart';
import 'features/characters/presentation/pages/favorites_page.dart';
import 'core/hive_adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init Hive
  await Hive.initFlutter();
  Hive.registerAdapter(CharacterAdapter());
  await Hive.openBox('characters');
  await Hive.openBox('favorites');
  // Init Dependency Injection
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<CharacterListCubit>()..loadCharacters(),
        ),
        BlocProvider(create: (_) => di.sl<SearchCubit>()),
        BlocProvider(create: (_) => di.sl<NetworkCubit>()), 
        BlocProvider(create: (_) => di.sl<FavoritesCubit>()..loadFavorites()),
        BlocProvider(create: (_) => di.sl<CharacterDetailsCubit>()),
      ],
      child: MaterialApp(
        title: 'Rick & Morty Explorer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.grey[200],
        ),
        initialRoute: '/splash',
        routes: {
           '/splash': (_) => const SplashScreen(),
          '/': (_) => const HomePage(),
          '/favorites': (_) => const FavoritesPage(),
          // '/details': (_) => const CharacterDetailsPage(),
        },
      ),
    );
  }
}
