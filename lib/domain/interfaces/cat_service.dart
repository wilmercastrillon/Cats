import 'package:cats/domain/entities/cat_breed.dart';

abstract class CatService {
  Future<List<CatBreed>> getBreeds(int page);
  Future<List<CatBreed>> getSearchBreeds(String query);
}
