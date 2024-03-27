import 'package:fake_store_joao/core/constants/endpoints.dart';
import 'package:fake_store_joao/data/http/http_connection.dart';
import 'package:fake_store_joao/data/repositories/authentication_repository.dart';
import 'package:fake_store_joao/logic/bloc/get_user/get_user_bloc.dart';
import 'package:fake_store_joao/logic/bloc/login/login_bloc.dart';
import 'package:fake_store_joao/logic/get_it/init_get_it.dart';
import 'package:fake_store_joao/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';
import 'package:http/http.dart' as http;

import 'login_page_test.mocks.dart';

class MockHttpClient extends Mock implements HttpClientsTest {}

@GenerateMocks([http.Client])
void main() {
  testWidgets('Verify that the add user button adds user to database', (WidgetTester tester) async {
    final mockHttpClients = HttpClientsTest(MockClient());
    final mockRepository = AuthenticationRepository(mockHttpClients);

    Map<String, dynamic> body = {
      "email": "joao@joao.com",
      "password": "1234",
    };

    
    // need to setup to reutnr when to others methods


    when(mockHttpClients.httpPost(endpoint: Endpoints.auth + Endpoints.login, body: body)).thenAnswer((_) async {
      print(_);
      return const Success("success");
    });

    binds.registerSingleton<LoginBloc>(LoginBloc(mockRepository));
    binds.registerSingleton<GetUserBloc>(GetUserBloc(mockRepository));

    binds.get<GetUserBloc>();

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

// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:your_package_name/authentication_repository.dart'; // Import your classes
// import 'package:your_package_name/main.dart'; // Import your main.dart file or any file where MyApp is defined

// void mains() {
//   testWidgets('Verify that the add user button adds user to database', (WidgetTester tester) async {
//     // Create mock HTTP client
//     final mockHttpClient = MockHttpClient();

//     // Define test data
//     final email = 'joao@joao.com';
//     final password = '1234';
//     final response = Success('success');

//     // Mock the behavior of httpPost
//     when(mockHttpClient.httpPost(endpoint: anyNamed('endpoint'), body: anyNamed('body')))
//         .thenAnswer((_) async => response);

//     // Build the widget
//     await tester.pumpWidget(MyApp(httpClient: mockHttpClient));

//     // Find text fields and enter values
//     final emailField = find.byKey(const Key('email_field'));
//     expect(emailField, findsOneWidget);
//     await tester.enterText(emailField, email);

//     final passwordField = find.byKey(const Key('password_field'));
//     expect(passwordField, findsOneWidget);
//     await tester.enterText(passwordField, password);

//     // Find and tap the login button
//     final loginButton = find.byKey(const Key('login_button'));
//     expect(loginButton, findsOneWidget);
//     await tester.tap(loginButton);
//     await tester.pump();

//     // Wait for the UI to update
//     await tester.pumpAndSettle();

//     // Verify that the user is added to the database
//     verify(mockHttpClient.httpPost(endpoint: Endpoints.auth + Endpoints.login, body: {
//       'email': email,
//       'password': password,
//     })).called(1);
//   });
// }
