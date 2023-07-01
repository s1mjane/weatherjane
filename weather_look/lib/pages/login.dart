import 'package:flutter/material.dart';
import '../../util/auth.dart';
import '../../util/google_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _key,
          child: Column(
            children: [
              SizedBox(height: (MediaQuery.of(context).size.height) / 5.26),
              Image.asset('asset/image/weatherlook_logo.png', width: 120),
              SizedBox(height: (MediaQuery.of(context).size.height) / 10.48),
              emailInput(),
              SizedBox(height: (MediaQuery.of(context).size.height) / 40),
              passwordInput(),
              SizedBox(height: (MediaQuery.of(context).size.height) / 25),
              loginButton(),
              SizedBox(height: (MediaQuery.of(context).size.height) / 90),
              pwdAndSubmitButton(),
              SizedBox(height: (MediaQuery.of(context).size.height) / 10),
              googleLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox emailInput() {
    return SizedBox(
      width: 280,
      height: 48,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
        autofocus: true,
        validator: (val) {
          if (val!.isEmpty) {
            return '이메일을 입력해주세요.';
          } else {
            return null;
          }
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Color(0xffDD5441))),
          hintText: '이메일',
          hintStyle: TextStyle(fontSize: 16, color: Color(0xff9E9E9E)),
          filled: true,
          fillColor: Color(0xffE8E8E8),
        ),
      ),
    );
  }

  SizedBox passwordInput() {
    return SizedBox(
      width: 280,
      height: 48,
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        controller: _pwdController,
        obscureText: true,
        autofocus: true,
        validator: (val) {
          if (val!.isEmpty) {
            return '비밀번호를 잘못 입력하셨습니다.';
          } else {
            return null;
          }
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Color(0xffDD5441))),
          hintText: '비밀번호',
          hintStyle: TextStyle(fontSize: 16, color: Color(0xff9E9E9E)),
          filled: true,
          fillColor: Color(0xffE8E8E8),
        ),
      ),
    );
  }

  SizedBox loginButton() {
    return SizedBox(
      width: 280,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            )),
        onPressed: () async {},
        child: const Text(
          "로그인",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget pwdAndSubmitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          child: const Text('비밀번호 찾기 >',
              style: TextStyle(color: Color(0xff626262), fontSize: 12)),
          onPressed: () {
            Navigator.pushNamed(context, '/forgotPwd');
          },
        ),
        const Text('    /    ',
            style: TextStyle(color: Color(0xff626262), fontSize: 12)),
        TextButton(
          child: const Text(
            '회원가입 >',
            style: TextStyle(color: Color(0xff626262), fontSize: 12),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/signup');
          },
        ),
      ],
    );
  }

  Widget googleLoginButton() {
    return FutureBuilder(
      future: Authentication.initializeFirebase(context: context),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error initializing Firebase');
        } else if (snapshot.connectionState == ConnectionState.done) {
          return const GoogleSignInButton();
        }
        return const CircularProgressIndicator(
          color: Color(0xff0c4c8a),
        );
      },
    );
  }
}
