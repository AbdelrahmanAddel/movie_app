import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';
import 'package:movie_app/features/home/presentation/pages/details_page.dart';

class MovieContainer extends StatelessWidget {
  const MovieContainer({super.key, required this.movie});
  
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetails(context),
      child: Container(
        decoration: _boxDecoration,
        child: _child,
      ),
    );
  }

  void _navigateToDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MovieDetailsPage(movie: movie),
      ),
    );
  }

  BoxDecoration get _boxDecoration {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  Widget get _child {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPosterImage(),
          _buildMovieInfo(),
        ],
      ),
    );
  }

  Widget _buildPosterImage() {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      height: 300,
      width: double.infinity,
      imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
      placeholder: (context, url) => Container(
        height: 300,
        color: Colors.grey[300],
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: 300,
        color: Colors.grey[300],
        child: const Center(
          child: Icon(
            Icons.error_outline,
            size: 48,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildMovieInfo() {
    return Builder(
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(12),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title ?? 'Unknown Title',
                style: Theme.of(context).textTheme.displayMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    movie.releaseDate ?? 'Unknown Date',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
