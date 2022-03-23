import 'package:flutter/material.dart';

import '../../../domain/entities/games_entity.dart';

class CustomCardsGames extends StatefulWidget {
  final double width;
  final double height;
  final GamesEntity? games;

  const CustomCardsGames({
    Key? key,
    this.width = 302,
    this.height = 192,
    this.games,
  }) : super(key: key);

  @override
  State<CustomCardsGames> createState() => _CustomCardsGamesState();
}

class _CustomCardsGamesState extends State<CustomCardsGames> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: widget.width,
      height: widget.height,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight * 0.72,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.games!.thumbnail),
                  fit: BoxFit.fill,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
            ),
            Text(widget.games!.title)
          ],
        );
      }),
    );
  }
}
