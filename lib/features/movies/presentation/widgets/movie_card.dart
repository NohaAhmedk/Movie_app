import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';
import 'package:movie_app/core/config/theme/app_text_styles.dart';
import 'package:movie_app/core/config/theme/extentions/theme_extensions.dart';
import 'package:movie_app/features/movies/presentation/widgets/movie_image.dart';
import '../../data/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/MovieDetailsScreen', extra: movie);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 12,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Movie Image
              MovieImage(posterPath: movie.posterPath),
              const SizedBox(width: 20),

              // Movie info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      movie.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.subtitle.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: AppColors.ratingStar, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          "${movie.voteAverage}/10",
                          style: AppTextStyles.small,
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Container(
                      decoration: BoxDecoration(
                        color: context.customColors.secondaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.grey200,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 10),
                      child: Text(
                        movie.original_language.toUpperCase(),
                        style: AppTextStyles.body.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Centered Arrow Icon
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
