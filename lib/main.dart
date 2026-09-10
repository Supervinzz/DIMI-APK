import 'package:flutter/material.dart';

import 'config/supabase_config.dart';
import 'screens/auth/awal_page.dart'; // Import AwalPage di sini

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseConfig.initialize();

  runApp(const DimiApp());
}

class DimiApp extends StatelessWidget {
  const DimiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dimi',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE67E22),
        ),
      ),
      home: const AwalPage(), // Ubah target awal ke AwalPage
    );
  }
}