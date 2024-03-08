// import 'package:fake_store_joao/data/models/params/product_params.dart';
// import 'package:fake_store_joao/data/models/product.dart';
// import 'package:fake_store_joao/data/models/product_create.dart';
// import 'package:fake_store_joao/data/repositories/products_repository.dart';
// import 'package:result_dart/result_dart.dart';

// // class ProductsUseCase extends UseCase<Product, String> {
// //   final ProductRepository productRepository;

// //   ProductsUseCase({required this.productRepository});

// //   @override
// //   Future<Result<Product, String>> call(ProductsParams params) async {
// //     var response = await productRepository.getOneProduct(params.idProd);
// //     return response.fold((success) {
// //       //CALL VALIDATION USECASE HERE
// //       return Success(success);
// //     }, (failure) {
// //       //CALL VALIDATION USECASE HERE
// //        return Failure(failure);
// //     });
// //   }
// // }

// // abstract class UseCase<T, R> {
// //      call(Params params);
// // }

// abstract class ProductsUseCaseService {
//   getAllProducts(int categoryId);
//   getOneProduct(int idProduct);
//   updateProduct(Product product);
//   deleteProduct(int id);
//   createProduct(ProductCreate product);
// }

// class ProductsUseCase   implements ProductsUseCaseService {
//   final ProductRepository productRepository;

//   ProductsUseCase({required this.productRepository});

//   Future<Result<Product, String>> call(ProductsParams params) async {
//     var response = await productRepository.getOneProduct(params.idProd);
//     return response.fold((success) {
//       //CALL VALIDATION USECASE HERE
//       return Success(success);
//     }, (failure) {
//       //CALL VALIDATION USECASE HERE
//       return Failure(failure);
//     });
//   }
// }

