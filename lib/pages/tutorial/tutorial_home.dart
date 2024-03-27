import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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


  void _selectFilter(int index) {
    setState(() {
      if (_selectedIndex == index) {
        _selectedIndex = -1; // Deseleziona il filtro se già selezionato
        filteredTutorials = tutorials; // Mostra tutte le cards
      } else {
        _selectedIndex = index; // Seleziona il filtro
        final String selectedCategory = _filters[index];
        // Applicare il filtro in base alla categoria selezionata
        filteredTutorials = tutorials.where((tutorial) => tutorial.category == selectedCategory).toList();
      }
    });
  }





  @override
  void initState() {
    super.initState();
    filteredTutorials = tutorials; // Inizializzare la lista filtrata con tutte le cards
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
          Positioned(
            top: kIsWeb ? 10 : 30,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Tutorials',
                    style: TextHD.appbarTitle,
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
                            padding: EdgeInsets.only(left: 10), // Aggiunto padding qui
                            child: Icon(Icons.search, color: Colors.black),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
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
                Center(
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
              ],
            ),
          ),
          Positioned(
            top: 195,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: filteredTutorials.length, // Utilizzare la lista filtrata
                itemBuilder: (BuildContext context, int index) {
                  final ParkourTutorial tutorial = filteredTutorials[index]; // Utilizzare l'indice corretto
                  return ParkourTutorialCard(
                    id: tutorial.id,
                    title: tutorial.title,
                    category: tutorial.category,
                  );
                },
              ),

            ),
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
            borderRadius: BorderRadius.circular(10), // Imposta il raggio dei bordi qui
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
