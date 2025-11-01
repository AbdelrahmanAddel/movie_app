import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/features/home/presentation/pages/home_page.dart';
import 'package:movie_app/shared/cubit/setting_cubit.dart';
import 'package:movie_app/shared/cubit/setting_state.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.themeMode,
          home: HomePage(),
        );
      },
    );
  }
}
