import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShowUser extends StatefulWidget {
  const ShowUser({Key? key}) : super(key: key);

  @override
  State<ShowUser> createState() => _ShowUserState();
}

class _ShowUserState extends State<ShowUser> {
  User? user;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário Logado'),
      ),
      body: Column(
        children: [
          Text(user?.displayName ?? ''),
          Text(user?.email ?? ''),
          Text(user?.photoURL ?? ''),
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text('Sair'),
          ),
        ],
      ),
    );
  }
}
