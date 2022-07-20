import 'package:cube/presentation/tile_widget.dart';
import 'package:flutter/material.dart';

class CubeWidget extends StatelessWidget {
  const CubeWidget({
    Key? key,
    required this.patternText,
    required this.pathText,
    this.isGenerated = false,
  }) : super(key: key);

  final String patternText;
  final String pathText;
  final bool isGenerated;

  @override
  Widget build(BuildContext context) {
    final patterns = patternText.split('').map((e) => int.parse(e)).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                patternText,
                style: TextStyle(
                  fontSize: 50,
                  color: isGenerated
                      ? Colors.blue.shade700
                      : Colors.blueGrey.shade700,
                ),
              ),
              Text(
                pathText,
                style: TextStyle(
                  fontSize: 35,
                  color: isGenerated
                      ? Colors.blue.shade800
                      : Colors.blueGrey.shade800,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TileWidget(),
                TileWidget(position: 'C', pattern: patterns[2]),
                const TileWidget(),
                const TileWidget(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TileWidget(position: 'A', pattern: patterns[0]),
                TileWidget(position: 'B', pattern: patterns[1]),
                TileWidget(position: 'E', pattern: patterns[4]),
                TileWidget(position: 'F', pattern: patterns[5]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TileWidget(),
                TileWidget(position: 'D', pattern: patterns[3]),
                const TileWidget(),
                const TileWidget(),
              ],
            )
          ],
        ),
      ],
    );
  }
}
