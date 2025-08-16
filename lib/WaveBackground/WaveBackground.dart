import 'package:flutter/material.dart';

class WaveBackground extends StatelessWidget {
  final Widget child;
  const WaveBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // طبقة الموجة 1
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: const Size(double.infinity, 220),
              painter: _WavePainter(
                color: Theme.of(context).primaryColor.withOpacity(.4),
              ),
            ),
          ),
          // طبقة الموجة 2
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: const Size(double.infinity, 200),
              painter: _WavePainter(
                color: Theme.of(context).primaryColor.withOpacity(.6),
                reversed: true,
              ),
            ),
          ),
          // المحتوى
          SafeArea(child: child),
        ],
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  final Color color;
  final bool reversed;
  _WavePainter({required this.color, this.reversed = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    if (reversed) {
      path.moveTo(0, size.height * .7);
      path.quadraticBezierTo(size.width * .25, size.height * .8,
          size.width * .5, size.height * .7);
      path.quadraticBezierTo(size.width * .75, size.height * .6,
          size.width, size.height * .7);
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
    } else {
      path.moveTo(0, size.height);
      path.quadraticBezierTo(size.width * .25, size.height * .7,
          size.width * .5, size.height * .75);
      path.quadraticBezierTo(size.width * .75, size.height * .8,
          size.width, size.height * .7);
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}