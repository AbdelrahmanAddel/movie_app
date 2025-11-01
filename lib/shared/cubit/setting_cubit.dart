import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/shared/cubit/setting_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light));

  void toggleTheme() {
    emit(
      state.copyWith(
        themeMode: state.themeMode == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light,
      ),
    );
  }
}
