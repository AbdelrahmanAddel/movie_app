import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsBackdrop extends StatelessWidget {
  const DetailsBackdrop({super.key, required this.posterPath});

  final String? posterPath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackdropImage(),
        _buildGradientOverlay(),
        _buildBackButton(context),
      ],
    );
  }

  Widget _buildBackdropImage() {
    return CachedNetworkImage(
      imageUrl: 'https://image.tmdb.org/t/p/w500$posterPath',
      height: 400,
      width: double.infinity,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        height: 400,
        color: Colors.grey[300],
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: 400,
        color: Colors.grey[300],
        child: const Center(
          child: Icon(
            Icons.movie_outlined,
            size: 80,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.7),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CircleAvatar(
          backgroundColor: Colors.black.withOpacity(0.5),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }
}
