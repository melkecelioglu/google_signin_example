import 'package:google_signin_example/page/auth_page.dart';
import 'package:google_signin_example/widget/background_painter.dart';
import 'package:google_signin_example/widget/google_signup_button_widget.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          buildSignUp(context),
        ],
      );

  Widget buildSignUp(BuildContext context) => Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 175,
              child: Text(
                'Welcome To the App',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Spacer(),
          Text('Login to Continue'),
          SizedBox(height: 12),
          OutlineButton(
            child: Text('Sign In'),
            color: Colors.pink,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            highlightedBorderColor: Colors.pinkAccent,
            
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.indigoAccent,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AuthPage()),
            ),
          ),
          SizedBox(height: 12),
          GoogleSignupButtonWidget(),
          Spacer()
        ],
      );
}