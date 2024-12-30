import 'package:cats/application/services/cat_service.dart';
import 'package:cats/domain/entities/cat_breed.dart';
import 'package:cats/providers/cat_provider.dart';
import 'package:cats/views/landing/landing_view.dart';
import 'package:cats/views/landing/widgets/breed_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'landing_view_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CatServiceApi>()])
void main() {
  late MockCatServiceApi catServiceApi;

  setUp(() {
    catServiceApi = MockCatServiceApi();
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final List<CatBreed> mockBreeds = [
      CatBreed(id: '1', name: 'Breed1'),
      CatBreed(id: '2', name: 'Breed2'),
    ];

    when(catServiceApi.getBreeds(0)).thenAnswer((_) async => mockBreeds);

    final app = MaterialApp(
      home: ProviderScope(
          overrides: [catServiceProvider.overrideWith((ref) => catServiceApi)],
          child: const Scaffold(body: LandingView())),
    );

    await tester.pumpWidget(app);
    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(BreedTile), findsNWidgets(2));
  });
}
