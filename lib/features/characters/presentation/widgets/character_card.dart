import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty_explorer/core/constants/app_colors.dart';
import '../../domain/entities/character.dart';
import '../pages/character_details_page.dart';
import '../bloc/cubit/favorites_cubit.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.select<FavoritesCubit, bool>(
      (cubit) => cubit.state.any((fav) => fav.id == character.id),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 10, right: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: AppColors.card,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CharacterDetailsPage(character: character),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: "character_${character.id}",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      character.image,
                      width: 80.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                 SizedBox(width: 17.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       SizedBox(height: 10.h),
                      Text(
                        character.name,

                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                       SizedBox(height: 6.h),
                      Text(
                        "Status: ${character.status}",
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                        ),
                      ),
                       SizedBox(height: 4.h),
                      Text(
                        "Species: ${character.species}",
                        style:  TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: AppColors.white,
                  ),
                  onPressed: () {
                    context.read<FavoritesCubit>().toggle(character);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
