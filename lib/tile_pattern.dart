import 'package:cube/tile.dart';

enum TilePattern {
  tile1(1, TileDirection.right),
  tile2(2, TileDirection.top),
  tile3(3, TileDirection.bottom);

  final int value;
  final TileDirection direction;

  const TilePattern(this.value, this.direction);

  TileDirection nextMove(TileDirection currentDirection) {
    switch (currentDirection) {
      case TileDirection.left:
        return TileDirection.none;
      case TileDirection.right:
        if (this == TilePattern.tile1) {
          return TileDirection.right;
        }
        return TileDirection.none;
      case TileDirection.top:
        return TileDirection.none;
      case TileDirection.bottom:
        return TileDirection.none;
      default:
        return TileDirection.none;
    }
  }

  bool hasTurn() => value != 1;

  TileDirection nextDirection(TileDirection startDirection, Tile tile) {
    final level = tile.level;

    var tileDirection = TileDirection.none;

    if (startDirection == TileDirection.left) {
      if (tile.left == tile.right) {
        tileDirection = TileDirection.right;
      }

      if (tile.left == tile.top && level > 1) {
        tileDirection = TileDirection.top;
      }
      if (tile.left == tile.bottom && level < 3) {
        tileDirection = TileDirection.bottom;
      }
    }
    return tileDirection;
  }
}

enum TileDirection {
  left,
  right,
  top,
  bottom,
  none;

  TileDirection reverse() {
    if (this == left) {
      return right;
    }
    if (this == right) {
      return left;
    }
    if (this == top) {
      return bottom;
    }
    if (this == bottom) {
      return top;
    }
    return none;
  }
}
