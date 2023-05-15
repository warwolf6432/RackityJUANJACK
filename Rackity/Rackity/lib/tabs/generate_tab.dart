import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rackity/lists/clothes_list.dart';
import 'package:rackity/widgets/Comparing%20model.dart';
import '../colors.dart';

class GenerateTab extends StatefulWidget {
  @override
  _GenerateTabState createState() => _GenerateTabState();
}

class _GenerateTabState extends State<GenerateTab> {
  int _selectedIndex3 = 0;
  int _selectedIndex2 = 0;

  int _selectedIndex1 = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex3 = index);
  }
  List tophtllist = [];
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
FirebaseFirestore firestore=FirebaseFirestore.instance;
  void DataExplorepckg() {
    firestore.collection("Images").get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        dynamic data = element.data();
        print(data);
        setState(() {
          tophtllist.addAll({
            CompareModel(
              shirt:data["shirt"],
              paint:data["paint"],
              shoes:data["shoes"]
                )
          });
        });
      });
    });
  }
  String now="";
  Datetime(){
    now = DateFormat("dd-MM-yyyy hh:mm").format(DateTime.now());
      print(now);
  }
@override
  void initState() {
    setState(() {
      DataExplorepckg();
    });
    // TODO: implement initState
    super.initState();
    final a = clothes.map((e) => CompareModel(
      shirtI: e.image,
      paintI: e.image,
      shoesI: e.image,
    ));
    tophtllist.addAll(a);
  }
  List Images = [
    "assets/clothes/garment1.png",
    "assets/clothes/garment2.png",
    "assets/clothes/garment3.png",
    "assets/clothes/garment4.png",
    "assets/clothes/garment5.png",
    "assets/clothes/garment6.png",
    "assets/clothes/garment7.png",
    "assets/clothes/garment8.png",
    "assets/clothes/garment9.png",
    "assets/clothes/garment10.png",
    "assets/clothes/garment11.png",
    "assets/clothes/garment12.png",
    "assets/clothes/garment13.png",
    "assets/clothes/garment14.png",
    "assets/clothes/garment15.png",
    "assets/clothes/garment16.png",
  ];
  @override
  Widget build(BuildContext context) {
    var side = 128.0;
    var radius = 14.0;
    return Scaffold(
      backgroundColor: Color(0xFFBCDED6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35.0),
                    bottomRight: Radius.circular(35.0)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.847).withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(16.0, 68.0, 16.0, 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Code to be executed when the 'Auto' button is pressed
                    },
                    child: Text(
                      'Auto',
                      style: TextStyle(
                        color:
                            Color(0xFF27584C), // Set the text color to #27584C
                        fontSize: 18, // Set the font size to 20
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(105, 42)),
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFFAAD2C9),
                      ), // Use #AAD2C9 color
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            14), // Make the radius smaller
                      )),
                    ),
                  ),
                  SizedBox(width: 16), // Add some space between the buttons
                  ElevatedButton(
                    onPressed: () {
                      // Code to be executed when the 'Manual' button is pressed
                    },
                    child: Text(
                      'Manual',
                      style: TextStyle(
                        color:
                            Color(0xFF27584C), // Set the text color to #27584C
                        fontSize: 18, // Set the font size to 20
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(105, 42)),
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFFAAD2C9),
                      ), // Use #AAD2C9 color
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            14), // Make the radius smaller
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: tophtllist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex1 = index;
                      });
                    },
                    child: Container(
                      width: side,
                      height: side,
                      child: tophtllist[index].shirt == null? Image(image: tophtllist[index].shirtI) : Image.network(tophtllist[index].shirt.toString()),
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 30, bottom: 10),
                      decoration: BoxDecoration(
                          // image: DecorationImage(
                          //     image: NetworkImage(
                          //       tophtllist[index].image.toString(),
                          //    ), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(radius),
                          color: _selectedIndex1 != null &&
                              _selectedIndex1== index
                              ?
                          Color.fromARGB(255, 255, 255, 255):Color(0xFFBCDED6),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.847)
                                  .withOpacity(0.08),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ]),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount:tophtllist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex2 = index;
                      });
                    },
                    child: Container(
                      child: tophtllist[index].paint == null? Image(image: tophtllist[index].paintI) : Image.network(tophtllist[index].paint.toString()),
                      // child: Image.asset(Images[index].toString()),
                      width: side,
                      height: side,
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius),
                          color: _selectedIndex2 != null &&
                                  _selectedIndex2 == index
                              ?
                              Color.fromARGB(255, 255, 255, 255):Color(0xFFBCDED6),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.847)
                                  .withOpacity(0.08),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ]),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: tophtllist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _onSelected(index);
                      });
                    },
                    child: Container(
                      child: tophtllist[index].shoes == null? Image(image: tophtllist[index].shoesI) : Image.network(tophtllist[index].shoes.toString()),
                      // child: Image.asset(Images[index].toString()),
                      width: side,
                      height: side,
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius),
                          color: _selectedIndex3 != null &&
                              _selectedIndex3 == index
                              ?
                          Color.fromARGB(255, 255, 255, 255):Color(0xFFBCDED6),
                          // color: _selectedIndex==null?Color.fromARGB(255, 255, 255, 255):Colors.black,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.847)
                                  .withOpacity(0.08),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ]),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFE7A757),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                                 Datetime();

                        });
                      firestore.collection("purchased").add(
                       {
                         "images1":tophtllist[_selectedIndex1].shirt,
                         "images2":tophtllist[_selectedIndex2].paint,
                         "images3":tophtllist[_selectedIndex3].shoes,
                         
                       });
                      
                      print(now);
                      print("added");
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFE7A757),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.swap_horiz,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          Datetime();
                          tophtllist.shuffle();
                        });
                      },
                    ),
                  ),
                ),
              ],
            )
            // Add the rest of your content here...
          ],
        ),
      ),
    );
  }
}
