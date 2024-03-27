import 'package:flutter/material.dart';

class ParkourTutorialCard extends StatelessWidget {
  final String id;
  final String title;
  final String category;

  const ParkourTutorialCard({
    super.key,
    required this.id,
    required this.title,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
    child: ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container per l'immagine del movimento
              Container(
                width: MediaQuery.of(context).size.width / 2, // Metà della larghezza dello schermo
                height: MediaQuery.of(context).size.height / 6, // Altezza aggiuntiva
                color: Colors.grey, // Inserisci l'immagine qui
              ),
              const SizedBox(width: 10),
              // Container per le informazioni
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Titolo
                      Center(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 10), // Spazio verticale
                      // Livello del flip
                      Center(
                        child: Text(
                          'Livello: ', // Sostituisci con il livello
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      SizedBox(height: 10), // Spazio verticale
                      // Icona della durata
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 16,
                              color: Colors.black87,
                            ),
                            SizedBox(width: 5),
                            // Durata del tutorial
                            Text(
                              '', // Sostituisci con la durata
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
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
    );
  }
}
