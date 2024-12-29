import 'package:cats/domain/entities/cat_breed.dart';
import 'package:cats/domain/interfaces/cat_finder.dart';
import 'package:cats/domain/interfaces/cat_service.dart';

class CatServiceApi extends CatService {
  final CatFinder _catFinder;
  final int pageSize = 10;

  CatServiceApi({required CatFinder catFinder}) : _catFinder = catFinder;

  @override
  Future<List<CatBreed>> getBreeds(int page) {
    return _catFinder.getBreeds(page, pageSize);
  }

  @override
  Future<List<CatBreed>> getSearchBreeds(String query) {
    return _catFinder.getSearchBreeds(query);
  }
}
