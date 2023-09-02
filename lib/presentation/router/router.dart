import 'package:fake_store_joao/presentation/screen/categories_page.dart';
import 'package:fake_store_joao/presentation/screen/home_page.dart';
import 'package:fake_store_joao/presentation/screen/login_page.dart';
import 'package:fake_store_joao/presentation/screen/product_detail_page.dart';
import 'package:fake_store_joao/presentation/screen/products_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
        path: '/categories',
        builder: (context, state) => const CategoriesPage(),
        routes: [
          GoRoute(
              path: 'products',
              builder: (context, state) => const ProductsPage(),
              routes: [
                GoRoute(
                  path: ':productsId',
                  builder: (context, state) => ProductDetailPage(
                      idProd: int.parse(state.pathParameters['productsId']!)),
                ),
              ]),
        ]),
  ],
);
