import 'package:fake_store_joao/core/router/router.dart';
import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/data/models/profile/user/email.dart';
import 'package:fake_store_joao/data/models/profile/user/name.dart';
import 'package:fake_store_joao/data/models/profile/user/password.dart';
import 'package:fake_store_joao/data/models/profile/user/user.dart';
import 'package:fake_store_joao/data/repositories/authentication_repository.dart';
import 'package:fake_store_joao/logic/bloc/get_user/get_user_bloc.dart';
import 'package:fake_store_joao/logic/bloc/login/login_bloc.dart';
import 'package:fake_store_joao/logic/get_it/init_get_it.dart';
import 'package:fake_store_joao/presentation/screen/loading_page.dart';
import 'package:fake_store_joao/presentation/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';

import 'login_page_test.mocks.dart';

@GenerateMocks([AuthenticationRepository])
void main() {
  late MockAuthenticationRepository mockRepository;

  setUpAll(() {
    mockRepository = MockAuthenticationRepository();
      when(mockRepository.loginUser("joao@joao.com", "1234")).thenAnswer((_) async => Success(token));

      when(mockRepository.getProfile(token)).thenAnswer((_) async => Success(User(
          name: Name("joao"),
          email: Email("joao@joao.com"),
          password: Password("1234"),
          avatar: "",
          role: "admin",
          id: 1,
          creationAt: "",
          updatedAt: "")));
  });

  group("Test login page components and states", () {
    testWidgets('Verify that the add user button adds user to database', (WidgetTester tester) async {
      
      // SetupBinds.setupAuthData();

      binds.registerSingleton<LoginBloc>(LoginBloc(mockRepository));
      binds.registerSingleton<GetUserBloc>(GetUserBloc(mockRepository));

      await tester.pumpWidget(MaterialApp.router(
        title: 'Volpe app',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorsApp.kPrimary),
          useMaterial3: true,
        ),
        routerConfig: router,
      ));

      // await tester.pumpAndSettle();

      var loginPage = find.byType(LoginPage);
      expect(loginPage, findsOneWidget);

      var textField = find.byType(TextFormField);
      expect(textField, findsNWidgets(2));

      // Act
      var btnSignIn2 = find.byKey(const Key("Login button"));
      expect(btnSignIn2, findsOneWidget);
      await tester.tap(btnSignIn2);

      await tester.pump();
      // await tester.pumpAndSettle();

      var loginPage2 = find.byType(LoginPage);
      expect(loginPage2, findsOneWidget);

      var loadingPage = find.byType(LoadingPage);
      expect(loadingPage, findsOneWidget);
      // await tester.pump();
      // await tester.pumpAndSettle();
      // var homePage = find.byType(HomePage);
      // expect(loadingPage, findsOneWidget);
      // await tester.pump();
      // expect(LoadingPage, findsOneWidget);
    });
  });
}

String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjM2LCJpYXQiOjE3MTE5ODcwMzIsImV4cCI6MTcxMzcxNTAzMn0.nGJCm8tOPz6n7b1wB9dwzcAAvhzZEFdJA8ba80bSA8Q";
var jsonLoginUnauthorized = '{"message": "Unauthorized", "statusCode": 401}';

var jsonLoginAuthorized =
    '{"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjM2LCJpYXQiOjE3MTE5ODcwMzIsImV4cCI6MTcxMzcxNTAzMn0.nGJCm8tOPz6n7b1wB9dwzcAAvhzZEFdJA8ba80bSA8Q","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjM2LCJpYXQiOjE3MTE5ODcwMzIsImV4cCI6MTcxMjAyMzAzMn0.OFs_5UBwv9Nbgt9giWCAMwKlPfS7I5EC7fI5NiisfOU"}';
