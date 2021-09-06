import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspire/data/data_source/news_api.dart';
import 'package:inspire/data/repository/article_help_db.dart';
import 'package:inspire/data/repository/new_repository.dart';
import 'package:inspire/presentation/blocs/news/news_bloc.dart';
import 'package:inspire/presentation/journeys/article_list.dart';
import 'package:inspire/presentation/journeys/home_page.dart';
import 'package:inspire/presentation/journeys/sign_up.dart';

import 'presentation/journeys/contact_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp(
    newsRepository: NewsRepository(NewsApi(), NewsProvider()),
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
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.grey[100],
          appBarTheme: AppBarTheme(
            //backgroundColor: Color(0xff06B1E5),
            color: Colors.white,
            brightness: Brightness.dark,
            titleTextStyle: TextStyle(
              color: Colors.purple[900],
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
            iconTheme: IconThemeData(
              color: Colors.purple,
            ),
            textTheme: TextTheme(
              headline6: TextStyle(
                color: Colors.purple[900],
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
          ),
          accentColor: Colors.purple[900],
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
          "article_list": (context) => ArticleList(),
        },
      ),
    );
  }
}
