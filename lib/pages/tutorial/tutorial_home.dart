import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myparkourtracker/styles/text_style.dart';
import '../../styles/assets_manager.dart';

class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});

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
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Tutorials',
                    style: TextHD.appbarTitle,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: -1,
                        blurRadius: 7,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.black),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
