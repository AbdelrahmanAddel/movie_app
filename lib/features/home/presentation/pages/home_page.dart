import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/injection_container.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_cubit.dart';
import 'package:movie_app/features/home/presentation/widgets/home_body.dart';
import 'package:movie_app/shared/cubit/setting_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<MovieCubit>()..getMovies(),
      child: Scaffold(appBar: _appBar, body: const HomeBody()),
    );
  }
}

AppBar get _appBar {
  return AppBar(
    title: const Text('Movies'),
    actions: [
      Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          );
        },
      ),
    ],
  );
}
