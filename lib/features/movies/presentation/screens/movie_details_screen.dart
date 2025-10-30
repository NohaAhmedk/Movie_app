import 'package:flutter/material.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';
import 'package:movie_app/core/config/theme/app_text_styles.dart';
import 'package:movie_app/core/config/theme/extentions/theme_extensions.dart';
import '../../data/models/movie_model.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 320,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.image_outlined,
                  size: 60,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(movie.title, style: AppTextStyles.title),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.star, color: AppColors.ratingStar, size: 20),
                Text(" ${movie.rating}/10", style: AppTextStyles.small),
                const SizedBox(width: 10),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(color: AppColors.grey200, width: 1),
                  ),
                  color: context.customColors.secondaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(movie.genre, style: AppTextStyles.body),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Description", style: AppTextStyles.subtitle),
            const SizedBox(height: 8),
            Text(movie.description, style: AppTextStyles.body,),
          ],
        ),
      ),
    );
  }
}
