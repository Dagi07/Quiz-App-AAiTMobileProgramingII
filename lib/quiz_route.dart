import 'package:flutter/material.dart';
import 'package:quiz_proj/data/category/screens/category.dart';
import 'package:quiz_proj/data/category/screens/create_category.dart';
import 'package:quiz_proj/data/quiz/screens/quiz_screen.dart';

class PageRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) {
          print("here");
          return QuizScreen();
        });
      case "/quizs":
        return MaterialPageRoute(builder: (context) {
          // return MyHomePage();
          return QuizScreen();
        });
      case "/categories":
        return MaterialPageRoute(builder: (context) {
          // return MyHomePage();
          return CategoryScreen();
        });
      case "/newCategory":
        return MaterialPageRoute(builder: (context) {
          // return MyHomePage();
          return CreateCategoryScreen();
        });
    }
  }
}
