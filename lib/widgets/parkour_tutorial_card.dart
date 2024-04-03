import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:myparkourtracker/styles/text_style.dart';

class ParkourTutorialCard extends StatelessWidget {
  final String title;
  final String category;
  final String livello;
  final int durata;
  final String image;

  const ParkourTutorialCard({
    super.key,
    required this.title,
    required this.category,
    required this.livello,
    required this.durata,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor;
    IconData levelIcon;
    switch (livello) {
      case 'Principiante':
        textColor = Colors.green;
        levelIcon = Icons.star_border; // Icona per livello Principiante
        break;
      case 'Intermedio':
        textColor = Colors.orange;
        levelIcon = Icons.star_half; // Icona per livello Intermedio
        break;
      default:
        textColor = Colors.red;
        levelIcon = Icons.star; // Icona per livello Avanzato
    }

    return Card(
      elevation: 3,
      color: Colors.white,
      surfaceTintColor: Colors.white70,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Stack(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(left: 8, right: 8),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container per l'immagine del movimento
               ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      image,
                      width: MediaQuery.of(context).size.width / 2.25,
                      height: MediaQuery.of(context).size.height / 7.6,
                      fit: BoxFit.fill,
                    ),
                  ),
                const SizedBox(width: 5),
                // Container per le informazioni
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Titolo e durata sulla stessa riga
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                title,
                                maxLines: 1,
                                maxFontSize: 14,
                                minFontSize: 10,
                                textAlign: TextAlign.left,
                                style: TextHD.cardTitle,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  size: 10,
                                  color: Colors.black87,
                                ),
                                const SizedBox(width: 1),
                                AutoSizeText('$durata Min',
                                    maxLines: 1,
                                    maxFontSize: 14,
                                    minFontSize: 10,
                                    textAlign: TextAlign.right,
                                    style: TextHD.cardDurata),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Livello con icona
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icona del livello
                              Icon(
                                levelIcon,
                                color: textColor,
                                size: 16,
                              ),
                              const SizedBox(width: 5),
                              // Testo del livello
                              AutoSizeText(
                                livello,
                                maxLines: 1,
                                maxFontSize: 14,
                                minFontSize: 12,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
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
          const SizedBox(width: 10),
          const Positioned(
            bottom: 10,
            right: 5,
            child: Row(
              children: [
                Text(
                  'Inizia tutorial',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
