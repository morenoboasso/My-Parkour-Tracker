import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myparkourtracker/styles/text_style.dart';
import '../../data/tutorials.dart';
import '../../styles/assets_manager.dart';
import '../../widgets/parkour_tutorial_card.dart';

class TutorialHome extends StatefulWidget {
  const TutorialHome({super.key});

  @override
  TutorialHomeState createState() => TutorialHomeState();
}

class TutorialHomeState extends State<TutorialHome> {
  int _selectedIndex = -1;
  final List<String> _filters = ['Basics', 'Vaults', 'Flips', 'Tricking'];
  late List<ParkourTutorial> filteredTutorials; // Dichiarare la lista filtrata
  TextEditingController searchController =
      TextEditingController(); // search bar controller

  void _selectFilter(int index) {
    //metodo filter buttons
    setState(() {
      if (_selectedIndex == index) {
        _selectedIndex = -1; // Deseleziona il filtro se già selezionato
        filteredTutorials = tutorials; // Mostra tutte le cards
      } else {
        _selectedIndex = index; // Seleziona il filtro
        final String selectedCategory = _filters[index];
        // Applicare il filtro in base alla categoria selezionata
        filteredTutorials = tutorials
            .where((tutorial) => tutorial.category == selectedCategory)
            .toList();
      }
    });
  }

  void _showFilterMenu(BuildContext context) async {
    String? selectedLevel = await showMenu<String>(
      context: context,
      surfaceTintColor: Colors.white,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width,
        kIsWeb ? 30 : 90,
        0,
        0,
      ),
      items: <PopupMenuItem<String>>[
        const PopupMenuItem<String>(
          value: 'Principiante',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star_border,
                size: 16,
                color: Colors.green,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Principiante',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Intermedio',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star_half,
                size: 16,
                color: Colors.orange,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Intermedio',
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Avanzato',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star,
                size: 16,
                color: Colors.red,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Avanzato',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
      elevation: 1.0,
    );

    if (selectedLevel != null) {
      // Azzerare i filtri prima di applicare il nuovo filtro
      _selectedIndex = -1;
      filteredTutorials = tutorials;
      _filterByLevel(selectedLevel);
    }
  }

  void _filterByLevel(String selectedLevel) {
    setState(() {
      if (selectedLevel == 'Principiante' ||
          selectedLevel == 'Intermedio' ||
          selectedLevel == 'Avanzato') {
        filteredTutorials = tutorials
            .where((tutorial) =>
                tutorial.livello.toLowerCase() == selectedLevel.toLowerCase())
            .toList();
      } else {
        // Se viene selezionata un'altra opzione, mostra tutti i tutorial
        filteredTutorials = tutorials;
      }
    });
  }

  void _searchTutorial(String searchText) {
    //controllo ricerca
    setState(() {
      // Azzerare i filtri prima di eseguire la ricerca
      _selectedIndex = -1;
      filteredTutorials = tutorials;

      filteredTutorials = tutorials.where((tutorial) {
        final String title = tutorial.title.toLowerCase();
        final String search = searchText.toLowerCase();

        // Controlla se il titolo o il livello corrispondono al testo di ricerca
        return title.contains(search);
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    filteredTutorials =
        tutorials; // Inizializzare la lista filtrata con tutte le cards
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsHD.background),
                fit: BoxFit.cover,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: kIsWeb ? 10 : 30),
                child: Center(
                  child: AutoSizeText(
                    'Tutorials',
                    style: TextHD.appbarTitle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: -1,
                        blurRadius: 7,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(Icons.search, color: Colors.black),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            onChanged: _searchTutorial,
                            cursorOpacityAnimates: true,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            style: TextHD.searchbar,
                            decoration: const InputDecoration(
                              hintText: 'Cerca skills da imparare..',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showFilterMenu(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.filter_alt_outlined,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _filters
                        .asMap()
                        .entries
                        .map(
                          (entry) => FilterButton(
                            text: entry.value,
                            isSelected: entry.key == _selectedIndex,
                            onPressed: () => _selectFilter(entry.key),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: filteredTutorials.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                                height: 40), // Aggiunta del padding top
                            Text(
                              '⚠  Nessuna skill trovata  ⚠',
                              style: TextHD.noResultTitle,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Prova a cercare usando parole chiave diverse o controlla di aver digitato correttamente.",
                              textAlign: TextAlign.center,
                              style: TextHD.noResult,
                            ),
                          ],
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemCount: filteredTutorials.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(height: 16),
                          itemBuilder: (BuildContext context, int index) {
                            final ParkourTutorial tutorial =
                                filteredTutorials[index];
                            return ParkourTutorialCard(
                              title: tutorial.title,
                              category: tutorial.category,
                              livello: tutorial.livello,
                              durata: tutorial.durata,
                              image: tutorial.image,
                              link: tutorial.link,
                              riscaldamento1: tutorial.riscaldamento1,
                              riscaldamento3: tutorial.riscaldamento3,
                              riscaldamento2: tutorial.riscaldamento2,
                              imgRis1: tutorial.imgRis1,
                              imgRis2: tutorial.imgRis2,
                              imgRis3: tutorial.imgRis3,
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black.withOpacity(0.3), width: 1.5),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: GNav(
            selectedIndex: 1,
            tabBorderRadius: 30,
            gap: 8,
            backgroundColor: Colors.white70,
            tabBackgroundColor: Colors.grey.withOpacity(0.2),
            padding: const EdgeInsets.all(6),
            tabs: const [
              GButton(
                icon: Icons.place,
                iconSize: 25,
                text: 'Spots',
                textSize: 14,
              ),
              GButton(
                icon: Icons.school,
                iconSize: 25,
                text: 'Tutorials',
                textSize: 14,
              ),
              GButton(
                icon: Icons.directions_walk,
                iconSize: 25,
                text: 'Riscaldamento',
                textSize: 14,
              ),
              GButton(
                icon: Icons.show_chart,
                iconSize: 25,
                text: 'Dashboard',
                textSize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const FilterButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          surfaceTintColor: Colors.white,
          elevation: 2,
          shadowColor: Colors.black,
          backgroundColor: isSelected ? Colors.green : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: AutoSizeText(
          text,
          maxLines: 1,
          style: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
