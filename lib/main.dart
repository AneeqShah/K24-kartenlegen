import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey =
      "pk_live_51Ln3A4HdUEl3CEFmGXfyzG1rMoeIR0qJbqg699g1B1EB77uSUTAzEav38Gj1G582a0ZJ1TzM0F5h19azo2LO9QXW002pLVeL3w";

  runApp(const MyApp());
}
