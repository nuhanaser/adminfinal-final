import 'package:app/addingre2.dart';
import 'package:app/deleteingre.dart';
import 'package:app/food2.dart';
import 'package:app/main.dart';
import 'package:app/statis.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ingre extends StatefulWidget {
  const ingre({super.key});

  @override
  State<ingre> createState() => _ingreState();
}

class _ingreState extends State<ingre> {
  List<String> columns = [];
  List<int> selectedIngredients = [];
  String userch = '';

  @override
  void initState() {
    super.initState();
    //fetchData();
    //fetchColumns(); // Fetch column names when the widget initializes // nuha
  }

  /*fetchData() async {
     var response = await _crud.postRecuest(linkreslut, {
     "email" : sharedpref.getString("email"),
     "pass"  : sharedpref.getString("pass"),
    });
    
  }*/

//nuha
  /*Future<void> fetchColumns() async {
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2/GradProj/recp2.php'));
      if (response.statusCode == 200) {
        setState(() {
          columns = List<String>.from(json.decode(response.body));
          selectedIngredients = List<int>.filled(columns.length, 0); // Initialize selectedIngredients list
        });
      } else {
        throw Exception('Failed to load columns');
      }
    } catch (e) {
      print('Error fetching columns: $e');
    }
  }*/ //nuha
/* //nuha
Crud _crud =Crud();
  Ingredients() async {
      var response = await _crud.postRecuest(linkreslut, {
      "userch": userch,
     "email" : sharedpref.getString("email"),
     "pass"  : sharedpref.getString("pass"),
    });

     if(response['status']== "success"){

       /*  var response2 = await _crud.postRecuest(linkprintresilt, {
             "email" : sharedpref.getString("email"),
             "pass"  : sharedpref.getString("pass"),
           });
*/
          // if(response2['status']== "success"){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => choieses()));
             print("oookin");


     } 
     else
     print("ssllssss");
  }*/ //nuha

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
        iconTheme:
            IconThemeData(color: Colors.white), // Set the color of menu dashes
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/down.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  const Text(
                    '_______ اختر المكونات _______',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF156260), // Text color
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                  Wrap(
                    spacing: 15,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: List.generate(
                      columns.length,
                      (index) {
                        if ((index + 1) % 3 == 0 &&
                            index != columns.length - 1) {
                          // Add a line break after every three checkboxes except the last one
                          return Column(
                            children: [
                              CustomCheckbox(
                                label: columns[index],
                                value: selectedIngredients[index] == 1,
                                onChanged: (value) {
                                  setState(() {
                                    selectedIngredients[index] = value! ? 1 : 0;
                                  });
                                },
                              ),
                              SizedBox(height: 10), // Add spacing between rows
                            ],
                          );
                        } else {
                          return CustomCheckbox(
                            label: columns[index],
                            value: selectedIngredients[index] == 1,
                            onChanged: (value) {
                              setState(() {
                                selectedIngredients[index] = value! ? 1 : 0;
                              });
                            },
                          );
                        }
                      },
                    ),
                  ),
                  _buildTextField("اسم الطبق", context),
                  _buildTextField2("طريقة التحضير ", context),

                  SizedBox(
                      height: 20), // Add additional space after the checkboxes
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: MaterialButton(
                      onPressed: () async {
                        userch = '';
                        for (int i = 0; i < selectedIngredients.length; i++) {
                          userch += selectedIngredients[i].toString();
                        }
                        print(userch);
                        await ingre();
                      },

                      child: Text(
                        'اختيار',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      color: Color(0xFF156260), // Set the background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the value for roundness
                      ),
                      minWidth: 200,
                      height: 50,
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String text, BuildContext context) {
    return Container(
      width:
          MediaQuery.of(context).size.width / 3, // Adjust the width as needed
      margin: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(
            color: Color(0xFF156260), // Color of the label text
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Color(0xFF156260)), // Border color
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 45), // Adjust padding
        ),
        textAlign: TextAlign.center, // Align text to the center
        style: TextStyle(
          color: Colors.black, // Text color
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildTextField2(String text, BuildContext context) {
    return Container(
      width:
          MediaQuery.of(context).size.width / 2, // Adjust the width as needed
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        maxLines: 5, // Set this to control the number of lines

        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(
            color: Color(0xFF156260), // Color of the label text
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Color(0xFF156260)), // Border color
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 50), // Adjust padding
        ),
        textAlign: TextAlign.center, // Align text to the center
        style: TextStyle(
          color: Colors.black, // Text color
          fontSize: 16,
        ),
      ),
    );
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

class CustomCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  CustomCheckbox({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged!(!value);
      },
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: value ? Color(0xFF156260) : Colors.transparent,
          border: Border.all(color: Color(0xFF156260)),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(),
              SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: value ? Colors.white : Color(0xFF156260),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
