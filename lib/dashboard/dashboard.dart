import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_with_different_online_media/main.dart';

class DashboardScreen extends StatelessWidget {
  final String? user;
  const DashboardScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return MyHomePage();
                    },
                  ));
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: Center(
        child: Text(' Welcome ${user ?? 'No Name'}'),
      ),
    );
  }
}
