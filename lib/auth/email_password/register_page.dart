import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailEC.dispose();
    passwordEC.dispose();
  }

  Future<void> registerUser() async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailEC.text, password: passwordEC.text);

    credential.user?.sendEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
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
                onPressed: registerUser,
                child: Text('Cadastrar usuário'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
