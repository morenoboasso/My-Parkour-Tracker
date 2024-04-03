import 'package:myparkourtracker/styles/assets_manager.dart';

class ParkourTutorial {
  final String title;
  final String category;
  final String livello;
  final int durata;
  final String image;
  ParkourTutorial({
    required this.title,
    required this.category,
    required this.livello,
    required this.durata,
    required this.image,
  });
}

final List<ParkourTutorial> tutorials = [
  ParkourTutorial(
      title: 'Front Flip',
      category: 'Flips',
      livello: 'Principiante',
      durata: 10,
      image: 'assets/front_flip.webp'),
  ParkourTutorial(
      title: 'Speed Vault',
      category: 'Vaults',
      livello: 'Principiante',
      durata: 5,
      image: 'assets/speed_vault.webp'),
  ParkourTutorial(
      title: 'Wall Run',
      category: 'Basics',
      livello: 'Principiante',
      durata: 7,
      image: 'assets/wall_run.webp'),
  ParkourTutorial(
      title: 'Precision Jump',
      category: 'Basics',
      livello: 'Principiante',
      durata: 5,
      image: 'assets/precision_jump.webp'),
  ParkourTutorial(
      title: 'Back Flip',
      category: 'Flips',
      livello: 'Intermedio',
      durata: 15,
      image: 'assets/backflip.webp'),
  ParkourTutorial(
      title: 'Cork',
      category: 'Tricking',
      livello: 'Avanzato',
      durata: 30,
      image: 'assets/cork.webp'),
];
