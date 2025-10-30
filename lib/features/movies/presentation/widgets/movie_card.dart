import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';
import 'package:movie_app/core/config/theme/app_text_styles.dart';
import 'package:movie_app/core/config/theme/extentions/theme_extensions.dart';
import '../../data/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push('/MovieDetailsScreen', extra: movie);
      },
      child: Card(

        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Poster placeholder
              Container(
                width: 100,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.black38,
                  size: 32,
                ),
              ),
              const SizedBox(width: 20),

              // Movie info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: AppTextStyles.subtitle
                    ),
                    const SizedBox(height: 12),

                    // Rating row
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: AppColors.ratingStar, size: 16),
                        Text(
                          " ${movie.rating}/10",
                          style: AppTextStyles.small
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Genre tag
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          color: AppColors.grey200,
                          width: 1,
                        ),
                      ),
                      color: context.customColors.secondaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          movie.genre,
                          style: AppTextStyles.body
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Arrow
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Icon(Icons.arrow_forward_ios,
                    size: 18, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
