import 'package:cats/domain/entities/cat_breed.dart';
import 'package:cats/shared/atoms/custom_image.dart';
import 'package:cats/shared/atoms/custom_text.dart';
import 'package:cats/shared/atoms/cutom_text_label.dart';
import 'package:flutter/material.dart';

class DetailCatView extends StatelessWidget {
  const DetailCatView({super.key, required this.catBreed});

  final CatBreed catBreed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: catBreed.name ?? ''),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double halfHeight = constraints.maxHeight / 2;

          return Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: halfHeight,
                  child: CustomImage(imageUrl: catBreed.image?.url),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                                text: catBreed.description ?? '', fontSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextLabel(
                                label: 'Otros nombres:',
                                text: catBreed.altNames),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextLabel(
                                label: 'Pais:', text: catBreed.origin),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextLabel(
                                label: 'Temperamento:',
                                text: catBreed.temperament),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextLabel(
                                label: 'Tiempo de vida',
                                text: catBreed.lifeSpan),
                          ),
                          buildProgressBar(
                              'Adaptabilidad (${catBreed.adaptability!}/5)',
                              catBreed.adaptability!),
                          buildProgressBar(
                              'Nivel de afecto (${catBreed.affectionLevel!}/5)',
                              catBreed.affectionLevel!),
                          buildProgressBar(
                              'Amigable con niños (${catBreed.childFriendly!}/5)',
                              catBreed.childFriendly!),
                          buildProgressBar(
                              'Amigable con perros (${catBreed.dogFriendly!}/5)',
                              catBreed.dogFriendly!),
                          buildProgressBar(
                              'Energia (${catBreed.energyLevel!}/5)',
                              catBreed.energyLevel!),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildProgressBar(String label, int value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          LinearProgressIndicator(
            value: value / 5,
            backgroundColor: Colors.grey[200],
            color: Colors.blue,
            minHeight: 10,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
