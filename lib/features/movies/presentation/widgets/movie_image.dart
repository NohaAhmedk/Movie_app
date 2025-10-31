import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    super.key,
    required this.posterPath,
    this.width = 100,
    this.height = 130,
  });

  final String posterPath;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500/$posterPath',
          placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
          const Icon(Icons.image_not_supported),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}