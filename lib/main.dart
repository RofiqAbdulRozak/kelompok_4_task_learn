import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kelompok_4_task_learn/login.dart';
import 'firebase_options.dart';
import 'splash_screen.dart';
import 'kelas/buat_kelas.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Learn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splash(),
      routes: {
        '/login': (context) => LoginPage(), //  LoginPage
        '/buat_kelas': (context) => buat_kelas(), // buat_kelas
      },
    );
  }
}
