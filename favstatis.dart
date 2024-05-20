import 'package:app/addingre2.dart';
import 'package:app/deleteingre.dart';
import 'package:app/food2.dart';
import 'package:app/main.dart';
import 'package:app/statis.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class favstatis extends StatefulWidget {
  const favstatis({super.key});

  @override
  State<favstatis> createState() => _favstatisState();
}

class _favstatisState extends State<favstatis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF156260),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/smallchef.png",
              width: 60,
              height: 30,
            ),
          ),
          title: Text(
            "Invisible Chef",
            style: GoogleFonts.raleway(
              fontSize: 25,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
          ),
          centerTitle: true, // Center the title horizontally
          iconTheme: IconThemeData(
              color: Colors.white), // Set the color of menu dashes
        ),
        endDrawer: Drawer(
          child: ListView(
            // padding: EdgeInsets.all(15),
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 1000,
                color: const Color(0xFF156260),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Image.asset(
                        "assets/images/smallchef.png",
                        width: 100, // Adjust the width as needed
                        height: 100, // Adjust the height as needed
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Invisible Chef",
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Center(
                      child: Container(
                        width: 250, // Adjust the width as needed
                        height: 400, // Adjust the height as needed
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 150, 179, 178),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildButton("الصفحة الرئيسية", context),
                            SizedBox(height: 5),
                            _buildButton("اضافة طبق", context),
                            SizedBox(height: 5),
                            _buildButton("حذف طبق", context),
                            SizedBox(height: 5),
                            _buildButton("اضافة مكونات", context),
                            SizedBox(height: 5),
                            _buildButton("حذف مكونات", context),
                            SizedBox(height: 5),
                            /*SizedBox(
                            width: 250,
                            child: _buildButton(
                                " تعديل المكونات\n اضافة. \n حذف. ", context),
                          ),*/
                            SizedBox(height: 25),
                            SizedBox(
                              width: 170,
                              child: _buildButton("تسجيل الخروج", context),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            ListView(
                // Wrap the Column with ListView
                children: const [
                  SizedBox(height: 50), // Add spacing above the text
                  Center(
                    child: Text(
                      ' الأطباق المفضلة', // Your text here
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF156260), // Text color
                      ),
                    ),
                  ),
                ]),
          ],
        ));
  }

  Widget _buildButton(String text, BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          if (text == "الصفحة الرئيسية") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const statisPage()));
          } else if (text == "تسجيل الخروج") {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const MyHomePage(),
              ),
            );
          }
          //foodPage
          else if (text == "اضافة طبق") {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const foodPage(),
              ),
            );
          } else if (text == "حذف طبق") {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const foodPage(),
              ),
            );
          } else if (text == "اضافة مكونات") {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const AddIngre(),
              ),
            );
          } else if (text == "حذف مكونات") {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const deleteingre(),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 150, 179, 178),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            text,
            style: TextStyle(
              color: Color(0xFF156260),
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
