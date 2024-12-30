import 'dart:convert';

import 'package:cats/domain/entities/cat_breed.dart';
import 'package:cats/infrastructure/finders/cat_finder_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('CatFinderApi', () {
    test('get breeds returns a list of CatBreed when ok', () async {
      final mockResponse = [
        {
          "id": "beng",
          "name": "Bengal",
        },
        {
          "id": "sphx",
          "name": "Sphynx",
        },
      ];

      final responseBody = jsonEncode(mockResponse);
      Future<http.Response> requestHandler(http.Request request) async {
        return http.Response(responseBody, 200);
      }

      CatFinderApi catFinderApi =
          CatFinderApi(httpClient: MockClient(requestHandler));
      const int page = 1;
      const int limit = 10;

      final breeds = await catFinderApi.getBreeds(page, limit);

      expect(breeds, isA<List<CatBreed>>());
      expect(breeds.length, equals(2));
      expect(breeds[0].id, equals("beng"));
      expect(breeds[1].name, equals("Sphynx"));
    });

    test('get breeds error must throw exception when the call fails', () async {
      Future<http.Response> requestHandler(http.Request request) async {
        return http.Response('some error', 400);
      }

      CatFinderApi catFinderApi =
          CatFinderApi(httpClient: MockClient(requestHandler));
      expect(catFinderApi.getBreeds(1, 10), throwsException);
    });

    test('get search breeds returns a list of CatBreed when ok', () async {
      const String query = "bengal";
      final mockResponse = [
        {
          "id": "beng",
          "name": "Bengal",
        },
      ];

      final responseBody = jsonEncode(mockResponse);
      Future<http.Response> requestHandler(http.Request request) async {
        return http.Response(responseBody, 200);
      }

      CatFinderApi catFinderApi =
          CatFinderApi(httpClient: MockClient(requestHandler));
      final breeds = await catFinderApi.getSearchBreeds(query);

      expect(breeds, isA<List<CatBreed>>());
      expect(breeds.length, equals(1));
      expect(breeds[0].id, equals("beng"));
    });

    test('get search breeds must throw exception when the call fails',
        () async {
      Future<http.Response> requestHandler(http.Request request) async {
        return http.Response('some error', 400);
      }

      CatFinderApi catFinderApi =
          CatFinderApi(httpClient: MockClient(requestHandler));
      expect(catFinderApi.getSearchBreeds("test"), throwsException);
    });
  });
}
