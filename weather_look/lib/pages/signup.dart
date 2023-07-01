import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_look/util/auth.dart';

import '../util/google_button.dart';
import 'login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _confirmPwdController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          child: Column(
            children: [
              SizedBox(height: (MediaQuery.of(context).size.height) / 5.26),
              Image.asset('asset/image/weatherlook_logo.png', width: 120),
              SizedBox(height: (MediaQuery.of(context).size.height) / 13),
              emailInput(),
              SizedBox(height: (MediaQuery.of(context).size.height) / 66.66),
              passwordInput(),
              SizedBox(height: (MediaQuery.of(context).size.height) / 50),
              passwordInputCheck(),
              SizedBox(height: (MediaQuery.of(context).size.height) / 31),
              submitButton(),
              SizedBox(height: (MediaQuery.of(context).size.height) / 90),
              loginTextButton(),
              SizedBox(height: (MediaQuery.of(context).size.height) / 42),
              googleLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailInput() {
    return SizedBox(
      width: 280,
      height: 48,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
        autofocus: true,
        validator: (val) {
          if (val!.isEmpty) {
            return '이메일을 잘못 입력하셨습니다.';
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

  Widget passwordInput() {
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
          }
          // 비밀번호 유효성 검사 (8글자 이상, 대문자/소문자, 특수기호1개이상)
          // else if () {}
          else {
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

  Widget passwordInputCheck() {
    return SizedBox(
      width: 280,
      height: 48,
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        controller: _confirmPwdController,
        obscureText: true,
        autofocus: true,
        validator: (val) {
          if (val!.isEmpty) {
            return '비밀번호를 잘못 입력하셨습니다.';
          }
          // passwordInputCheck와 같은지 비교
          // else if () {}
          else {
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
          hintText: '비밀번호 확인',
          hintStyle: TextStyle(fontSize: 16, color: Color(0xff9E9E9E)),
          filled: true,
          fillColor: Color(0xffE8E8E8),
        ),
      ),
    );
  }

  Widget loginTextButton() {
    return TextButton(
        child: const Text('로그인 >',
            style: TextStyle(color: Color(0xff626262), fontSize: 12)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        });
  }

  Widget submitButton() {
    return SizedBox(
      width: 280,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            )),
        onPressed: () async {
          try {
            // 사용자 생성 및 이메일 인증 메일 전송
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _emailController.text,
              password: _pwdController.text,
            );
            await FirebaseAuth.instance.currentUser!.sendEmailVerification();

            // 이메일 인증 완료 대기
            await FirebaseAuth.instance.currentUser!.reload();
            if (FirebaseAuth.instance.currentUser!.emailVerified) {
              // 이메일 인증이 완료되었을 경우 이메일 확인 페이지로 이동
              Navigator.pushNamed(context, '/sendEmailPabe()');
            } else {
              // 이메일 인증이 완료되지 않았을 경우 알림 메시지 표시
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('이메일 인증 필요'),
                  content: const Text('이메일 인증 후에 로그인해주세요.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('확인'),
                    ),
                  ],
                ),
              );
            }
          } catch (e) {
            // 오류 처리
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('오류'),
                content: const Text('오류가 발생했습니다. 다시 시도해주세요.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('확인'),
                  ),
                ],
              ),
            );
          }
        },
        child: const Text(
          "회원가입",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
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
