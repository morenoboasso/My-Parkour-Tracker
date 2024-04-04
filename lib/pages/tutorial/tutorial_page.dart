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
          // Se siamo in modalità landscape, cambia l'orientamento a portrait
          await _changeScreenOrientation(context, Orientation.portrait);
          // Impedisce di uscire dalla schermata
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
                if (isPortrait) // Mostra solo il titolo in modalità portrait
                  Padding(
                    padding: const EdgeInsets.only(top: kIsWeb ? 10 : 30,left: 10,right: 10),
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
                          onTap: () {
                          },
                          child: const Icon(
                            Icons.share,
                            color: Colors.black,
                          ),
                        ),

                      ],
                    ),
                  ),
                if (isPortrait) const SizedBox(height: 5), // verticale
                Flexible(
                  child: isPortrait
                      ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                      ), // verticale
                      const SizedBox(height: 24), // Spazio tra il video e il completato o no

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
                  ), // orizzontale
                ),




              ],
            ),
          ],
        ),
      ),
    );
  }

  //se sono full screen e clicco indietro , mi toglie il fullscreen , sennò se sono verticale esce dala schermata
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
}
