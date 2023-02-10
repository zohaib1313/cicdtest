import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: CustomPaint(
        painter: MyCustomPainter(),
        child: Container(
          height: 60,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40), color: Colors.green),
        ),
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyCustomPainter extends CustomPainter {
  bool isBottomRight;

  MyCustomPainter({this.isBottomRight = true});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    final x = size.width;
    final y = size.height;

    Path path1 = Path();
    path1.moveTo(x - (x * 0.015), y - (y * 0.2));
    path1.lineTo((x) * 0.8, (y) + (y * 0.1));
    path1.lineTo(x - (x * 0.08), y);
    canvas.drawPath(path1, paint0);

    canvas.drawPath(path1, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RoundedContainerPainter extends CustomPainter {
  final double cornerRadius;
  final Color backgroundColor;

  RoundedContainerPainter(
      {required this.cornerRadius, required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = backgroundColor;
    paint.style = PaintingStyle.fill;

    var path = Path();
    var path1 = Path();

    var x = size.width;
    var y = size.height;
    // path.moveTo(0, y * 0.5);
    // path.quadraticBezierTo(0, 0, cornerRadius, 0);
    // path.lineTo(x - cornerRadius, 0);
    // path.quadraticBezierTo(x, 0, x, cornerRadius);
    // path.lineTo(x, y - cornerRadius);
    //
    // path.quadraticBezierTo(x, y, x - cornerRadius, y);
    // path.lineTo(cornerRadius, y);
    // path.quadraticBezierTo(0, y, 0, y - cornerRadius);
    // path.close();

    ///drawing arrows
    path1.moveTo(x - (x * 0.015), y - (y * 0.2));
    path1.lineTo((x - cornerRadius) * 0.8, (y + cornerRadius) + (y * 0.1));
    path1.lineTo(x - cornerRadius - (x * 0.08), y);
    canvas.drawPath(path1, paint);

    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
