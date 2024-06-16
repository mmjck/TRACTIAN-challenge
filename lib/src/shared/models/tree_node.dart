import 'package:tree_view_application/src/shared/domain/enums/enum.dart';

class Node {
  String title;
  String id;
  TypeItem type;
  List<Node> children = [];
  bool isExpanded;
  Status? status;
  SensorType? sensorType;

  Node({
    required this.id,
    required this.title,
    required this.type,
    this.status,
    this.sensorType,
    this.isExpanded = false,
  });

  void addChild(Node node) {
    children.add(node);
  }

  void addAllChild(List<Node> node) {
    children.addAll(node);
  }

  bool get isLeaf {
    return children.isEmpty;
  }

  Node? filterTree(bool Function(Node) condition) {
    if (isLeaf) {
      return condition(this) ? this : null;
    }

    List<Node> filteredChildren = [];

    for (var child in children) {
      var filteredChild = child.filterTree(condition);

      if (filteredChild != null) {
        filteredChildren.add(filteredChild);
      }
    }

    if (filteredChildren.isNotEmpty) {
      Node n = Node(
        id: id,
        title: title,
        type: type,
        sensorType: sensorType,
        status: status,
        isExpanded: true,
      );

      n.addAllChild(filteredChildren);
      return n;
    }

    return null;
  }

  Node? filterByStr(String str) {
    Node filteredTree = this;

    Node? filter(Node node) {
      List<Node> filteredChildren = node.children
          .map((child) => filter(child))
          .where((child) => child != null)
          .toList()
          .cast<Node>();

      //
      final data = Node(
        title: node.title,
        id: node.id,
        type: node.type,
        isExpanded: node.isExpanded,
        sensorType: sensorType,
        status: status,
      );

      if (node.title.toLowerCase().contains(str.toLowerCase())) {
        data.addAllChild(filteredChildren);
        return data;
      }

      if (filteredChildren.isNotEmpty) {
        data.addAllChild(filteredChildren);
        return data;
      }

      return null;
    }

    filteredTree.children = children
        .map((child) => filter(child))
        .where((child) => child != null)
        .toList()
        .cast<Node>();

    if (filteredTree.title.contains(str) || filteredTree.children.isNotEmpty) {
      return filteredTree;
    }

    return null;
  }
}
