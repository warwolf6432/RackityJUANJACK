import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/tabs_screen.dart';
import 'widgets/clothes_list_widget.dart';
import 'screens/form_screen.dart';
import 'package:get/get.dart';
import 'package:rackity/controller_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const Color textColor = Color(0xFF275844); // Add this line

  @override
  Widget build(BuildContext context) {
    final customTheme = ThemeData(
      fontFamily: 'JosefinSans',
      primaryColor: const Color(0xFF63BFAE),
      colorScheme: const ColorScheme.light().copyWith(
        primary: const Color(0xFF63BFAE),
        secondary: const Color(0xFFF2A444),
        // Define textColor with your desired value
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );

    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Rackity',
      theme: customTheme,
      home: LoginScreen(),
      routes: {
        '/tabs': (context) => TabsScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/form': (context) => FormScreen(),
      },
    );
  }
}
