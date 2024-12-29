import 'package:cats/application/services/cat_service.dart';
import 'package:cats/domain/interfaces/cat_finder.dart';
import 'package:cats/domain/interfaces/cat_service.dart';
import 'package:cats/infrastructure/finders/cat_finder_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catFinderProvider = Provider<CatFinder>((ref) {
  return CatFinderApi();
});

final catServiceProvider = Provider<CatService>((ref) {
  CatFinder finder = ref.read(catFinderProvider);
  return CatServiceApi(catFinder: finder);
});
