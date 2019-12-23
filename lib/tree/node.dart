class Node<T>{
  static int typeOrgan = 10000;
  static int typeMember = 10001;

  bool expand;  //是否能扩展
  int depth;   //深度
  int type;
  int nodeId;
  int fatherId;  //父nodeId
  T object;

  Node(
      this.expand,
      this.depth,
      this.type,
      this.nodeId,
      this.fatherId,
      this.object,
      );

}