import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/util/app_routes/app_routes.dart';

import 'Ui Screen/home/cubit/home_cubit.dart';
import 'data/remote/api_helper.dart';
import 'data/repository/news_reposetry.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NewsCubit(
            newsRepository: NewsRepository(
              apiHelper: ApiHelper(),
            ),
          ),
        ),
      ],
      child:  MyApp(), // ✅ Added const
    ),
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "news app",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routs,
    );
  }
}