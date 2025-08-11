import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:the_startup_idea_evaluator/features/ideas%20list/bloc/ideas_list_bloc.dart';

class StartupList extends StatelessWidget {
  const StartupList({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<IdeasListBloc>(context).add(LoadStartup());
    return BlocBuilder(
      bloc: BlocProvider.of<IdeasListBloc>(context),
      builder: (context, state) {
        if (state is IdeasListLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is IdeasListLoadedState) {
          if (state.ideas.isEmpty) {
            return Center(child: Text("No Startups yet"));
          }
          return ListView.builder(
            itemCount: state.ideas.length,
            itemBuilder: (context, index) {
              final idea = state.ideas[index];
              return ExpansionTile(
                title: Text(idea.title),
                subtitle: Text(idea.tagline),
                children: [
                   RatingBarIndicator(
                    rating: idea.rating.toDouble(),
                    itemBuilder:
                        (_, _) => const Icon(Icons.star, color: Colors.amber),
                    itemCount: 5,
                    itemSize: 20.0,
                  ),
                  Text(idea.description),
                ],
                
              );
            },
          );
        } else if (state is IdeasListErrorState) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}
