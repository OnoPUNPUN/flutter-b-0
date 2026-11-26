import 'package:material_ui/material_ui.dart';
import 'package:singleton/models/user_session.dart';
import 'package:singleton/pages/profile_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailTEController = TextEditingController();
    final TextEditingController _passwordTEController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(controller: _emailTEController),
          const SizedBox(height: 10),
          TextField(controller: _passwordTEController),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _handleLogin(context),
            child: Text("Login"),
          ),
        ],
      ),
    );
  }

  Future<void> _handleLogin(BuildContext context) async {
    final String mockUserId = 'user_123';

    await UserSession.instance.login(mockUserId);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ProfileScreen()),
    );
  }
}
