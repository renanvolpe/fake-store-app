import 'package:fake_store_joao/data/models/address.dart';
import 'package:fake_store_joao/presentation/screen/addresses_edit_page.dart';
import 'package:fake_store_joao/presentation/screen/addresses_page.dart';
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
    GoRoute(path: '/home', builder: (context, state) => const HomePage(), routes: [
      GoRoute(path: 'categories', builder: (context, state) => const CategoriesPage(), routes: [
        GoRoute(
            name: "products",
            path: 'products',
            builder: (context, state) => ProductsPage(
                  nameCat: state.uri.queryParameters["nameCat"],
                  idCategory: int.parse(state.uri.queryParameters["idCat"]!),
                ),
            routes: [
              GoRoute(
                name: "product_detail",
                path: 'product_detail',
                builder: (context, state) => ProductDetailPage(idProd: int.parse(state.uri.queryParameters["idProd"]!)),
              ),
            ]),
      ]),
      GoRoute(
          name: "categories_edit",
          path: 'categories_edit',
          builder: (context, state) => const CategoriesEditPage(),
          routes: [
            GoRoute(
                name: "products_edit",
                path: 'products_edit',
                builder: (context, state) => ProductsPage(
                      idCategory: int.parse(state.uri.queryParameters["idCat"]!),
                      isEdit: true,
                    ),
                routes: [
                  GoRoute(
                    path: 'products_detail_edit',
                    name: 'products_detail_edit',
                    builder: (context, state) =>
                        ProductDetailEditPage(idProd: int.parse(state.uri.queryParameters['products_id']!)),
                  ),
                ]),
          ]),
      GoRoute(path: 'address', builder: (context, state) => const AddressesPage(), routes: [
        GoRoute(
          name: "address_edit",
          path: 'address_edit',
          builder: (context, state) => AddressesEditPage(selectedAddress: state.extra as Address?),
        ),
      ]),
    ]),
    GoRoute(
      path: '/account',
      builder: (context, state) => const MyAccountPage(),
    ),
  ],
);
