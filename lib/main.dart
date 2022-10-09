import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey =
      "pk_test_51Ln3A4HdUEl3CEFmYUOynFKnzw936xEgqXmxBOgkO5wy9xyovbECMBfEoe5FFwns0GPYjpo0xGmHVaBx8a7NRI2n00QeHlop5R";

  runApp(const MyApp());
}
