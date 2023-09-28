import 'package:fake_store_joao/presentation/commum_widgets/scafold_with_drawer.dart';
import 'package:fake_store_joao/presentation/screen/categories_page.dart';
import 'package:fake_store_joao/presentation/screen/home_page.dart';
import 'package:fake_store_joao/presentation/screen/login_page.dart';
import 'package:fake_store_joao/presentation/screen/my_account_page.dart';
import 'package:fake_store_joao/presentation/screen/product_detail_page.dart';
import 'package:fake_store_joao/presentation/screen/products_page.dart';
import 'package:fake_store_joao/presentation/screen/register_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
              path: 'categories',
              builder: (context, state) => const CategoriesPage(),
              routes: [
                GoRoute(
                    path: 'products',
                    builder: (context, state) => const ProductsPage(),
                    routes: [
                      GoRoute(
                        path: ':productsId',
                        builder: (context, state) => ProductDetailPage(
                            idProd:
                                int.parse(state.pathParameters['productsId']!)),
                      ),
                    ]),
              ]),
        ]),
    GoRoute(
      path: '/account',
      builder: (context, state) => const MyAccountPage(),
    ),
  ],
);
