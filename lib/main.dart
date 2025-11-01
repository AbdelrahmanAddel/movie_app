import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/core/di/injection_container.dart';
import 'package:movie_app/features/home/data/models/hive_model/movie_hive_model.dart';
import 'package:movie_app/movie_app.dart';
import 'package:movie_app/shared/cubit/setting_cubit.dart';
import 'package:sentry_flutter/sentry_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieHiveModelAdapter());
  await initDependencyInjection();
  await SentryFlutter.init(
    (options) {
      options.dsn =
          '';
    },
    appRunner: () => runApp(
      SentryWidget(
        child: BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(),
          child: const MovieApp(),
        ),
      ),
    ),
  );
}
