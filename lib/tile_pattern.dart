
enum TilePattern {
  tile1(1, TileDirection.right),
  tile2(2, TileDirection.top),
  tile3(3, TileDirection.bottom);

  final int value;
  final TileDirection direction;

  const TilePattern(this.value, this.direction);
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
