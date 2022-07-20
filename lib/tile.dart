import 'package:cube/tile_pattern.dart';

class Tile {
  final int pattern;
  final String letter;

  Tile({required this.pattern, required this.letter});

  int get level => letter == 'C'
      ? 1
      : letter == 'D'
          ? 3
          : 2;

  int left = 1;

  int get right => pattern == 1 ? 1 : 2;

  int get top => pattern == 2 ? 1 : 2;

  int get bottom => pattern == 3 ? 1 : 2;

  TileDirection endDirection(TileDirection startDirection) {
    var tileDirection = TileDirection.none;

    switch (startDirection) {
      case TileDirection.left:
        return left == right
            ? TileDirection.right
            : left == top
                ? TileDirection.top
                : tileDirection = TileDirection.bottom;
      case TileDirection.right:
        return left == right
            ? TileDirection.left
            : right == top
                ? TileDirection.top
                : tileDirection = TileDirection.bottom;

      case TileDirection.top:
        return top == right
            ? TileDirection.right
            : top == left
                ? TileDirection.left
                : tileDirection = TileDirection.bottom;
      case TileDirection.bottom:
        return bottom == right
            ? TileDirection.right
            : bottom == left
                ? TileDirection.left
                : tileDirection = TileDirection.top;

      default:
    }

    return tileDirection;
  }
}
