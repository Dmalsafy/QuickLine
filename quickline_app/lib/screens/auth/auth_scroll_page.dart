import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const QuickLineApp());
}

class QuickLineApp extends StatefulWidget {
  const QuickLineApp({super.key});

  @override
  State<QuickLineApp> createState() => _QuickLineAppState();
}

class _QuickLineAppState extends State<QuickLineApp> {
  Locale _locale = const Locale('en');

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('fr'),
        Locale('es'),
        Locale('de'),
        Locale('zh'),
        Locale('ru'),
        Locale('hi'),
        Locale('tr'),
        Locale('ja'),
        Locale('ko'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      home: AuthScreen(
        onLocaleChange: setLocale,
      ),
    );
  }
}

class AuthScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  const AuthScreen({super.key, required this.onLocaleChange});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Background.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            top: 40,
            left: 10,
            child: DropdownButton<Locale>(
              iconEnabledColor: Colors.white,
              dropdownColor: Colors.black87,
              value: Localizations.localeOf(context),
              onChanged: (Locale? value) {
                if (value != null) widget.onLocaleChange(value);
              },
              items: const [
                Locale('en'),
                Locale('ar'),
                Locale('fr'),
                Locale('es'),
                Locale('de'),
                Locale('zh'),
                Locale('ru'),
                Locale('hi'),
                Locale('tr'),
                Locale('ja'),
                Locale('ko'),
              ].map((locale) {
                return DropdownMenuItem(
                  value: locale,
                  child: Text(
                    locale.languageCode.toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
            ),
          ),
          Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: showLogin ? buildLoginForm() : buildSignupForm(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoginForm() {
    return Container(
      key: const ValueKey('login'),
      width: 350,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Login", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email or Phone'),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot your password?",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 40),
            ),
            onPressed: () {},
            child: const Text("Login"),
          ),
          const SizedBox(height: 10),
          const Text("or"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/google.png', height: 35),
              const SizedBox(width: 20),
              Image.asset('assets/icons/apple.png', height: 35),
            ],
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              setState(() => showLogin = false);
            },
            child: const Text("Don’t have an account? Sign Up", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  Widget buildSignupForm() {
    return Container(
      key: const ValueKey('signup'),
      width: 350,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Sign Up", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextFormField(decoration: const InputDecoration(labelText: 'Full Name')),
            const SizedBox(height: 10),
            IntlPhoneField(
              decoration: const InputDecoration(labelText: 'Phone Number'),
              initialCountryCode: 'KW',
            ),
            const SizedBox(height: 10),
            TextFormField(decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Gender'),
              items: const [
                DropdownMenuItem(value: 'male', child: Text("Male")),
                DropdownMenuItem(value: 'female', child: Text("Female")),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40),
              ),
              onPressed: () {},
              child: const Text("Sign Up"),
            ),
            const SizedBox(height: 10),
            const Text("or"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/google.png', height: 35),
                const SizedBox(width: 20),
                Image.asset('assets/icons/apple.png', height: 35),
              ],
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                setState(() => showLogin = true);
              },
              child: const Text("Already have an account? Login", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}