import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pecbr_pecuarista_app/auth/email_password/login_page.dart';
import 'package:pecbr_pecuarista_app/auth/email_password/register_page.dart';
import 'package:pecbr_pecuarista_app/auth/show_user.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/auth/email_password/register': (_) => RegisterPage(),
        '/auth/email_password/login': (_) => LoginPage(),
        '/auth/show_user': (_) => ShowUser(),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      print('Usuário logado? ${user != null}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/auth/email_password/register');
              },
              child: Text('Register User E-mail Password'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/auth/email_password/login');
              },
              child: Text('Login User E-mail Password'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/auth/show_user');
              },
              child: Text('Show user Logged'),
            ),
          ],
        ),
      ),
    );
  }
}
