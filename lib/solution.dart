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

String trace2({required String tiles}) {
  final tilesNumbers = tiles.split('').map((e) => int.parse(e)).toList();
  var path = '';
  final koo = [
    [
      const MapEntry(0, ''),
      MapEntry(tilesNumbers[2], 'C'),
      const MapEntry(0, ''),
      const MapEntry(0, '')
    ],
    [
      MapEntry(tilesNumbers[0], 'A'),
      MapEntry(tilesNumbers[1], 'B'),
      MapEntry(tilesNumbers[4], 'E'),
      MapEntry(tilesNumbers[5], 'F')
    ],
    [
      const MapEntry(0, ''),
      MapEntry(tilesNumbers[3], 'D'),
      const MapEntry(0, ''),
      const MapEntry(0, '')
    ],
  ];

  int x = 0, y = 1;
  int xP = 0, yP = 1;
  MapEntry<int, String> tile = koo.elementAt(y).elementAt(x);
  path += tile.value;
  print('tile $tile (x:$x,y:$y) (xP:$xP,yP:$yP) ');

  //init x
  if (x - xP == 0 && y - yP == 0) {
    xP = x;
    x++;
  }

  while (x > 0 && x < 4 && y > 0 && y < 3 && !(x == xP && y == yP)) {
    tile = koo.elementAt(y).elementAt(x);
    path += tile.value;
    print('tile $tile (x:$x,y:$y) (xP:$xP,yP:$yP) ');

    int tempX = x;
    x = _moveX(tile.key, xP, x);
    xP = tempX;

    int tempY = y;
    y = _moveY(tile.key, yP, y);
    yP = tempY;
  }

  print('Path: $path');
  return path;
}

int _moveX(pattern, xP, x) {
  if (pattern == 1) {
    if (x > xP) {
      return x + 1;
    }
  }

  return x;
}

int _moveY(pattern, yP, y) {
  //????
  if (pattern == 2) {
    if (y > yP) {
      return y + 1;
    }
  }

  return y;
}
