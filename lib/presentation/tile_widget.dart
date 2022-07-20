import 'package:cube/presentation/assets.dart';
import 'package:cube/presentation/dimens.dart';
import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({
    Key? key,
    this.pattern = 0,
    this.position = '',
  }) : super(key: key);

  final int pattern;
  final String position;

  @override
  Widget build(BuildContext context) {
    final patternImage = _getPatternImage();

    if (patternImage.isEmpty) {
      return const EmptyTile();
    }

    return Stack(
      children: [
        Container(
          height: tileSize,
          width: tileSize,
          alignment: Alignment.center,
          child: Text(
            position,
            style: TextStyle(
              fontSize: 100,
              color: Colors.blueGrey.shade300,
            ),
          ),
        ),
        Image.asset(
          _getPatternImage(),
          height: tileSize,
          width: tileSize,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  String _getPatternImage() {
    switch (pattern) {
      case 1:
        return tile1Image;
      case 2:
        return tile2Image;
      case 3:
        return tile3Image;
      default:
        return '';
    }
  }
}

class EmptyTile extends StatelessWidget {
  const EmptyTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: tileSize,
      width: tileSize,
    );
  }
}
