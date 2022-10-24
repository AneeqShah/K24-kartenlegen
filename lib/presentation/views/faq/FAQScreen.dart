import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/custom_text.dart';

import '../../../config/front_end_config.dart';
import '../../elements/custom_app_bar.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.bgColor,
      appBar: customAppBar('FAQ' , showIcon: true),
      body: SingleChildScrollView(child: _getUI(context)),
    );
  }

  Widget _getUI(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0 , vertical: 10),
          child: CustomText(
              text: "*Warum habe ich noch keine Antwort erhalten?\n\n"
                  "Wir sind selbstverständlich darum bemüht, Dir schnellstmöglich eine Antwort auf Deine Fragen zu geben. In Einzelfällen kann es aber leider zu längeren Wartezeiten kommen.Deine Frage wird aufjedenfalls innerhalb 24Std beantwortet.\n\n"
                  "*Gratis Frage\n\n"
                  "Das Start-Angebot ist ein einmaliges Willkommensangebot für die Nutzer, die sich zum ersten Mal bei Kartenlegen24 registrieren. Hiermit erhältst du 1Frage zum Probierpreis.\n\n"
                  "*Welche Spar-Angeboten bieten Sie an ?\n\n"
                  "Wir bieten dir folgende Sparpaketen an\n\n"
                  "3 Fragen um 9,99€\n\n"
                  "10 Fragen um 29,99€\n\n"
                  "*Welche arten von Fragen kann ich stellen?\n\n"
                  "Bis auf Fragen über Gesundheit und Schwangerschaft darfst du alles fragen was dir am Herzen liegt.\n\n"
                  "*Warum muss ich meine E-mail-Adresse bei der Registrierung bekannt geben?\n\n"
                  "Durch die Angabe Deiner E-Mail-Adresse in Deinem Profil wird sichergestellt, dass dein Account geschützt ist und ermöglicht dir eine geräteübergreifende Nutzung deines Accounts mit allen bisherigen Fragen und Antworten verlauf.\n\n"
                  "*Zahlung \nAlle Pakete im Shop Bereich, kannst du ganz einfach, unkompliziert und ohne Risiko mit deiner Kreditkarte bezahlen.\n\n"
                  "*Kundenservice kontaktieren \nkartenlegen24.online@gmail.com\n\n"),
        )
      ],
    );
  }
}
