import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/breed.dart';
import '../blocs/breeds_bloc.dart';
import '../widgets/breed_card.dart';
import '../widgets/skeleton_loader.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && !_isSearching) {
      context.read<BreedsBloc>().add(const BreedsEvent.fetched());
    }
  }

  bool get _isSearching => _searchController.text.isNotEmpty;

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cat Directory'),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: _toggleTheme,
              tooltip: _isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search breeds...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            context.read<BreedsBloc>().add(const BreedsEvent.searched(''));
                          },
                        )
                      : null,
                  filled: true,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                ),
                onChanged: (query) {
                  context.read<BreedsBloc>().add(BreedsEvent.searched(query));
                },
              ),
            ),
          ),
        ),
        body: BlocConsumer<BreedsBloc, BreedsState>(
          listenWhen: (previous, current) =>
              previous.status != current.status && current.status == BreedsStatus.failure,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(_mapFailureToMessage(state.failure)),
                action: SnackBarAction(
                  label: 'Retry',
                  onPressed: () {
                    context.read<BreedsBloc>().add(const BreedsEvent.fetched());
                  },
                ),
              ),
            );
          },
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<BreedsBloc>().add(const BreedsEvent.refreshed());
                await Future.delayed(const Duration(milliseconds: 500));
              },
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  if (state.status == BreedsStatus.initial)
                    const SliverFillRemaining(child: Center(child: CircularProgressIndicator()))
                  else if (state.status == BreedsStatus.loading && state.breeds.isEmpty)
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => const BreedCardSkeleton(),
                        childCount: 5,
                      ),
                    )
                  else if (state.breeds.isEmpty)
                    const SliverFillRemaining(child: Center(child: Text('No breeds found')))
                  else
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        if (index >= state.breeds.length && !_isSearching) {
                          return _buildBottomWidget(state);
                        }
                        final breed = state.breeds[index];
                        return BreedCard(breed: breed, onTap: () => _navigateToDetail(context, breed));
                      }, childCount: state.breeds.length + (_isSearching ? 0 : 1)),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomWidget(BreedsState state) {
    if (state.hasReachedMax) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: Text('No more breeds')),
      );
    }

    if (state.status == BreedsStatus.failure) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton.icon(
          onPressed: () {
            context.read<BreedsBloc>().add(const BreedsEvent.fetched());
          },
          icon: const Icon(Icons.refresh),
          label: const Text('Retry'),
        ),
      );
    }

    return const Padding(
      padding: EdgeInsets.all(16),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  String _mapFailureToMessage(Failure? failure) {
    return failure?.when(
          serverError: (msg) => 'Server error: $msg',
          networkError: () => 'No internet connection',
          unexpectedError: () => 'Unexpected error occurred',
        ) ??
        'Something went wrong';
  }

  void _navigateToDetail(BuildContext context, Breed breed) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(breed: breed)));
  }
}
