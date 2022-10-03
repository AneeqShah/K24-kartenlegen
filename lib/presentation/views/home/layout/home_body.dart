import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/app_button.dart';
import 'package:k24/presentation/elements/custom_text.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            CustomText(
              text: 'Welcome to',
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            Image.asset('assets/images/logo2.png'),
            SizedBox(
              height: 30,
            ),
            CustomText(
              text: 'Our Services',
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text:
                  "Kartenlegen24 bietet dir eine professionelle spirituelle Beratung rund um die Uhr.\nDeine Zukunft ist bei uns kein Geheimnis,ob es um Liebe oder Beruf geht, wir geben dir klare Antworten. Präzise und treffsichere Aussagen, analysiert mit verschiedenen Kartendecks, wie Tarot-, Lenormand-, Zigeuner-, Engel-, Sibilla-, Ägyptische-, und Kipper-Karten. Wähle zwischen unseren Fragepaketen oder lass dir von unseren Experten, eine genaue und persönliche astrologische oder numerologische Berechnung erstellen.",
              fontWeight: FontWeight.w300,
              fontSize: 11,
              height: 1.8,
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }
}
