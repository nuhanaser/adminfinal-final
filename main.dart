import 'dart:ui';

import 'package:app/addingre2.dart';
import 'package:app/favo.dart';
import 'package:app/first_page.dart';
import 'package:app/food2.dart';
import 'package:app/ingre.dart';
import 'package:app/profile.dart';
import 'package:app/signup.dart';
import 'package:app/statis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() async {
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en', supportedLocales: ['en', 'ar']);

  runApp(LocalizedApp(delegate, MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Invisible Chef ',
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            localizationDelegate
          ],
          supportedLocales: localizationDelegate.supportedLocales,
          locale: localizationDelegate.currentLocale,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          //home: addingre(),
          //home: const AddIngre(),
          //home: statisPage(), // for statistics
          //home: firstPage(), // for welcome
          // home: MyHomePage() //login
          //home: const foodPage(),
          home: ingre()
          //home:favPage(favoriteImagePaths: favoriteImagePaths)
          ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class WaveClipperTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;
  bool isScure = true;

  @override
  bool shouldReclip(WaveClipperTwo oldClipper) => false;
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _showPassword = false;

  bool isScure = true;
  String passWord = "";
  String userName = "";
  String phone = "";

  IconData passIcon = Icons.remove_red_eye;

  TextEditingController textEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: 360,
            height: 800,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(children: [
              Positioned(
                left: -85,
                top: -138,
                child: Container(
                  width: 530,
                  height: 1155,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                  left: -14,
                  top: -235,
                  child: Container(
                      width: 402,
                      height: 1111,
                      child: Stack(children: [
                        Positioned(
                          left: 286,
                          top: 303,
                          child: Container(
                            width: 88,
                            height: 172,
                            decoration: BoxDecoration(color: Color(0xFF156260)),
                          ),
                        ),
                        Positioned(
                          left: 14,
                          top: 0,
                          child: Container(
                            width: 388,
                            height: 388,
                            decoration: ShapeDecoration(
                              color: Color(0xFF156260),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(111),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 388,
                          child: Container(
                            width: 388,
                            height: 723,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(111),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 99,
                          top: 290,
                          child: Text(
                            'Invisible Chef',
                            style: GoogleFonts.raleway(
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 100,
                          top: (800 - 10) / 2,
                          child: Text(
                            ' تسجيل الدخول',
                            style: TextStyle(
                              color: Color(0xFF156260),
                              fontSize: 25,
                              //fontFamily: 'Tajawal',
                              fontWeight: FontWeight.normal,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 68,
                          top: 523,
                          child: SizedBox(
                            width: 250,
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'اسم المستخدم',
                                hintText: "أدخل اسم المتسخدم",
                                hintStyle: const TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 50), // Adjust padding here

                                suffixIcon: const Icon(
                                    Icons.person), // Add the icon here
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 68,
                          top: 600,
                          child: SizedBox(
                            width: 250,
                            height: 50,
                            child: TextField(
                              controller: _passwordController,
                              //obscureText:!_showPassword, // استخدام قيمة معكوسة لعرض/إخفاء كلمة المرور
                              obscureText: !_showPassword,
                              decoration: InputDecoration(
                                labelText: 'كلمة المرور',
                                hintText: "أدخل كلمة المرور",
                                hintStyle: const TextStyle(fontSize: 14),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                // إضافة زر لتبديل رؤية كلمة المرور
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _showPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    // تبديل قيمة المتغير لعرض/إخفاء كلمة المرور
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 110,
                          top: 695,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const statisPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF156260), // لون الخلفية
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(100.0), // شكل الحواف
                              ),
                              elevation: 8, // ارتفاع الظل
                            ),
                            child: const Text(
                              'تــسـجــيــل',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.normal,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ] //children
                          ) //stack
                      ))
            ])));
  }
}
