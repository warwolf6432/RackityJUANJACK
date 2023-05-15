import 'package:flutter/material.dart';
import '../colors.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _selectedGarmentType = 'Top';
  Color _selectedColor = Colors.black;

  List<String> _garmentTypes = [
    'Top',
    'Bottom',
    'Footwear',
  ];

  List<Color> _colors = [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Color(0xFFBCDED6),
        child: Container(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.847).withOpacity(0.08),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Select Garment Type',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _garmentTypes
                            .map(
                              (type) => Row(
                                children: [
                                  Radio(
                                    value: type,
                                    groupValue: _selectedGarmentType,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGarmentType = value!;
                                      });
                                    },
                                  ),
                                  Text(type),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Select Color',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _colors
                            .map(
                              (color) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedColor = color;
                                  });
                                },
                                child: CircleAvatar(
                                  backgroundColor: color,
                                  radius: 16,
                                  child: color == _selectedColor
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {
// Add the garment with the selected type and color
                        },
                        child: Text('Add'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
