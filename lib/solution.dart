import 'package:cube/binary.dart';
import 'package:cube/tile.dart';
import 'package:cube/tile_pattern.dart';

String trace({required String tiles}) {
  final tilesNumbers = tiles.split('').map((e) => int.parse(e)).toList();

  final A = BinaryNode(Tile(pattern: tilesNumbers[0], letter: 'A'));
  final B = BinaryNode(Tile(pattern: tilesNumbers[1], letter: 'B'));
  final C = BinaryNode(
    Tile(pattern: tilesNumbers[2], letter: 'C'),
    isLeafTop: true,
  );
  final D = BinaryNode(
    Tile(pattern: tilesNumbers[3], letter: 'D'),
    isLeafBottom: true,
  );
  final E = BinaryNode(Tile(pattern: tilesNumbers[4], letter: 'E'));
  final F = BinaryNode(Tile(pattern: tilesNumbers[5], letter: 'F'));

  A.rightChild = B;
  A.topChild = C;
  A.bottomtChild = D;

  B.rightChild = E;
  B.topChild = C;
  B.bottomtChild = D;

  C.leftChild = A;
  C.rightChild = F;
  C.bottomtChild = B;

  D.leftChild = A;
  D.rightChild = F;
  D.topChild = B;

  E.rightChild = F;
  E.topChild = C;
  E.bottomtChild = D;

  F.topChild = C;
  F.bottomtChild = D;

  BinaryNode<Tile>? currentNode = A;
  var currentDirection = TileDirection.right;
  var path = currentNode.value.letter;
  while (currentNode != null && path.length < 6) {
    if (currentDirection == TileDirection.right) {
      if (currentNode.isLeafTop) {
        currentDirection = TileDirection.bottom;
      } else if (currentNode.isLeafBottom) {
        currentDirection = TileDirection.top;
      }
      currentNode = currentNode.rightChild;
    } else if (currentDirection == TileDirection.left) {
      if (currentNode.isLeafTop) {
        currentDirection = TileDirection.bottom;
      } else if (currentNode.isLeafBottom) {
        currentDirection = TileDirection.top;
      }
      currentNode = currentNode.leftChild;
    } else if (currentDirection == TileDirection.top) {
      currentNode = currentNode.topChild;
    } else if (currentDirection == TileDirection.bottom) {
      currentNode = currentNode.bottomtChild;
    }
    if (currentNode != null) {
      final endDirection = currentNode.value.endDirection(currentDirection);
      currentDirection = endDirection.reverse();
      path += currentNode.value.letter;
    }
  }

  return path;
}
