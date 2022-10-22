import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/app_button.dart';
import 'package:k24/presentation/elements/custom_text.dart';

import '../../../../config/front_end_config.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
                height: MediaQuery.of(context).size.height*0.15,
                width: MediaQuery.of(context).size.width*0.4,
                child: Image.asset('assets/images/tranparentLogo.png')),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'Our Services',
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: FrontEndConfigs.kPrimaryColor,
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              align: TextAlign.center,
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
