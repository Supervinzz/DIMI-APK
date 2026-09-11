import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String url = 'https://anfrsjcuhamqcipzksbw.supabase.co';
  static const String publishableKey = 'sb_publishable_5pVgYi_H7REqNvuPpx5c3Q_JapHe2Tt';

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: url,
      publishableKey: publishableKey,
    );
  }
}