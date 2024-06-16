import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tree_view_application/src/features/details/di/details_dependency_injection.dart';
import 'package:tree_view_application/src/features/details/domain/models/assets.dart';
import 'package:tree_view_application/src/features/details/domain/models/location.dart';
import 'package:tree_view_application/src/features/details/presentation/pages/filter.dart';
import 'package:tree_view_application/src/features/details/presentation/pages/tree.dart';
import 'package:tree_view_application/src/shared/domain/enums/enum.dart';
import 'package:tree_view_application/src/shared/models/base_view_model.dart';
import 'package:tree_view_application/src/shared/models/tree_node.dart';

class DetailsViewModel extends BaseViewModel {
  final myController = TextEditingController();

  @override
  void onInit() {
    _fetchLocations();
    _fetchAssets();

    mountTree();
    mountRest();

    notifyListeners();
  }

  final DetailsDependencies dependencies;
  DetailsViewModel({required this.dependencies});

  final List<Location> locations = [];
  final List<Assets> assets = [];

  List<Node> treeData = [];
  List<Node> filteredData = [];

  Status? statusClicked;
  SensorType? sensorTypeClicked;

  String? query;

  @override
  void dispose() {
    myController.dispose();

    super.dispose();
  }

  void _fetchLocations() async {
    locations.addAll(dependencies.dependency!.locationService.getAll());
  }

  void _fetchAssets() async {
    assets.addAll(dependencies.dependency!.assetsService.getAll());
  }

  void setStatus({required Status value}) {
    // update status value
    // and set sensorType to null
    if (statusClicked == value) {
      statusClicked = null;
      return;
    }

    if (sensorTypeClicked != null) {
      sensorTypeClicked = null;
    }

    statusClicked = value;
  }

  void notify<R, T>(R? Function() f) {
    f();
    notifyListeners();
  }

  void setSensorType({required SensorType value}) {
    // update sensorType value
    // and set status to null
    if (sensorTypeClicked == value) {
      sensorTypeClicked = null;
      return;
    }

    if (statusClicked != null) {
      statusClicked = null;
    }
    sensorTypeClicked = value;
  }

  List<Node> fromSearch() {
    final List<Node> data = [];
    filteredData.clear();

    for (var element in treeData) {
      final d = element.filterByStr("h12d");
      if (d != null) {
        data.add(d);
      }
    }

    return data;
  }

  List<Node> getTree() {
    if (statusClicked == null && sensorTypeClicked == null) {
      return treeData;
    }

    if (query != null || query != "") {
      return fromSearch();
    }

    return fromFilter();
  }

  void addTree(Node node, String parentId, Node data) {
    if (node.id == parentId) {
      node.isExpanded = true;
      node.addChild(data);
      return;
    } else {
      for (var element in node.children) {
        addTree(element, parentId, data);
      }
    }
  }
}
