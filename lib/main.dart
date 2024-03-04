import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_with_different_online_media/dashboard/dashboard.dart';
import 'package:login_with_different_online_media/email_verification/enter_email_screen.dart';
import 'package:login_with_different_online_media/phone_verification/enter_phone_number.dart';
import 'package:login_with_different_online_media/firebase_options/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Login Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/icons/imggoole.svg'),
                  const SizedBox(width: 15),
                  const Text("Login with Google")
                ],
              ),
              onPressed: () {
                signInWithGoogle();
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/icons/phoneee.png', height: 24, width: 24),
                const SizedBox(width: 15),
                const Text("Phone number verification")
              ],
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const EnterPhoneNumber();
                },
              ));
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/icons/email.jpg', height: 24, width: 24),
                const SizedBox(width: 15),
                const Text("Verify with Email")
              ],
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const EnterEmailScreen();
                },
              ));
            },
          ),
        ],
      ),
    );
  }

  signInWithGoogle() async {
    GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? gAuth = await gUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: gAuth?.accessToken, idToken: gAuth?.idToken);

    UserCredential? user =
        await FirebaseAuth.instance.signInWithCredential(credential);

    if (user.user?.displayName != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return DashboardScreen(
            user: user.user?.displayName,
          );
        },
      ));
    }
  }
}
