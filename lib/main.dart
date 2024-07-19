import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget content = const Text('Permission Not Checked');

  @override
  void initState() {
    super.initState();
    _setPermissions();
  }

  void _setPermissions() async {
    PermissionStatus permissionStatus = await Permission.notification.request();

    if (permissionStatus.isDenied) {
      Fluttertoast.showToast(msg: 'Permission Denied');
      setState(() {
        content = const Text('Permission Denied');
      });
    } else {
      Fluttertoast.showToast(msg: 'Permission Accepted');
      setState(() {
        content = const Text('Permission Accepted');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: content,
      ),
    );
  }
}
