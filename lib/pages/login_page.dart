import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // Variables
  static const double horizontalPadding = 25;
  static const double textFieldRadius = 15;

  //Functions


  // Common TextField decoration
  InputDecoration textFieldDecoration(String labelText, Icon? prefixIcon) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(textFieldRadius)),
      ),
      fillColor: Color(0xff144594),
      filled: true,
      labelText: labelText,
      labelStyle: TextStyle(
        color: Colors.white,
        fontFamily: "Montserrat",
        fontSize: 20,
      ),
      prefixIcon: prefixIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment(0, -0.7),
            colors: <Color>[
              Color(0xff00235c),
              Color(0x984d93ff),
            ],
          ),
        ),

        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: 40),

                  const Image(
                    image: AssetImage('assets/images/ipi_logo/2x/ipi_logo_2_white_xhdpi.png'),
                    width: 250,
                    height: 250,
                  ),

                  SizedBox(height: 20),

                  TextField(
                    obscureText: false,
                    decoration: textFieldDecoration("Логин", Icon(Icons.account_circle, color: Colors.white)),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 20,
                    ),
                    cursorColor: Colors.white,
                  ),

                  SizedBox(height: 10),

                  TextField(
                    obscureText: true,
                    decoration: textFieldDecoration("Пароль", Icon(Icons.lock, color: Colors.white)),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 20,
                    ),
                    cursorColor: Colors.white,
                  ),

                  SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/home");
                      },
                      child: Text("Войти"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(textFieldRadius),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        textStyle: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
