import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:myparkourtracker/styles/text_style.dart';

class ParkourTutorialCard extends StatelessWidget {
  final String id;
  final String title;
  final String category;
  final String livello;
  final int durata;

  const ParkourTutorialCard({
    super.key,
    required this.id,
    required this.title,
    required this.category,
    required this.livello,
    required this.durata,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        child: ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container per l'immagine del movimento
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 6,
                color: Colors.grey,
                // Inserisci l'immagine qui
              ),
              const SizedBox(width: 10),
              // Container per le informazioni
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Titolo
                      Center(
                        child: AutoSizeText(
                          title,
                          maxLines: 1,
                          maxFontSize: 15,
                          minFontSize: 12,
                          textAlign: TextAlign.center,
                          style: TextHD.cardTitle
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Livello
                      Center(
                        child: AutoSizeText(
                          livello,
                          maxLines: 1,
                            maxFontSize: 13,
                            minFontSize: 10,
                          style: TextHD.cardLivello
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Durata del tutorial
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.access_time,
                              size: 14,
                              color: Colors.black87,
                            ),
                            const SizedBox(width: 5),
                            AutoSizeText(
                              '$durata min',
                              maxLines: 1,
                              maxFontSize: 13,
                              minFontSize: 10,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          onTap: () {
            // Azioni da eseguire quando si tocca la card
          },
        ),
      ),
    );
  }
}