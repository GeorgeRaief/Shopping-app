import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/sign_in_page.dart';
import 'package:shopping_app/sign_up_page.dart';

class SignInOrOutPage extends StatefulWidget {
  const SignInOrOutPage({super.key});

  @override
  State<SignInOrOutPage> createState() => _SignInOrOutPageState();
}

class _SignInOrOutPageState extends State<SignInOrOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          tr('Title'),
          style: TextStyle(
            fontFamily: 'Suwannaphum',
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            tooltip: "Change Language",
            onPressed: () {
              changeLang();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: 180,
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/jason-leung-yf9hEzG8EKI-unsplash.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 1),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://img.freepik.com/premium-vector/tech-computer-logo-template_23-2149204143.jpg?w=2000',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()),
                      );
                    },
                    child: Text(
                      tr("Sign In"),
                      style: TextStyle(fontFamily: 'Suwannaphum'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: Text(
                      tr("Sign Up"),
                      style: TextStyle(fontFamily: 'Suwannaphum'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
    changeLang() {
    if (context.locale == Locale('ar', 'EG')) {
      context.setLocale(Locale('en', 'US'));
    } else {
      context.setLocale(Locale('ar', 'EG'));
    }
  }
}
