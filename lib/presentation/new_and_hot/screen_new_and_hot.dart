import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/new_and_hot/widgets/comming_soon.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                "New & Hot",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                Row(
                  children: [
                    const Icon(
                      Icons.cast,
                      color: kwhitecolor,
                      size: 30,
                    ),
                    kwidth,
                    Container(
                      height: 30,
                      width: 30,
                      color: Colors.blue,
                    ),
                    kwidth
                  ],
                )
              ],
              bottom: TabBar(
                  labelColor: kblackColor,
                  isScrollable: true,
                  unselectedLabelColor: kwhitecolor,
                  labelStyle: const TextStyle(fontSize: 16),
                  indicator: BoxDecoration(
                      color: kwhitecolor, borderRadius: kRadius30),
                  tabs: const [
                    Tab(
                      text: "🍿Comming soon",
                    ),
                    Tab(
                      text: "👀 Everyone's watching",
                    )
                  ]),
            )),
        body: const TabBarView(children: [
          CommingSoonList(
            key: Key("Comming_Soon"),
          ),
          EveryOneIsWatchingList(
            key: Key("Everyone_is_watching"),
          ),
        ]),
      ),
    );
  }
}

class CommingSoonList extends StatelessWidget {
  const CommingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInCommingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInCommingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text("Error while loading the coming soon list"),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text("Coming soon list is empty"),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              itemBuilder: (context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                String month = '';
                String date = '';
                try {
                  final _date = DateTime.tryParse(movie.releaseDate!);
                  final formatedDate = DateFormat.yMMMd('en_US').format(_date!);
                  month = formatedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toLowerCase();
                  date = movie.releaseDate!.split('-')[1];
                } catch (_) {
                  month = '';
                  date = '';
                }

                return CommingSoon(
                  id: movie.id.toString(),
                  month: month,
                  posterPath: "$imageAppendUrl${movie.posterPath}",
                  movieName: movie.originalTitle ?? "No title",
                  description: movie.overview ?? "No Overview",
                  day: date,
                );
              },
              itemCount: state.comingSoonList.length,
            );
          }
        },
      ),
    );
  }
}

class EveryOneIsWatchingList extends StatelessWidget {
  const EveryOneIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryOneWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryOneWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text("Error while loading the coming soon list"),
            );
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return const Center(
              child: Text("Coming soon list is empty"),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                final movie = state.everyOneIsWatchingList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }

                final tv = state.everyOneIsWatchingList[index];

                return EveronesWatchingWidget(
                  postePath: "$imageAppendUrl${tv.posterPath}",
                  movieName: tv.originalName ?? "No name provider",
                  description: tv.overview ?? "No description",
                );
              },
              itemCount: state.everyOneIsWatchingList.length,
            );
          }
        },
      ),
    );
  }
}
