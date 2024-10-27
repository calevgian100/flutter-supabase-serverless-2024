import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_do_app/auth/logic/supabase_auth_service.dart';
import 'package:todo_do_app/auth/screen/login_screen.dart';
import 'package:todo_do_app/to_do_list/screens/todo_do_screen.dart';

const supabaseUrl = String.fromEnvironment("SUPABASE_URL");
const supabaseKey = String.fromEnvironment("SUPABASE_KEY");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: SupabaseAuthService.currentUser == null
          ? LoginScreen()
          : const ToDoScreen(),
    );
  }
}
