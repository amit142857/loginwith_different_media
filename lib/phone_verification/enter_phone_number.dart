import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_with_different_online_media/phone_verification/otp_verification_page.dart';

class EnterPhoneNumber extends StatefulWidget {
  const EnterPhoneNumber({super.key});

  @override
  State<EnterPhoneNumber> createState() => _EnterPhoneNumberState();
}

class _EnterPhoneNumberState extends State<EnterPhoneNumber> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Auth'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneController,
              autofocus: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your phone number'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException ex) {},
                      codeSent: (String verificationId, int? resendToken) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return  OTPVerificationPage(
                              phoneNumber: phoneController.text.toString() ,
                              verificationId: verificationId,
                            );
                          },
                        ));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {}, 
                      phoneNumber: phoneController.text.toString()
                      );
                },
                child: const Text('Get OTP'))
          ],
        ),
      ),
    );
  }
}
