import 'package:flutter/material.dart';

class resetPwdPage extends StatefulWidget {
  const resetPwdPage({super.key});

  @override
  State<resetPwdPage> createState() => _resetPwdPageState();
}

class _resetPwdPageState extends State<resetPwdPage> {
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
