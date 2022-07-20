import 'package:cube/tile_pattern.dart';

extension IntExtension on int {
  TilePattern get tile => this == 1
      ? TilePattern.tile1
      : this == 2
          ? TilePattern.tile2
          : TilePattern.tile3;
}
