import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cubit/favorites_cubit.dart';
import '../widgets/character_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F1775),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F1775),
        title: Image.asset('assets/images/morty.jpg', height: 200, width: 200),
      ),
      body: BlocBuilder<FavoritesCubit, List>(
        builder: (context, favorites) {
          if (favorites.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/morty.jpg',
                      height: 200,
                      width: 200,
                    ),
                    Text(
                      "Don't worry my friend , you have no favorite characters yet",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Image.asset(
                      'assets/images/rick.jpg',
                      height: 400,
                      width: 200,
                    ),
                  ],
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final character = favorites[index];
              return CharacterCard(character: character);
            },
          );
        },
      ),
    );
  }
}
