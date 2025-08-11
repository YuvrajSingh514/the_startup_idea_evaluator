import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:the_startup_idea_evaluator/features/leaderboard/bloc/leaderboard_bloc.dart';

class LeaderboardList extends StatelessWidget {
  const LeaderboardList({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LeaderboardBloc>(context).add(GetLeaderBoard());
    return BlocBuilder(
      bloc: BlocProvider.of<LeaderboardBloc>(context),
      builder: (context, state) {
        if (state is LeaderBoardLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is LeaderBoardLoadedState) {
          return ListView.separated(
            itemCount: state.startups.length,
            separatorBuilder: (context, index) => Divider(),

            itemBuilder: (context, index) {
              final idea = state.startups[index];
              return ListTile(
                title: Text(idea.title),
                subtitle: RatingBarIndicator(
                  rating: idea.rating.toDouble(),
                  itemBuilder:
                      (context, index) =>
                          const Icon(Icons.star, color: Colors.amber),
                  itemCount: 5,
                  itemSize: 20.0,
                ),
                trailing: Text('${idea.rating.toStringAsFixed(1)}/5'),
              );
            },
          );
        } else if (State is LeaderBoardErrorState) {
          return Center(child: Text('error'));
        }
        return Container();
      },
    );
  }
}
