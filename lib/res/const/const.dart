import 'package:firebase_auth/firebase_auth.dart';
final number='0${FirebaseAuth.instance.currentUser!.phoneNumber!.substring(3,13)}';