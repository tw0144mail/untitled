import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../HomePage.dart';
import '../drawing_test/custom_paint_route.dart';
import '../into.dart';
import '../main.dart';
import '../nextpage/main2.dart';
import '../nextpage/main_bottom_navigation_bar.dart';

class Routes {
  static String main = '/';
  static String home_page = '/HomePage/:hitCount';
  static String main_2 = 'Main2/:name/:desc/:price/:stock';
  static String custom_paint_route = 'CustomPaintRoute';
  static String main_bottom_navigation_bar = 'MainBottomNavigationBar';

  static GoRouter RoutesGoRouter() {
    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/',
      routes: [
        GoRoute(path: main, builder: (context, state) => Into()),
        GoRoute(
          path: home_page,
          builder: (context, state) => HomePage(
              contextHP: context,
              hitCount: int.parse(state.params['hitCount'] == null
                  ? "0"
                  : state.params['hitCount']!)),
          routes: [
            GoRoute(
              path: main_2,
              builder: (context, state) {
                // return CustomPaintRoute();
                return main2(
                  name: state.params['name'],
                  desc: state.params['desc'],
                  price: int.parse(state.params['price']!),
                  stock: int.parse(state.params['stock']!),
                );
              },
            ),
            GoRoute(
              path: custom_paint_route,
              builder: (context, state) => CustomPaintRoute(),
              // builder: (context, state) {
              //   return CustomPaintRoute();
              // },
              // routes: [
              //
              // ]
            ),
            // another sub-route
            GoRoute(
              path: main_bottom_navigation_bar,
              builder: (context, state) => MainBottomNavigationBar(),
            ),
          ],
        ),
      ],
    );
  }

  static List<GoRoute> getDetailRoutes() {
    return [
      GoRoute(
        path: '/',
        builder: (context, state) => const MyApp(),
        routes: [
          GoRoute(
              path: main_2,
              builder: (context, state) {
                // return CustomPaintRoute();
                return main2(
                  name: state.params['name'],
                  desc: state.params['desc'],
                  price: int.parse(state.params['price']!),
                  stock: int.parse(state.params['stock']!),
                );
              },
              routes: []),
          GoRoute(
            path: custom_paint_route,
            builder: (context, state) => CustomPaintRoute(),
            // builder: (context, state) {
            //   return CustomPaintRoute();
            // },
            // routes: [
            //
            // ]
          ),
          // another sub-route
          GoRoute(
            path: main_bottom_navigation_bar,
            builder: (context, state) => MainBottomNavigationBar(),
          )
        ],
      ),
    ];
  }
}
