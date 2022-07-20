class BinaryNode<T> {
  BinaryNode(
    this.value, {
    this.isLeafTop = false,
    this.isLeafBottom = false,
  });

  T value;
  BinaryNode<T>? leftChild;
  BinaryNode<T>? rightChild;
  BinaryNode<T>? topChild;
  BinaryNode<T>? bottomtChild;

  final bool isLeafTop;
  final bool isLeafBottom;
}
