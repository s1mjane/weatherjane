import 'package:flutter/material.dart';

class forgotPwdPage extends StatefulWidget {
  const forgotPwdPage({super.key});

  @override
  State<forgotPwdPage> createState() => _forgotPwdPageState();
}

class _forgotPwdPageState extends State<forgotPwdPage> {
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
          Navigator.pushNamed(context, '/resetPwd');
        },
        child: const Text(
          "링크 보내기",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
