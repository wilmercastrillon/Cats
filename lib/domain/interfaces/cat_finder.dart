import 'package:cats/domain/entities/cat_breed.dart';

abstract class CatFinder {
  Future<List<CatBreed>> getBreeds(int page, int? limit);
  Future<List<CatBreed>> getSearchBreeds(String query);
}
