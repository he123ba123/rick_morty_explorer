import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../bloc/cubit/network_cubit.dart';

class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkCubit, bool>(
      builder: (context, isOnline) {
        if (!isOnline) {
          return Container(
            width: double.infinity,
            color: Colors.red,
            padding: const EdgeInsets.all(8),
            child: const Text(
              "Offline Mode",
              style: TextStyle(color: AppColors.white),
              textAlign: TextAlign.center,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
