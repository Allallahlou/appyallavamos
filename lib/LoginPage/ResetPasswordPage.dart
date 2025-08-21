import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _emailCtrl = TextEditingController();

    // فقاعة علوية
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

    // فقاعة سفلية
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

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('إعادة تعيين كلمة المرور'),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // خلفية الصورة
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/v904-nunny-010-f.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // طبقة شفافة داكنة
          Container(color: Colors.black.withOpacity(0.45)),
          // فقاعة علوية
          Align(alignment: Alignment.topCenter, child: _topBubble()),
          // فقاعة سفلية
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
                    const SizedBox(height: 70),
                    TextFormField(
                      controller: _emailCtrl,
                      validator: (v) => v == null || !v.contains('@')
                          ? 'أدخل بريداً صالحاً'
                          : null,
                      decoration: const InputDecoration(
                        labelText: 'البريد الإلكتروني',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[800],
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
                            const SnackBar(
                              content: Text(
                                '📧 رابط إعادة التعيين أُرسل إلى بريدك',
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'إرسال رابط التعيين',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 90),
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
