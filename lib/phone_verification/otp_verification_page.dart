import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_with_different_online_media/dashboard/dashboard.dart';

class OTPVerificationPage extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;
  const OTPVerificationPage(
      {super.key, required this.verificationId, required this.phoneNumber});

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify OTP"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter OTP'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  try {
                    verifyOtp();
                  } catch (ex) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(ex.toString()),
                    ));
                  }
                },
                child: const Text('Verify OTP'))
          ],
        ),
      ),
    );
  }

  verifyOtp() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otpController.text.toString());
    FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return DashboardScreen(
          user: widget.phoneNumber,
        );
      },
    ));
  }
}
