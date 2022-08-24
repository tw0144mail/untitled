import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../HomePage.dart';
import '../drawing_test/custom_paint_route.dart';
import '../into.dart';
import '../main.dart';
import '../nextpage/custom_checkbox_test.dart';
import '../nextpage/done_widget_test.dart';
import '../nextpage/drawer.dart';
import '../nextpage/dynamic_generation.dart';
import '../nextpage/file_operation_route.dart';
import '../nextpage/future_builder_route_state.dart';
import '../nextpage/gradient_button_route.dart';
import '../nextpage/gradient_circular_progress_route.dart';
import '../nextpage/grid_view.dart';
import '../nextpage/http_test_route.dart';
import '../nextpage/list_view.dart';
import '../nextpage/main2.dart';
import '../nextpage/main_bottom_navigation_bar.dart';
import '../nextpage/socket_route.dart';
import '../nextpage/stack.dart';
import '../nextpage/tabbar.dart';
import '../nextpage/table.dart';
import '../nextpage/turn_box_route.dart';
import '../nextpage/watermark.dart';
import '../nextpage/watermark_test.dart';
import '../nextpage/web_socket_route.dart';
import '../nextpage/with_chunks.dart';

class Routes {
  static String r_main = '/';
  static String r_home_page = '/HomePage/:hitCount';
  static String r_main_2 = 'Main2/:name/:desc/:price/:stock';
  static String r_custom_paint_route = 'CustomPaintRoute';
  static String r_main_bottom_navigation_bar = 'MainBottomNavigationBar';
  static String r_with_chunks = 'WithChunks';
  static String r_socket_route = 'SocketRoute';
  static String r_tabbar = 'Tabbar';
  static String r_drawer = 'Drawer';
  static String r_stack = 'Stack';
  static String r_list_view = 'ListView';
  static String r_grid_view = 'GridView';
  static String r_table = 'Table';
  static String r_dynamic_generation = 'DynamicGeneration';
  static String r_gradient_button_route = 'GradientButtonRoute';
  static String r_turn_box_route = 'TurnBoxRoute';
  static String r_gradient_circular_progress_route = 'GradientCircularProgressRoute';
  static String r_custom_checkbox_test = 'CustomCheckboxTest';
  static String r_done_widget_test = 'DoneWidgetTest';
  static String r_water_mark = 'WaterMark';
  static String r_water_mark_test = 'WaterMarkTest';
  static String r_file_operation_route = 'FileOperationRoute';
  static String r_http_test_route = 'HttpTestRoute';
  static String r_future_builder_route_state = 'FutureBuilderRouteState';
  static String r_web_socket_route = 'WebSocketRoute';

  static GoRouter RoutesGoRouter() {
    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/',
      routes: [
        GoRoute(path: r_main, builder: (context, state) => Into()),
        GoRoute(
          path: r_home_page,
          builder: (context, state) => HomePage(
              contextHP: context,
              hitCount: int.parse(state.params['hitCount'] == null
                  ? "0"
                  : state.params['hitCount']!)),
          routes: [
            GoRoute(
              path: r_main_2,
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
              path: r_custom_paint_route,
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
              path: r_main_bottom_navigation_bar,
              builder: (context, state) => MainBottomNavigationBar(),
            ),
            GoRoute(
              path: r_with_chunks,
              builder: (context, state) => WithChunks(),
            ),
            GoRoute(
              path: r_socket_route,
              builder: (context, state) => SocketRoute(),
            ),
            GoRoute(
              path: r_tabbar,
              builder: (context, state) => tabbar(),
            ),
            GoRoute(
              path: r_drawer,
              builder: (context, state) => drawer(),
            ),
            GoRoute(
              path: r_stack,
              builder: (context, state) => stack(),
            ),
            GoRoute(
              path: r_list_view,
              builder: (context, state) => list_view(),
            ),
            GoRoute(
              path: r_grid_view,
              builder: (context, state) => grid_view(),
            ),
            GoRoute(
              path: r_table,
              builder: (context, state) => table(),
            ),
            GoRoute(
              path: r_dynamic_generation,
              builder: (context, state) => DynamicGeneration(),
            ),
            GoRoute(
              path: r_gradient_button_route,
              builder: (context, state) => GradientButtonRoute(),
            ),
            GoRoute(
              path: r_turn_box_route,
              builder: (context, state) => TurnBoxRoute(),
            ),
            GoRoute(
              path: r_gradient_circular_progress_route,
              builder: (context, state) => GradientCircularProgressRoute(),
            ),
            GoRoute(
              path: r_custom_checkbox_test,
              builder: (context, state) => CustomCheckboxTest(),
            ),
            GoRoute(
              path: r_done_widget_test,
              builder: (context, state) => DoneWidgetTest(),
            ),
            GoRoute(
              path: r_water_mark,
              builder: (context, state) => WaterMark(),
            ),
            GoRoute(
              path: r_water_mark_test,
              builder: (context, state) => WaterMarkTest(),
            ),
            GoRoute(
              path: r_file_operation_route,
              builder: (context, state) => FileOperationRoute(),
            ),
            GoRoute(
              path: r_http_test_route,
              builder: (context, state) => HttpTestRoute(),
            ),
            GoRoute(
              path: r_future_builder_route_state,
              builder: (context, state) => FutureBuilderRouteState(),
            ),
            GoRoute(
              path: r_web_socket_route,
              builder: (context, state) => WebSocketRoute(),
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
              path: r_main_2,
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
            path: r_custom_paint_route,
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
            path: r_main_bottom_navigation_bar,
            builder: (context, state) => MainBottomNavigationBar(),
          )
        ],
      ),
    ];
  }
}
