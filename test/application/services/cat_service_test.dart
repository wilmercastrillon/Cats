import 'package:cats/application/services/cat_service.dart';
import 'package:cats/domain/entities/cat_breed.dart';
import 'package:cats/domain/interfaces/cat_finder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cat_service_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CatFinder>()])
void main() {
  group('CatServiceApi', () {
    late CatServiceApi catServiceApi;
    late MockCatFinder mockCatFinder;

    setUp(() {
      mockCatFinder = MockCatFinder();
      catServiceApi = CatServiceApi(catFinder: mockCatFinder);
    });

    test('getBreeds returns a list of CatBreed when ok', () async {
      final List<CatBreed> mockBreeds = [
        CatBreed(id: '1', name: 'Breed1'),
        CatBreed(id: '2', name: 'Breed2'),
      ];

      when(mockCatFinder.getBreeds(1, 10)).thenAnswer((_) async => mockBreeds);

      final breeds = await catServiceApi.getBreeds(1);

      expect(breeds, isA<List<CatBreed>>());
      expect(breeds.length, 2);
      expect(breeds[0].id, '1');
      expect(breeds[0].name, 'Breed1');
    });

    test('getBreeds throws an exception when the call fails', () async {
      when(mockCatFinder.getBreeds(1, 10)).thenThrow(Exception('Failed'));

      expect(() => catServiceApi.getBreeds(1), throwsException);
    });

    test('getSearchBreeds returns a list of CatBreed when ok', () async {
      final List<CatBreed> mockBreeds = [
        CatBreed(id: '1', name: 'Breed1'),
        CatBreed(id: '2', name: 'Breed2'),
      ];

      when(mockCatFinder.getSearchBreeds('query'))
          .thenAnswer((_) async => mockBreeds);

      final breeds = await catServiceApi.getSearchBreeds('query');

      expect(breeds, isA<List<CatBreed>>());
      expect(breeds.length, 2);
      expect(breeds[0].id, '1');
      expect(breeds[0].name, 'Breed1');
    });

    test('getSearchBreeds throws an exception when the call fails', () async {
      when(mockCatFinder.getSearchBreeds('query'))
          .thenThrow(Exception('Failed'));

      expect(() => catServiceApi.getSearchBreeds('query'), throwsException);
    });
  });
}
