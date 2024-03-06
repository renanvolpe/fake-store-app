import 'package:fake_store_joao/presentation/screen/categories_edit_page.dart';
import 'package:fake_store_joao/presentation/screen/categories_page.dart';
import 'package:fake_store_joao/presentation/screen/home_page.dart';
import 'package:fake_store_joao/presentation/screen/login_page.dart';
import 'package:fake_store_joao/presentation/screen/my_account_page.dart';
import 'package:fake_store_joao/presentation/screen/product_detail_edit_page.dart';
import 'package:fake_store_joao/presentation/screen/product_detail_page.dart';
import 'package:fake_store_joao/presentation/screen/products_page.dart';
import 'package:fake_store_joao/presentation/screen/register_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomePage(), routes: [
      GoRoute(path: 'categories', builder: (context, state) => const CategoriesPage(), routes: [
        GoRoute(
            path: ':idCat',
            builder: (context, state) => ProductsPage(
                  idCategory: int.parse(state.pathParameters["idCat"]!),
                ),
            routes: [
              GoRoute(
                path: 'products/:productsId',
                builder: (context, state) => ProductDetailPage(idProd: int.parse(state.pathParameters['productsId']!)),
              ),
            ]),
      ]),
      GoRoute(path: 'categoriesEdit', builder: (context, state) => const CategoriesEditPage(), routes: [
        GoRoute(
            path: ':idCat',
            builder: (context, state) => ProductsPage(
                  idCategory: int.parse(state.pathParameters["idCat"]!),
                  isEdit: true,
                ),
            routes: [
              GoRoute(
                path: 'productsEdit/:productsId',
                builder: (context, state) =>
                    ProductDetailEditPage(idProd: int.parse(state.pathParameters['productsId']!)),
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
