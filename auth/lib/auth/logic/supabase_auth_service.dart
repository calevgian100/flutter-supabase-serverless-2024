import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  static final _supabaseClient = Supabase.instance.client;

  static Future<User?> createAccount({
    required String name,
    required String password,
    required String email,
  }) async {
    try {
      await _supabaseClient.auth
          .signUp(email: email, password: password, data: {
        'display_name': name,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
    return null;
  }

  static Future<void> login(String email, String password) async {
    try {
      await _supabaseClient.auth
          .signInWithPassword(email: email, password: password);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<void> logout() async {
    await _supabaseClient.auth.signOut();
  }

  static User? get currentUser {
    return _supabaseClient.auth.currentUser;
  }
}
