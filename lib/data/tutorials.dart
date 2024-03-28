class ParkourTutorial {
  final String id;
  final String title;
  final String category;
  final String livello;
  final int durata;

  ParkourTutorial({
    required this.id,
    required this.title,
    required this.category,
    required this.livello,
    required this.durata,
  });
}
final List<ParkourTutorial> tutorials = [
  ParkourTutorial(id: '1', title: 'Front Flip', category: 'Flips', livello: 'Principiante', durata: 30),
  ParkourTutorial(id: '2', title: 'Speed Vault', category: 'Vaults', livello: 'Intermedio', durata: 45),
  ParkourTutorial(id: '3', title: 'Wall Run', category: 'Basics', livello: 'Avanzato', durata: 60),
];