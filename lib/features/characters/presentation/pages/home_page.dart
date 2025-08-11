import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/character.dart';
import '../bloc/cubit/character_list_cubit.dart';
import '../bloc/cubit/character_list_state.dart';
import '../bloc/cubit/network_cubit.dart';
import '../bloc/cubit/search_cubit.dart';
import '../widgets/character_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/offline_banner.dart';
import 'offline_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(_onScroll);

    context.read<CharacterListCubit>().loadCharacters(page: 1);
  }

  void _onScroll() {
    if (_isBottom) {
      final cubit = context.read<CharacterListCubit>();
      cubit.loadCharacters(page: cubit.state.currentPage + 1);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkCubit, bool>(
     builder: (context, isConnected) {
      if (!isConnected) {
        return const OfflinePage();
      }

        return Scaffold(
          backgroundColor: const Color(0xFF2F1775),
          appBar: AppBar(
            backgroundColor: const Color(0xFF2F1775),
            title: Image.asset('assets/images/morty.jpg', height: 200, width: 200),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: const Icon(Icons.favorite, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/favorites');
                },
              ),
            ],
          ),
          body: Column(
            children: [
              const OfflineBanner(),
              SearchBarWidget(
                onChanged: (query) => context.read<SearchCubit>().search(query),
              ),
              Expanded(
                child: BlocBuilder<SearchCubit, List<Character>>(
                  builder: (context, searchResults) {
                    if (searchResults.isNotEmpty) {
                      return ListView.builder(
                        itemCount: searchResults.length,
                        itemBuilder: (context, index) {
                          final character = searchResults[index];
                          return CharacterCard(character: character);
                        },
                      );
                    } else {
                      return BlocBuilder<
                        CharacterListCubit,
                        CharacterListState
                      >(
                        builder: (context, state) {
                          if (state.status == CharacterListStatus.loading &&
                              state.characters.isEmpty) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (state.status == CharacterListStatus.error) {
                            return Center(
                              child: Text(
                                state.errorMessage ?? "Error loading data",
                              ),
                            );
                          }

                          return ListView.builder(
                            controller: _scrollController,
                            itemCount: state.hasReachedMax
                                ? state.characters.length
                                : state.characters.length +
                                      1, 
                            itemBuilder: (context, index) {
                              if (index >= state.characters.length) {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                              final character = state.characters[index];
                              return CharacterCard(character: character);
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
