import 'package:flutter/material.dart';
import 'package:latihan_flutter_9/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:latihan_flutter_9/notification_service.dart';
import 'package:latihan_flutter_9/widgets/auth_wrapper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';  

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await NotificationService.init();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "firebase auth simple",
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const AuthWrapper(),
    );
  }
}