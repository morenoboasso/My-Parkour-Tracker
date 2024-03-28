import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myparkourtracker/styles/text_style.dart';
import '../../data/tutorials.dart';
import '../../styles/assets_manager.dart';
import '../../widgets/parkour_tutorial_card.dart';

class TutorialHome extends StatefulWidget {
  const TutorialHome({super.key});

  @override
  _TutorialHomeState createState() => _TutorialHomeState();
}

class _TutorialHomeState extends State<TutorialHome> {
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

  void _searchTutorial(String searchText) {
    //controllo ricerca
    setState(() {
      filteredTutorials = tutorials.where((tutorial) {
        final String level = tutorial.livello.toLowerCase();
        final String title = tutorial.title.toLowerCase();
        final String search = searchText.toLowerCase();

        // Controlla se il titolo o il livello corrispondono al testo di ricerca
        return title.contains(search) || level.contains(search);
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
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: filteredTutorials.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (BuildContext context, int index) {
                      final ParkourTutorial tutorial = filteredTutorials[index];
                      return ParkourTutorialCard(
                        title: tutorial.title,
                        category: tutorial.category,
                        livello: tutorial.livello,
                        durata: tutorial.durata,
                        image: tutorial.image,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
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
