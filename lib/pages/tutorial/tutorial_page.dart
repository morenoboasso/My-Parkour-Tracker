import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myparkourtracker/styles/text_style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../styles/assets_manager.dart';

class TutorialPage extends StatefulWidget {
  final String tutorialTitle;
  final String tutorialLink;

  const TutorialPage(
      {super.key, required this.tutorialTitle, required this.tutorialLink});

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  late YoutubePlayerController _controller;
  IconData? _selectedIcon;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.tutorialLink,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        captionLanguage: 'it',
        controlsVisibleAtStart: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return WillPopScope(
      onWillPop: () async {
        if (!isPortrait) {
          await _changeScreenOrientation(context, Orientation.portrait);
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
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
              children: [
                if (isPortrait)
                  Padding(
                    padding: const EdgeInsets.only(
                        top: kIsWeb ? 10 : 30, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                        AutoSizeText(
                          widget.tutorialTitle,
                          style: TextHD.appbarTitle,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.share,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (isPortrait) const SizedBox(height: 5),
                Flexible(
                  child: isPortrait
                      ? Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: YoutubePlayer(
                                    controller: _controller,
                                    showVideoProgressIndicator: true,
                                    progressColors: const ProgressBarColors(
                                      backgroundColor: Colors.white54,
                                      playedColor: Colors.green,
                                      bufferedColor: Colors.white,
                                      handleColor: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildIconWithText(
                                      Icons.menu_book,
                                      "Da imparare",
                                      _selectedIcon == Icons.menu_book
                                          ? Colors.blue
                                          : Colors.grey[600],
                                      () {
                                        _onIconSelected(Icons.menu_book);
                                      },
                                    ),
                                    _buildIconWithText(
                                      Icons.check,
                                      "Completato",
                                      _selectedIcon == Icons.check
                                          ? Colors.green
                                          : Colors.grey[600],
                                      () {
                                        _onIconSelected(Icons.check);
                                      },
                                    ),
                                    _buildIconWithText(
                                      Icons.emoji_events,
                                      "Perfezionato",
                                      _selectedIcon == Icons.emoji_events
                                          ? Colors.orange
                                          : Colors.grey[600],
                                      () {
                                        _onIconSelected(Icons.emoji_events);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 24),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),

                                  // Inserisci qui il contenuto del tuo terzo container

                                ),
                              ),
                            ),
                          ],
                        )
                      : YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                          progressColors: const ProgressBarColors(
                            backgroundColor: Colors.white54,
                            playedColor: Colors.green,
                            bufferedColor: Colors.white,
                            handleColor: Colors.green,
                          ),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _changeScreenOrientation(
      BuildContext context, Orientation orientation) async {
    if (orientation == Orientation.landscape) {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp]);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onIconSelected(IconData icon) {
    setState(() {
      if (_selectedIcon == icon) {
        _selectedIcon = null; // Deseleziona l'icona se è già selezionata
      } else {
        _selectedIcon = icon; // Seleziona l'icona cliccata
      }
    });
    //debug
    final iconTextMap = {
      Icons.menu_book: "Da imparare",
      Icons.check: "Completato",
      Icons.emoji_events: "Perfezionato",
    };
    String? iconName =
        _selectedIcon != null ? iconTextMap[_selectedIcon] : null;
    iconName ??= "Nessuno selezionato";
    debugPrint("Icona selezionata: $iconName");
  }

  Widget _buildIconWithText(
    IconData icon,
    String text,
    Color? iconColor,
    Function() onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: iconColor!,
                width: 2.5,
              ),
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(
              icon,
              size: 32,
              color: iconColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: TextHD.tutorialCompleted.copyWith(color: iconColor),
          ),
        ],
      ),
    );
  }
}
