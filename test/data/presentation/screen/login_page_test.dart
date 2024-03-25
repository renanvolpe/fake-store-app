import 'package:fake_store_joao/core/constants/endpoints.dart';
import 'package:fake_store_joao/data/http/http_connection.dart';
import 'package:fake_store_joao/data/repositories/authentication_repository.dart';
import 'package:fake_store_joao/logic/bloc/get_user/get_user_bloc.dart';
import 'package:fake_store_joao/logic/bloc/login/login_bloc.dart';
import 'package:fake_store_joao/logic/get_it/init_get_it.dart';
import 'package:fake_store_joao/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';

class MockHttpClients extends Mock implements HttpClients {
  static String authority = Endpoints.baseUrl;
  static String v1 = Endpoints.v1;
}

class MockAuthenticationRepository extends Mock implements AuthenticationRepository {
  final HttpClients httpClient;

  MockAuthenticationRepository(this.httpClient);

  
}

void main() {
  testWidgets('Verify that the add user button adds user to database', (WidgetTester tester) async {
    final mockHttpClients = MockHttpClients();
    final mockRepository = MockAuthenticationRepository(mockHttpClients);

     when(mockRepository.loginUser("joao@joao.com", "1234"))
        .thenAnswer((_) async => await Future(() => const Success("TokenMock")));

    binds.registerSingleton<LoginBloc>(LoginBloc(mockRepository));
    binds.registerSingleton<GetUserBloc>(GetUserBloc(mockRepository));
    // binds.get<GetUserBloc>();

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // expect(LoginPage, findsOneWidget);

    var textField = find.byType(TextFormField);
    expect(textField, findsNWidgets(2));

    // Act
    var btnSignIn2 = find.byKey(const Key("Login button"));
    expect(btnSignIn2, findsOneWidget);
    await tester.tap(btnSignIn2);
    await tester.pump();
  });
}

// void mains() {
//   testWidgets('Verify that the add user button adds user to database', (WidgetTester tester) async {
//     // Arrange
//     final mockHttpClients = MockHttpClients();
//     final mockRepository = MockAuthenticationRepository(mockHttpClients); // Pass mock HttpClients to mock repository
//     // Mocking the loginUser method properly
//     when(mockRepository.loginUser("any", "any")).thenAnswer((_) async => Success("TokenMock"));
//     final mockLoginBloc = LoginBloc(mockRepository); // Create a mock instance of LoginBloc
//     await tester.pumpWidget(MyApp(loginBloc: mockLoginBloc)); // Pass the bloc instance to your widget
//     await tester.pumpAndSettle();

//     // Your test implementation
//   });
// }

// class MockHttpClients extends Mock implements HttpClients {} // Mock HttpClients

// class MockAuthenticationRepository extends Mock implements AuthenticationRepository {
//   final HttpClients httpClient; // HttpClients instance in your mock repository

//   MockAuthenticationRepository(this.httpClient); // Constructor to pass HttpClients
// }

// void main() {
//   testWidgets('Verify that the add user button adds user to database', (WidgetTester tester) async {
//     // Arrange
//     final mockHttpClients = MockHttpClients();
//     final mockRepository = MockAuthenticationRepository(mockHttpClients); // Pass mock HttpClients to mock repository
//     // Mocking the loginUser method properly
//     when(mockRepository.loginUser(any, any)).thenAnswer((_) async => const Success("TokenMock"));
//     final mockLoginBloc = LoginBloc(mockRepository); // Create a mock instance of LoginBloc
//     await tester.pumpWidget(MyApp(loginBloc: mockLoginBloc)); // Pass the bloc instance to your widget
//     await tester.pumpAndSettle();

//     // Your test implementation
//   });
// }
