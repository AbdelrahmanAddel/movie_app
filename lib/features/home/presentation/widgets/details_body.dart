import 'package:flutter/material.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';
import 'package:movie_app/features/home/presentation/widgets/details_backdrop.dart';
import 'package:movie_app/features/home/presentation/widgets/movie_overview_section.dart';
import 'package:movie_app/features/home/presentation/widgets/movie_title_section.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsBackdrop(posterPath: movie.posterPath),
          MovieTitleSection(
            title: movie.title,
            releaseDate: movie.releaseDate,
            popularity: movie.popularity,
          ),
          const Divider(),
          MovieOverviewSection(overview: movie.overview),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
