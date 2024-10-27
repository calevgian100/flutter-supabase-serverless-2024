import 'package:flutter/material.dart';
import 'package:todo_do_app/auth/logic/supabase_auth_service.dart';
import 'package:todo_do_app/auth/screen/login_screen.dart';
import 'package:todo_do_app/to_do_list/logic/supabase_service.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    await SupabaseAuthService.logout();
    if (context.mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: FutureBuilder(
        future: SupabaseService.getCountries(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final countries = snapshot.data!;
          return ListView.builder(
            itemCount: countries.length,
            itemBuilder: ((context, index) {
              final country = countries[index];
              return ListTile(
                title: Text(country['name']),
              );
            }),
          );
        },
      ),
    );
  }
}
