import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty_explorer/core/constants/app_colors.dart';
import '../bloc/cubit/favorites_cubit.dart';
import '../widgets/character_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Image.asset(
          'assets/images/morty.jpg',
          height: 200.h,
          width: 200.w,
        ),
      ),
      body: BlocBuilder<FavoritesCubit, List>(
        builder: (context, favorites) {
          if (favorites.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/morty.jpg',
                      height: 200.h,
                      width: 200.w,
                    ),
                    Text(
                      "Don't worry my friend , you have no favorite characters yet",
                      style: TextStyle(fontSize: 18.sp, color: AppColors.white),
                    ),
                    Image.asset(
                      'assets/images/rick.jpg',
                      height: 300.h,
                      width: 200.w,
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
