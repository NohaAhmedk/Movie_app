import 'package:flutter/material.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    super.key,
    required this.posterPath,
    this.width = 100,  // default width
    this.height = 150, // default height
  });

  final String posterPath;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        'https://image.tmdb.org/t/p/w500/$posterPath',
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          width: width,
          height: height,
          color: Colors.grey[300],
          child: const Icon(Icons.broken_image, color: Colors.grey),
        ),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes!)
                  : null,
            ),
          );
        },
      ),
    );
  }
}
