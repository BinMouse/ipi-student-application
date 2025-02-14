import 'package:flutter/material.dart';
import 'package:ipi_app/primitives/test_fetch.dart';
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

  // Создаем контроллеры для текстовых полей
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //Functions

  @override
  void dispose() {
    // Очищаем контроллеры, чтобы избежать утечек памяти
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                    controller: usernameController,
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
                    controller: passwordController,
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
                      onPressed: () async {
                        String username = usernameController.text;
                        String password = passwordController.text;
                        if (username == "/newIP"){
                          TestFetch.instance.updateIP(password);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'IP адрес обновлён на $password',
                              ),
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.green,
                            ),
                          );
                          return;
                        }
                        int statusCode = await TestFetch.instance.Login(username, password);
                        if (statusCode == 200) {
                          int uStatusCode = await TestFetch.instance.UpdateProfileInfo();
                          if (uStatusCode == 200){
                            Navigator.pushNamed(context, "/home");
                          }
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Ошибка получения данных: $statusCode',
                                ),
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                statusCode == 401
                                    ? 'Неверный логин или пароль'
                                    : 'Ошибка подключения: $statusCode',
                              ),
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
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
