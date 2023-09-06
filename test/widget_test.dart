// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:f_testing_template/ui/pages/authentication/login.dart';
import 'package:f_testing_template/ui/pages/authentication/signup.dart';
import 'package:f_testing_template/ui/pages/content/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('Widget login validación @ email', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: LoginScreen(email: 'blank', password: 'blank')));

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'emailinvalido');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pump();

    expect(find.text('Enter valid email address'), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'email@valido.jeje');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pump();

    expect(find.text('Enter valid email address'), findsNothing);
  });

  testWidgets('Widget login validación campo vacio email',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: LoginScreen(email: 'blank', password: 'blank')));

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), '');
    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pump();

    expect(find.text('Enter email'), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'email@valido.com');
    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pump();

    expect(find.text('Enter email'), findsNothing);
  });

  testWidgets('Widget login validación número de caracteres password',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: LoginScreen(email: 'blank', password: 'blank')));

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '123');
    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pump();

    expect(find.text('Password should have at least 6 characters'),
        findsOneWidget);

    await tester.enterText(find.byKey(const Key('TextFormFieldLoginPassword')),
        'contrasenia_con_mas_de_6_caracteres');
    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pump();

    expect(
        find.text('Password should have at least 6 characters'), findsNothing);
  });

  testWidgets('Widget login validación campo vacio password',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: LoginScreen(email: 'blank', password: 'blank')));

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '');
    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pump();

    expect(find.text('Enter password'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('TextFormFieldLoginPassword')),
        'email@valido.com');
    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pump();

    expect(find.text('Enter password'), findsNothing);
  });

  testWidgets('Widget login autenticación exitosa',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
            key: Key('LoginScreen'),
            email: 'email@valido.com',
            password: '1234567')));

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'email@valido.com');
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '1234567');
    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('LoginScreen')), findsNothing);
    expect(find.byKey(const Key('HomePage')), findsOneWidget);
  });

  testWidgets('Widget login autenticación no exitosa',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
            key: Key('LoginScreen'),
            email: 'email@valido.com',
            password: '1234567')));

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'email@novalido.com');
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '12345678');
    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);
    expect(find.byKey(const Key('HomePage')), findsNothing);
  });

  testWidgets('Widget signUp validación @ email', (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: SignUpPage(key: Key('SignUpPage'))));

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'emailinvalido');

    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));

    await tester.pump();

    expect(find.text('Enter valid email address'), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'email@valido.jeje');

    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));

    await tester.pump();

    expect(find.text('Enter valid email address'), findsNothing);
  });

  testWidgets('Widget signUp validación campo vacio email',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: SignUpPage(key: Key('SignUpPage'))));

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), '');
    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
    await tester.pump();

    expect(find.text('Enter email'), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'email@valido.com');
    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
    await tester.pump();

    expect(find.text('Enter email'), findsNothing);
  });

  testWidgets('Widget signUp validación número de caracteres password',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: SignUpPage(key: Key('SignUpPage'))));

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), '123');
    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
    await tester.pump();

    expect(find.text('Password should have at least 6 characters'),
        findsOneWidget);

    await tester.enterText(find.byKey(const Key('TextFormFieldSignUpPassword')),
        'contrasenia_con_mas_de_6_caracteres');
    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
    await tester.pump();

    expect(
        find.text('Password should have at least 6 characters'), findsNothing);
  });

  testWidgets('Widget signUp validación campo vacio password',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: SignUpPage(key: Key('SignUpPage'))));

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), '');
    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
    await tester.pump();

    expect(find.text('Enter password'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('TextFormFieldSignUpPassword')),
        'email@valido.com');
    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
    await tester.pump();

    expect(find.text('Enter password'), findsNothing);
  });

  testWidgets('Widget home visualización correo', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: HomePage(
      key: Key('HomePage'),
      loggedEmail: "mi@correo.com",
      loggedPassword: "1234567",
    )));

    expect(find.text('Hello mi@correo.com'), findsOneWidget);
  });

  testWidgets('Widget home nevegación detalle', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: HomePage(
      key: Key('HomePage'),
      loggedEmail: "mi@correo.com",
      loggedPassword: "1234567",
    )));

    await tester.tap(find.byKey(const Key('ButtonHomeDetail')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('DetailPage')), findsOneWidget);
  });

  testWidgets('Widget home logout', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: HomePage(
      key: Key('HomePage'),
      loggedEmail: "mi@correo.com",
      loggedPassword: "1234567",
    )));

    await tester.tap(find.byKey(const Key('ButtonHomeLogOff')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);
    expect(find.byKey(const Key('HomePage')), findsNothing);
  });
}
