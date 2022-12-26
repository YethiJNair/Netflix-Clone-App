import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home_page/home_page_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home_page/widgets/background_card.dart';
import 'package:netflix/presentation/home_page/widgets/number_title_card.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomePageBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, index, _) {
        return SafeArea(
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                BlocBuilder<HomePageBloc, HomePageState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    } else if (state.hasError) {
                      return const Center(
                        child: Text(
                          "Error while getting data",
                          style: TextStyle(color: kwhitecolor),
                        ),
                      );
                    }
                    //released past year
                    final _releasedPastYear = state.pastYearMovieList
                        .map((m) => '$imageAppendUrl${m.posterPath}')
                        .toList();
                    //trending
                    final _trendingNow = state.trendingMovieList
                        .map((m) => '$imageAppendUrl${m.posterPath}')
                        .toList();
                    // tense daramas
                    final _tenseDrama = state.tenseMovieList
                        .map((m) => '$imageAppendUrl${m.posterPath}')
                        .toList();
                    // tense daramas
                    final _southIndianMovie = state.southIndianMovieList
                        .map((m) => '$imageAppendUrl${m.posterPath}')
                        .toList();
                    _southIndianMovie.shuffle();
                    // top 10 tv shows
                    final _top10TvShow = state.trendingTvList.map((t) {
                      return '$imageAppendUrl${t.posterPath}';
                    }).toList();
                    _top10TvShow.shuffle();

                    return ListView(
                      children: [
                        BackgroundCard(),
                        MainTitleCard(
                          title: "Released in the past year",
                          posterList: _releasedPastYear.sublist(0, 10),
                        ),
                        MainTitleCard(
                          title: "Trending Now",
                          posterList: _trendingNow.sublist(0, 10),
                        ),
                        NumberTitleCard(postersList: _top10TvShow),
                        MainTitleCard(
                          title: "Tense Drama",
                          posterList: _tenseDrama.sublist(0, 10),
                        ),
                        MainTitleCard(
                          title: "South Indian Cinema",
                          posterList: _southIndianMovie.sublist(0, 10),
                        ),
                      ],
                    );
                  },
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: Duration(milliseconds: 5000),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.2),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Netflix_icon.svg/1200px-Netflix_icon.svg.png",
                                  width: 60,
                                  height: 60,
                                ),
                                const Spacer(),
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
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  "TV Shows",
                                  style: kHomeStyle,
                                ),
                                Text(
                                  "Movies",
                                  style: kHomeStyle,
                                ),
                                Text(
                                  "Categories",
                                  style: kHomeStyle,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : kheight
              ],
            ),
          ),
        );
      },
    ));
  }
}
