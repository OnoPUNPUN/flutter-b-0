import 'package:material_ui/material_ui.dart';
import 'package:singleton/models/user_session.dart';
import 'package:singleton/pages/login_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userSession = UserSession.instance;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text("User ID: ${userSession.userId ?? 'N/A'}"),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await userSession.logout();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
