import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_state.dart';
import 'package:movie_app/features/home/presentation/widgets/movie_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state.type == MovieStateType.loading && state.movies.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.type == MovieStateType.loaded) {
            return MovieList(state: state);
          } else if (state.type == MovieStateType.error && state.movies.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    state.error ?? 'Something went wrong try again',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
