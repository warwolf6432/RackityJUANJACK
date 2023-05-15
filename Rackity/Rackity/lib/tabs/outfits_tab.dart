import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rackity/lists/outfits_list.dart';
import 'dart:math';
import '../lists/clothes_list.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../colors.dart';
import '../widgets/outfits_list_widget.dart';

class OutfitsTab extends StatefulWidget {
  @override
  State<OutfitsTab> createState() => _OutfitsTabState();
}

class _OutfitsTabState extends State<OutfitsTab> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('purchased').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
              padding: EdgeInsets.only(
                  left: 16.0, top: 32.0, right: 24.0, bottom: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                'Mis outfits',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ),
            Expanded(
              //Green Background
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF2F2F2),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                padding: EdgeInsets.only(
                                    left: 26.0,
                                    top: 20.0,
                                    right: 24.0,
                                    bottom: 10),
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    // Add your desired action here
                                  },
                                  child: Ink(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      onTap: () {
                                        // Add your desired action here
                                      },
                                      child: Material(
                                        child: Ink(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2F2F2),
                                          ),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Filtrar',
                                                  style: TextStyle(
                                                    fontSize: 24.0,
                                                    fontWeight: FontWeight.w300,
                                                    color: Color(0xFF217269),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 25.0,
                                                  child: Icon(
                                                    Icons.keyboard_arrow_right,
                                                    color: Color(0xFF217269),
                                                    size: 35,
                                                  ),
                                                ),
                                              ],
                                            ), // other widget
                                          ),
                                        ),
                                      ),
                                      //AQUI

                                      //AQUI
                                    ),
                                  ),
                                )),
                            Container(
                                margin: EdgeInsets.only(),
                                height: MediaQuery.of(context).size.height,
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: _usersStream,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Something went wrong');
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: Color(0xFFBCDED6),
                                        ),
                                      );
                                    }

                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics:AlwaysScrollableScrollPhysics(),
                                      itemCount: snapshot.data!.size,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                
                                              ],
                                            ),
                                            SizedBox(height:10,),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  // margin: EdgeInsets.only(
                                                  //     left: 10, right: 10, top: 0, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          // _selectedIndex3 != null &&
                                                          //     _selectedIndex3 == index
                                                          //     ?
                                                          // Color.fromARGB(255, 255, 255, 255)
                                                          Color(0xFFBCDED6),
                                                      // color: _selectedIndex==null?Color.fromARGB(255, 255, 255, 255):Colors.black,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color.fromRGBO(
                                                                  0,
                                                                  0,
                                                                  0,
                                                                  0.847)
                                                              .withOpacity(
                                                                  0.08),
                                                          spreadRadius: 1,
                                                          blurRadius: 3,
                                                          offset: Offset(0, 2),
                                                        ),
                                                      ]),
                                                  child: snapshot
                                                      .data!
                                                      .docs[index]["images1"] == null? Image(image: clothes[0].image) : Image.network(snapshot
                                                      .data!
                                                      .docs[index]["images1"]),
                                                ),
                                                Container(
                                                  child: snapshot
                                                      .data!
                                                      .docs[index]["images2"] == null? Image(image: clothes[0].image) : Image.network(snapshot
                                                      .data!
                                                      .docs[index]["images2"]),
                                                  // child: Image.asset(Images[index].toString()),
                                                  width: 100,
                                                  height: 100,
                                                  // margin: EdgeInsets.only(
                                                  //     left: 10, right: 10, top: 0, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          // _selectedIndex3 != null &&
                                                          //     _selectedIndex3 == index
                                                          //     ?
                                                          // Color.fromARGB(255, 255, 255, 255)
                                                          Color(0xFFBCDED6),
                                                      // color: _selectedIndex==null?Color.fromARGB(255, 255, 255, 255):Colors.black,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color.fromRGBO(
                                                                  0,
                                                                  0,
                                                                  0,
                                                                  0.847)
                                                              .withOpacity(
                                                                  0.08),
                                                          spreadRadius: 1,
                                                          blurRadius: 3,
                                                          offset: Offset(0, 2),
                                                        ),
                                                      ]),
                                                )
                                              ],
                                            ),
                                            Container(
                                              child: snapshot
                                                      .data!
                                                      .docs[index]["images1"] == null? Image(image: clothes[0].image) : Image.network(snapshot
                                                  .data!
                                                  .docs[index]["images3"]),

                                              // child: Image.asset(Images[index].toString()),
                                              width: 100,
                                              height: 100,
                                              margin: EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  top: 0,
                                                  bottom: 20),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color:
                                                      // _selectedIndex3 != null &&
                                                      //     _selectedIndex3 == index
                                                      //     ?
                                                      // Color.fromARGB(255, 255, 255, 255)
                                                      Color(0xFFBCDED6),
                                                  // color: _selectedIndex==null?Color.fromARGB(255, 255, 255, 255):Colors.black,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                              0, 0, 0, 0.847)
                                                          .withOpacity(0.08),
                                                      spreadRadius: 1,
                                                      blurRadius: 3,
                                                      offset: Offset(0, 2),
                                                    ),
                                                  ]),
                                            )
                                          ],
                                        );
                                      },
                                    );

                                    ;
                                  },
                                ))
                            // OutfitsListWidget(),
                          ],
                        ),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
