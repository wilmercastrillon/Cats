import 'package:cats/domain/entities/cat_breed.dart';
import 'package:cats/shared/atoms/custom_image.dart';
import 'package:cats/shared/atoms/custom_text.dart';
import 'package:cats/shared/atoms/cutom_text_label.dart';
import 'package:cats/views/detail/widgets/mini_progress_bar.dart';
import 'package:flutter/material.dart';

class DetailCatView extends StatelessWidget {
  const DetailCatView({super.key, required this.catBreed});

  final CatBreed catBreed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: catBreed.name ?? '',
          color: Theme.of(context).primaryColorDark,
        ),
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
                const SizedBox(height: 8),
                Expanded(
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
                              text: catBreed.altNames!.isNotEmpty
                                  ? catBreed.altNames
                                  : 'N/A'),
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
                              label: 'Tiempo de vida', text: catBreed.lifeSpan),
                        ),
                        MiniProgressBar(
                            label:
                                'Adaptabilidad (${catBreed.adaptability!}/5)',
                            value: catBreed.adaptability!),
                        MiniProgressBar(
                            label:
                                'Nivel de cariño (${catBreed.affectionLevel!}/5)',
                            value: catBreed.affectionLevel!),
                        MiniProgressBar(
                            label:
                                'Amigable con niños (${catBreed.childFriendly!}/5)',
                            value: catBreed.childFriendly!),
                        MiniProgressBar(
                            label:
                                'Amigable con perros (${catBreed.dogFriendly!}/5)',
                            value: catBreed.dogFriendly!),
                        MiniProgressBar(
                            label: 'Energia (${catBreed.energyLevel!}/5)',
                            value: catBreed.energyLevel!),
                        MiniProgressBar(
                            label:
                                'Cuidado y limpieza (${catBreed.grooming!}/5)',
                            value: catBreed.grooming!),
                        MiniProgressBar(
                            label:
                                'Problemas de salud (${catBreed.healthIssues!}/5)',
                            value: catBreed.healthIssues!),
                        MiniProgressBar(
                            label: 'Inteligencia (${catBreed.intelligence!}/5)',
                            value: catBreed.intelligence!),
                        MiniProgressBar(
                            label:
                                'Caida de pelo (${catBreed.sheddingLevel!}/5)',
                            value: catBreed.sheddingLevel!),
                        MiniProgressBar(
                            label:
                                'Necesidades sociales (${catBreed.socialNeeds!}/5)',
                            value: catBreed.socialNeeds!),
                        MiniProgressBar(
                            label:
                                'Amigable con extraños (${catBreed.strangerFriendly!}/5)',
                            value: catBreed.strangerFriendly!),
                      ],
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
}
