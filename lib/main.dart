import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kelompok_4_task_learn/login.dart';
import 'package:kelompok_4_task_learn/menu_utama.dart';
import 'kelas/menu_daftar_kelas.dart';
import 'firebase_options.dart';
import 'splash_screen.dart';
import 'kelas/buat_kelas.dart';
import 'widget/GabungKelas.dart';
import 'widget/lihat_tugas_dosen.dart';
import 'widget/menu_daftar_tugas.dart';
import 'widget/tambah_infomasi_dosen.dart';
import 'widget/tampil_buat_kelas.dart';
import 'widget/lihat_tugas_dosen.dart';
import 'widget/lihat_tugas_mahasiswa.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
      
      home: TugasMahasiswa(namaGuru: '', namaKelas: '',),
      routes: {
        '/login': (context) => LoginPage(),
        '/buat_kelas': (context) => buat_kelas(),
        '/menu_daftar_kelas': (context) => menu_daftar_kelas(),
      },
    );
  }
}
