import 'package:flutter/material.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';
import 'package:movie_app/core/config/theme/app_text_styles.dart';
import 'package:movie_app/core/config/theme/extentions/theme_extensions.dart';
import 'package:movie_app/features/movies/presentation/widgets/movie_image.dart';
import '../../../movies/data/models/movie_model.dart';

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
              child:
              MovieImage(posterPath: movie.posterPath, width: 200, height: 300),

            ),
            const SizedBox(height: 20),
            Text(movie.title, style: AppTextStyles.title),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.star, color: AppColors.ratingStar, size: 20),
                Text(" ${movie.voteAverage}/10", style: AppTextStyles.small),
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
                    child: Text(
                      movie.original_language,
                      style: AppTextStyles.body,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Description", style: AppTextStyles.subtitle),
            const SizedBox(height: 8),
            Text(movie.overview, style: AppTextStyles.body),
          ],
        ),
      ),
    );
  }
}
