import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:app/deleteingre.dart';
import 'package:app/food2.dart';
import 'package:app/statis.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddIngre extends StatefulWidget {
  const AddIngre({Key? key}) : super(key: key);

  @override
  State<AddIngre> createState() => _AddIngreState();
}

class _AddIngreState extends State<AddIngre> {
  String? selectedDish;
  final List<String> dishes = ['معكرونة بالصلصة', 'معكرونة بالدجاج'];

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
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        endDrawer: Drawer(
          child: ListView(
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
                        width: 100,
                        height: 100,
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Invisible Chef",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Center(
                      child: Container(
                        width: 250,
                        height: 400,
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
        backgroundColor: Colors.white, // Set background color to white
        body: Stack(children: <Widget>[
          ListView(
            children: [
              SizedBox(height: 50),
              const Center(
                child: Text(
                  ' اضافة مكونات', // Your text here
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF156260), // Text color
                  ),
                ),
              ),
              SizedBox(height: 80),
              Center(
                child: Container(
                  width: 200,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade200,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedDish,
                      hint: const Text(
                        'اختر الطبق',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                      iconSize: 24,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      dropdownColor: Colors.grey.shade200,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDish = newValue;
                        });
                      },
                      items:
                          dishes.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]));
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
          else if (text == "اضافة طبق" || text == "حذف طبق") {
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
                builder: (BuildContext context) => AddIngre(),
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
