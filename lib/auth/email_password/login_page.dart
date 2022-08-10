import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailEC.dispose();
    passwordEC.dispose();
  }

  Future<void> loginUser() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailEC.text, password: passwordEC.text);

    final user = credential.user;
    var message = '';
    if (user != null && !user.emailVerified) {
      message = 'E-mail não confirmado, por favor verifique seu email.';
    } else {
      message = 'E-mail validado com sucesso!';
    }

    user?.updateDisplayName('Cesar Bassani');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );

    print(credential.user?.email);
    print(credential.user?.emailVerified);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login de Usuário'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: emailEC,
                decoration: InputDecoration(
                  label: Text('e-mail'),
                ),
              ),
              TextField(
                controller: passwordEC,
                decoration: InputDecoration(
                  label: Text('Senha'),
                ),
              ),
              ElevatedButton(
                onPressed: loginUser,
                child: Text('Login usuário'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
