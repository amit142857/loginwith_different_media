import 'package:flutter/material.dart';
import 'package:login_with_different_online_media/email_verification/enter_email_otp.dart';

class EnterEmailScreen extends StatefulWidget {
  const EnterEmailScreen({super.key});

  @override
  State<EnterEmailScreen> createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<EnterEmailScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                autofocus: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter your email'),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const EnterEmailOtp();
                    },
                  ));
                },
                child: const Text('Get OTP'))
          ],
        ),
      ),
    );
  }
}
