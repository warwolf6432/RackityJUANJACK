import 'package:flutter/material.dart';
import 'package:rackity/widgets/clothes_list_widget.dart';
import '../colors.dart';
import '../lists/clothes_list.dart';

class ClosetTab extends StatefulWidget {
  const ClosetTab({Key? key}) : super(key: key);

  @override
  State<ClosetTab> createState() => _ClosetTabState();
}

class _ClosetTabState extends State<ClosetTab> {
  @override
  void initState() {
    createClothes();
    super.initState();
  }

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
                'Mis prendas',
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
                          ClothesListWidget(),
                        ],
                      ))),
            )
          ],
        ),
      ),
    );
  }

  void createClothes() async {
    clothes = await createGarmentsList();
    setState(() {
      clothes;
    });
  }
}
