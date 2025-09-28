import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool hiddenPassword = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();

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
            icon: Icon(Icons.language),
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
                controller: nameController,
                decoration: InputDecoration(labelText: tr('Name:')),
                validator: (value) {
                  if (value == "") {
                    return tr("Name validator1");
                  }
                  if (value![0] != value[0].toUpperCase()) {
                    return tr("Name validator2");
                  }
                  return null;
                },
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

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: confirmpassController,
                obscureText: hiddenPassword,
                validator: (value) {
                  if (value != passController.text) {
                    return tr("Pass validity2");
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: tr("Confirm password"),
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
                tr('Sign Up'),
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
          title: Text(tr("Account created successfully")),
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
