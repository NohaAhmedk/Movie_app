import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movie_app/core/config/theme/theme_data/theme_data_light.dart';
import 'package:path_provider/path_provider.dart';
import 'core/config/theme/cubit/theme_cubit.dart';
import 'core/config/theme/theme_data/theme_data_dark.dart';
import 'core/di/di.dart';
import 'core/routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeCubit()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, newMode) {
    return MaterialApp.router(
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode:newMode ,
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      routerConfig: AppRouter.router,
    );
            },
        ),
    );
  }
}
