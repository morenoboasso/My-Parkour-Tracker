import 'package:myparkourtracker/styles/assets_manager.dart';

class ParkourTutorial {
  final String title;
  final String category;
  final String livello;
  final int durata;
  final String image;
  final String link;
  final String riscaldamento1;
  final String riscaldamento2;
  final String riscaldamento3;
  final String imgRis1;
  final String imgRis2;
  final String imgRis3;



  ParkourTutorial({
    required this.title,
    required this.category,
    required this.livello,
    required this.durata,
    required this.image,
    required this.link,
    required this.riscaldamento1,
    required this.riscaldamento2,
    required this.riscaldamento3,
    required this.imgRis1,
    required this.imgRis2,
    required this.imgRis3,

  });
}

final List<ParkourTutorial> tutorials = [
  ParkourTutorial(
    title: 'Front Flip',
    category: 'Flips',
    livello: 'Principiante',
    durata: 10,
    image: 'assets/front_flip.webp',
    link: 'iENtDEeocLQ',
    riscaldamento1:'' ,
    riscaldamento2:'' ,
    riscaldamento3:'' ,
    imgRis1: IconsHD.backflip ,
    imgRis2: IconsHD.braccia,
    imgRis3: IconsHD.equilibrio,
  ),
  ParkourTutorial(
    title: 'Speed Vault',
    category: 'Vaults',
    livello: 'Principiante',
    durata: 5,
    image: 'assets/speed_vault.webp',
    link: 'https://www.youtube.com/watch?v=iENtDEeocLQ',
    riscaldamento1:'' ,
    riscaldamento2:'' ,
    riscaldamento3:'' ,
    imgRis1: IconsHD.backflip ,
    imgRis2: IconsHD.braccia,
    imgRis3: IconsHD.equilibrio,
  ),
  ParkourTutorial(
    title: 'Wall Run',
    category: 'Basics',
    livello: 'Principiante',
    durata: 7,
    image: 'assets/wall_run.webp',
    link: 'https://www.youtube.com/watch?v=video_id1',
    riscaldamento1:'' ,
    riscaldamento2:'' ,
    riscaldamento3:'' ,
    imgRis1: IconsHD.backflip ,
    imgRis2: IconsHD.braccia,
    imgRis3: IconsHD.equilibrio,
  ),
  ParkourTutorial(
    title: 'Precision Jump',
    category: 'Basics',
    livello: 'Principiante',
    durata: 5,
    image: 'assets/precision_jump.webp',
    link: 'https://www.youtube.com/watch?v=video_id1',
    riscaldamento1:'' ,
    riscaldamento2:'' ,
    riscaldamento3:'' ,
    imgRis1: IconsHD.backflip ,
    imgRis2: IconsHD.braccia,
    imgRis3: IconsHD.equilibrio,
  ),
  ParkourTutorial(
    title: 'Back Flip',
    category: 'Flips',
    livello: 'Principiante',
    durata: 15,
    image: 'assets/backflip.webp',
    link: 'ltho8_PzC2U',
    riscaldamento1:"Tumbling Progressions:\nEsegui progressioni acrobatiche, come il back roll o back handpsring per abituarti al movimento." ,
    riscaldamento2:"Stretching delle gambe:\nEsegui varie volte degli squat per riscaldare bene le gambe e prepararti al salto." ,
    riscaldamento3: "Backflip Assistito:\nChiedi ad un amico o ad un istruttore di darti un supporto mentre pratichi il backflip.",
    imgRis1: IconsHD.busto1 ,
    imgRis2: IconsHD.squat,
    imgRis3: IconsHD.backflip,
  ),
  ParkourTutorial(
    title: 'Cork',
    category: 'Tricking',
    livello: 'Avanzato',
    durata: 30,
    image: 'assets/cork.webp',
    link: 'https://www.youtube.com/watch?v=video_id1',
    riscaldamento1:'' ,
    riscaldamento2:'' ,
    riscaldamento3:'' ,
    imgRis1: IconsHD.backflip ,
    imgRis2: IconsHD.braccia,
    imgRis3: IconsHD.equilibrio,
  ),
];
