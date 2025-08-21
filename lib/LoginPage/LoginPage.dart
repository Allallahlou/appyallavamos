import 'package:flutter/material.dart';
import 'RegisterPage.dart';
import 'ResetPasswordPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscurePass = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  // Wave علوي
  ClipPath _topBubble() => ClipPath(
    clipper: _TopWaveClipper(),
    child: Container(
      height: 140,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0x880066FF), Color(0x5500B4FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    ),
  );

  // Wave سفلي
  ClipPath _bottomBubble() => ClipPath(
    clipper: _BottomWaveClipper(),
    child: Container(
      height: 140,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0x5500B4FF), Color(0x880066FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('تسجيل الدخول'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // الخلفية
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/v904-nunny-010-f.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.45)),
          // Wave علوي
          Align(alignment: Alignment.topCenter, child: _topBubble()),
          // Wave سفلي
          Align(alignment: Alignment.bottomCenter, child: _bottomBubble()),
          // المحتوى
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 60), // مساحة للـ Wave العلوي
                    TextFormField(
                      controller: _emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) => v == null || !v.contains('@')
                          ? 'أدخل بريداً صالحاً'
                          : null,
                      decoration: const InputDecoration(
                        labelText: 'البريد الإلكتروني',
                        prefixIcon: Icon(Icons.email, color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passCtrl,
                      obscureText: _obscurePass,
                      validator: (v) =>
                          v == null || v.length < 6 ? '6 أحرف على الأقل' : null,
                      decoration: InputDecoration(
                        labelText: 'كلمة المرور',
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePass
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () =>
                              setState(() => _obscurePass = !_obscurePass),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          224,
                          13,
                          144,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '✅ مرحباً ${_emailCtrl.text.split('@').first}',
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text('تسجيل الدخول'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ResetPasswordPage(),
                        ),
                      ),
                      child: const Text(
                        'نسيت كلمة المرور؟',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const RegisterPage()),
                      ),
                      child: const Text(
                        'إنشاء حساب جديد',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    const SizedBox(height: 90), // مساحة للـ Wave السفلي
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Clipper العلوي
class _TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    final firstControl = Offset(size.width / 4, size.height);
    final firstEnd = Offset(size.width / 2, size.height - 40);
    path.quadraticBezierTo(
      firstControl.dx,
      firstControl.dy,
      firstEnd.dx,
      firstEnd.dy,
    );
    final secondControl = Offset(size.width * 3 / 4, size.height - 80);
    final secondEnd = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(
      secondControl.dx,
      secondControl.dy,
      secondEnd.dx,
      secondEnd.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// Clipper السفلي (معكوس)
class _BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 40);
    final firstControl = Offset(size.width / 4, 0);
    final firstEnd = Offset(size.width / 2, 40);
    path.quadraticBezierTo(
      firstControl.dx,
      firstControl.dy,
      firstEnd.dx,
      firstEnd.dy,
    );
    final secondControl = Offset(size.width * 3 / 4, 80);
    final secondEnd = Offset(size.width, 40);
    path.quadraticBezierTo(
      secondControl.dx,
      secondControl.dy,
      secondEnd.dx,
      secondEnd.dy,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
