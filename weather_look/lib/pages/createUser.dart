import 'package:flutter/material.dart';

class createUserPage extends StatefulWidget {
  const createUserPage({super.key});

  @override
  State<createUserPage> createState() => _createUserPageState();
}

class _createUserPageState extends State<createUserPage> {
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
          Navigator.pushNamed(context, '/login');
        },
        child: const Text(
          "로그인하기",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
