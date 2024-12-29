import 'dart:async';

import 'package:cats/domain/entities/cat_breed.dart';
import 'package:cats/providers/cat_provider.dart';
import 'package:cats/views/detail/detail_view.dart';
import 'package:cats/views/landing/widgets/breed_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingView extends ConsumerStatefulWidget {
  const LandingView({super.key});

  @override
  LandingViewState createState() => LandingViewState();
}

class LandingViewState extends ConsumerState<LandingView> {
  List<CatBreed> _items = [];
  final ScrollController _scrollController = ScrollController();
  int _nextPage = 0;
  final int _maxpage = 5;
  bool _isLoading = false;

  final TextEditingController _searchTextController = TextEditingController();
  late Timer _searchDelay;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_items.isNotEmpty &&
          _nextPage < _maxpage &&
          _searchTextController.text.isEmpty &&
          !_isLoading &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent) {
        _loadMoreItems();
      }
    });

    _searchDelay = Timer(const Duration(milliseconds: 500), () {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var catService = ref.read(catServiceProvider);
    catService.getBreeds(0).then((result) {
      setState(() {
        _nextPage++;
        _items.addAll(result);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreItems() {
    //print("### _loadMoreItems");
    setState(() {
      _isLoading = true;
    });

    var catService = ref.read(catServiceProvider);
    catService.getBreeds(_nextPage).then((result) async {
      await Future.delayed(const Duration(seconds: 5));
      setState(() {
        _nextPage++;
        _items.addAll(result);
        _isLoading = false;
        //print("### current size: ${_items.length}");
      });
    });
  }

  _onChangeSerchText(String text) {
    if (_searchDelay.isActive) _searchDelay.cancel();
    if (_searchTextController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
        _items = [];
      });

      _searchDelay = Timer(const Duration(milliseconds: 500), () {
        var catService = ref.read(catServiceProvider);

        catService
            .getSearchBreeds(_searchTextController.text)
            .then((result) async {
          await Future.delayed(const Duration(seconds: 5));
          setState(() {
            _items = result;
            _isLoading = false;
          });
        });
      });
    } else {
      setState(() {
        _isLoading = true;
        _items = [];
      });
      _nextPage = 0;
      _loadMoreItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _searchTextController,
              decoration: const InputDecoration(suffixIcon: Icon(Icons.search)),
              onChanged: _onChangeSerchText,
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _items.length + 1,
              itemBuilder: (context, index) {
                if (index == _items.length) {
                  return _isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                              child: CircularProgressIndicator(
                            color: Colors.blue,
                          )),
                        )
                      : const SizedBox();
                }
                return BreedTile(
                  breed: _items[index],
                  onPressed: (catBreed) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailCatView(
                          catBreed: catBreed,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
