import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool hiddenPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          tr("Title"),
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
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                'https://img.freepik.com/premium-vector/tech-computer-logo-template_23-2149204143.jpg?w=2000',
                height: 120, // smaller image
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: tr("Email")),
                validator: (value) {
                  if (!value!.contains('@')) {
                    return tr("Email validity");
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passController,
                obscureText: hiddenPassword,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return tr("Pass validity");
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: tr("Password"),
                  suffixIcon: IconButton(
                    icon: Icon(
                      hiddenPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: togglePassword,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  myDialog();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),

              child: Text(
                tr('Sign In'),
                style: TextStyle(fontFamily: 'Suwannaphum'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void togglePassword() {
    setState(() {
      hiddenPassword = !hiddenPassword;
    });
  }

  Future<void> myDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tr("Account sign-in successfully")),
          content: Text(tr('Welcome to our amazing shopping app!')),
          actions: <Widget>[
            TextButton(
              child: Text(tr("To our app!")),
              onPressed: () {
                Navigator.of(context).push(createRoute());
              },
            ),
          ],
        );
      },
    );
  }

  Route createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
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
