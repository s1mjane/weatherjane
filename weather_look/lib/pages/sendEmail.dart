import 'package:flutter/material.dart';

class sendEmailPage extends StatefulWidget {
  const sendEmailPage({super.key});

  @override
  State<sendEmailPage> createState() => _sendEmailPageState();
}

class _sendEmailPageState extends State<sendEmailPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            )),
        onPressed: () {
          Navigator.pushNamed(context, '/createUser');
        },
        child: const Text(
          "확인",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
