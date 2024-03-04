import 'package:flutter/material.dart';

class EnterEmailOtp extends StatefulWidget {
  const EnterEmailOtp({super.key});

  @override
  State<EnterEmailOtp> createState() => _EnterEmailOtpState();
}

class _EnterEmailOtpState extends State<EnterEmailOtp> {
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
            Center(
              child: TextField(
                controller: otpController,
                autofocus: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the OTP'),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(onPressed: () {}, child: const Text('Verify OTP'))
          ],
        ),
      ),
    );
  }
}
