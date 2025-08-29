import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/util/app_routes/app_routes.dart';

import 'Ui Screen/home/cubit/home_cubit.dart';
import 'dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  dotenv.load() is no longer needed.
  setupDependencies(); // Setup dependencies directly
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (_) => sl<HomeCubit>(),
        ),
      ],
      child: MaterialApp(
        title: "News App",
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.home,
        routes: AppRoutes.routs,
      ),
    );
  }
}