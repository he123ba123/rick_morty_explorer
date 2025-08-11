import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/character.dart';

class CharacterDetailsPage extends StatelessWidget {
  final Character character;

  const CharacterDetailsPage({super.key, required this.character});

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
              color: AppColors.card,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style:  TextStyle(fontSize: 18.sp, color: AppColors.white),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          character.name,
          style: const TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.background,
      ),
      body: SingleChildScrollView(
        padding:  EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: "character_${character.id}",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    character.image,
                    height: 220.h,
                    width: 220.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
             SizedBox(height: 24.h),
            Card(
              color: const Color(0xFF3A1B8A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: Padding(
                padding:  EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow("Status", character.status),
                    Divider(color: Colors.white54),
                    _buildInfoRow("Species", character.species),
                    Divider(color: Colors.white54),
                    _buildInfoRow("Gender", character.gender),
                  ],
                ),
              ),
            ),
             SizedBox(height: 20.h),
            Card(
              color: const Color(0xFF3A1B8A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: Padding(
                padding:  EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow("Origin", character.origin),
                    Divider(color: Colors.white54),
                    _buildInfoRow("Location", character.location),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
