import 'package:cats/domain/entities/cat_breed.dart';
import 'package:cats/shared/atoms/custom_image.dart';
import 'package:cats/shared/atoms/cutom_text_label.dart';
import 'package:flutter/material.dart';

class BreedTile extends StatelessWidget {
  const BreedTile({super.key, required this.breed, required this.onPressed});

  final CatBreed breed;
  final Function(CatBreed catBreed) onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 2,
      /*color: Theme.of(context).cardColor,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        //boxShadow: const [
        //  BoxShadow(color: Colors.green, spreadRadius: 3),
        //],
      ),*/
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextLabel(label: 'Raza:', text: breed.name ?? ''),
              ),
              TextButton(
                  onPressed: () {
                    onPressed(breed);
                  },
                  child: const Text('Mas...')),
            ],
          ),
          SizedBox(
            height: 200,
            child: CustomImage(imageUrl: breed.image?.url),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                CustomTextLabel(label: 'Pais de origen:', text: breed.origin),
          ),
        ],
      ),
    );
  }
}
