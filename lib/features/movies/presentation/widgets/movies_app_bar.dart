import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/config/theme/cubit/theme_cubit.dart';
import 'package:movie_app/core/config/theme/extentions/theme_extensions.dart';

class MoviesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MoviesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        '🎬 Movies',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {
              if (context.isDarkMode) {
                context.read<ThemeCubit>().updateTheme(ThemeMode.light);
              } else {
                context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
              }
            },
            child: Icon(
              context.isDarkMode ? Icons.wb_sunny_outlined
                  : Icons.nightlight_round_outlined,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
