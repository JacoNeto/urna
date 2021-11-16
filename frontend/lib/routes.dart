import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:urna/pages/end/end.dart';
import 'package:urna/pages/home.dart';

class RouteGenerator {
  static const HOME_PAGE = '/';
  static const END_PAGE = '/end';
  static const UNKNOWN_PAGE = '/notFound';

  //Controla as rotas e dependências
  static List<GetPage> routes() {
    return [
      //Route to Home Page
      GetPage(
        name: HOME_PAGE,
        page: () => HomePage(),
      ),
      //Route to Login Page
      GetPage(
        name: END_PAGE,
        page: () => EndPage(),
      ),
      // Error Route
      GetPage(
        name: UNKNOWN_PAGE,
        page: () => Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ALGO DEU ERRADO'),
          ),
        ),
      ),
    ];
  }
}
