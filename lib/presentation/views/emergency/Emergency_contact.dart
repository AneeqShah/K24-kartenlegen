import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:k24/presentation/elements/custom_text.dart';

import '../../../config/front_end_config.dart';
import '../../elements/custom_app_bar.dart';

class EmergencyContact extends StatefulWidget {
  const EmergencyContact({Key? key}) : super(key: key);

  @override
  State<EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  List contacts = [
    {"name": "Telefonseelsorge", "number": "0800/1110111 , 0800/1110222"},
    {"name": "Kinder-Jugendliche", "number": "0800/1110333"},
    {"name": "Elterntelefon", "number": "0800/1110550"},
    {"name": "Notfalltelefon Suizid\nDeutschland", "number": "030/8730111"},
    {"name": "Sucht- und Drogenhotline", "number": "01805/313031"},
    {"name": "Aktionskreis Magersucht \nCinderella", "number": "089/5021212"},
    {"name": "ANAD Selbsthilfe \nAnorexie Bulimia", "number": "089/2199730"},
    {"name": "WEISSER RING", "number": "030/8337060"},
    {"name": "Vergiftungszentrale", "number": "030/19240"},
    {"name": "Telefonseelsorge", "number": "142"},
    {"name": "Sucht- und \nDrogenhotline", "number": " 0810/208877"},
    {"name": "Psychiatrische Notrufhilfe", "number": "31330"},
    {"name": "Vergiftungszentrale", "number": "01/4064343"},
    {"name": "Anonyme Alkoholiker", "number": "0222/788241"},
    {"name": "Anonyme Spieler", "number": "0222/551357"},
    {"name": "Blaues Kreuz in \nÖsterreich", "number": "0222/442746"},
    {"name": "Bundesverband der\n Elternkreise", "number": "0662/840734"},
    {"name": "elbsthilfegruppe \nfür Essstörung", "number": "0222/239898"},
    {"name": "Telefonseelsorge", "number": "143"},
    {"name": "Kinder + Jugendliche", "number": "0800554210"},
    {"name": "Vergiftungszentrale", "number": "145"},
    {"name": "Sucht- und Drogenhotline", "number": "052/7211743"},
    {"name": "Alkohol", "number": "052-7211744"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.bgColor,
      appBar: customAppBar('Notfallkontakt', showIcon: true),
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: contacts[i]["name"],
                              color: Colors.grey.shade700,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: contacts[i]["number"],
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () async {
                              await Clipboard.setData(
                                  ClipboardData(text: contacts[i]["number"]));
                              Fluttertoast.showToast(msg: "Number copied");
                            },
                            icon: Icon(Icons.copy))
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  )
                ],
              ),
            );
          }),
    );
  }
}
