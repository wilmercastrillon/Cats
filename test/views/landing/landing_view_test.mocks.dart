// Mocks generated by Mockito 5.4.4 from annotations
// in cats/test/views/landing/landing_view_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:cats/application/services/cat_service.dart' as _i2;
import 'package:cats/domain/entities/cat_breed.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [CatServiceApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockCatServiceApi extends _i1.Mock implements _i2.CatServiceApi {
  @override
  int get pageSize => (super.noSuchMethod(
        Invocation.getter(#pageSize),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  _i3.Future<List<_i4.CatBreed>> getBreeds(int? page) => (super.noSuchMethod(
        Invocation.method(
          #getBreeds,
          [page],
        ),
        returnValue: _i3.Future<List<_i4.CatBreed>>.value(<_i4.CatBreed>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.CatBreed>>.value(<_i4.CatBreed>[]),
      ) as _i3.Future<List<_i4.CatBreed>>);

  @override
  _i3.Future<List<_i4.CatBreed>> getSearchBreeds(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSearchBreeds,
          [query],
        ),
        returnValue: _i3.Future<List<_i4.CatBreed>>.value(<_i4.CatBreed>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.CatBreed>>.value(<_i4.CatBreed>[]),
      ) as _i3.Future<List<_i4.CatBreed>>);
}
