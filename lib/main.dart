import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psony/data/data_source/news_api.dart';
import 'package:psony/data/repository/new_repository.dart';

import 'package:psony/presentation/blocs/news/news_bloc.dart';
import 'package:psony/presentation/journeys/home_page.dart';
import 'package:psony/presentation/journeys/sign_up.dart';

import 'presentation/journeys/contact_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xff06B1E5),
    statusBarBrightness: Brightness.light,
  ));
  runApp(MyApp(
    newsRepository: NewsRepository(NewsApi()),
  ));
}

class MyApp extends StatelessWidget {
  final NewsRepository newsRepository;

  const MyApp({Key? key, required this.newsRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                NewsBloc(newsRepository: newsRepository)..add(LoadNews()))
      ],
      child: MaterialApp(
        title: 'Inspire"',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff06B1E5),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xff06B1E5),
            // color: Colors.white,
            brightness: Brightness.dark,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            textTheme: TextTheme(
              headline6: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
          ),
          accentColor: Color(0xff06B1E5),
          tabBarTheme: TabBarTheme(
            labelColor: Colors.deepOrange,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelColor: Colors.grey,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        routes: {
          "signup": (context) => SignUpScreen(),
          "contact": (context) => ContactScreen(),
        },
      ),
    );
  }
}
