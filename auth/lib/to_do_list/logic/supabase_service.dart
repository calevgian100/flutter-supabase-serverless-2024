import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final _supabaseClient = Supabase.instance.client;

  static Future<List<Map<String, dynamic>>> getCountries() async {
    return _supabaseClient.from('countries').select();
  }
}
