import 'package:tree_view_application/src/features/details/presentation/pages/details_view_model.dart';
import 'package:tree_view_application/src/shared/domain/enums/enum.dart';
import 'package:tree_view_application/src/shared/models/tree_node.dart';

extension TreeViewModel on DetailsViewModel {
  void mountTree() {
    _mountLocationTree();
    _mountAssetsTree();
  }

  void _mountLocationTree() {
    _mountRoots();
    _mountSubLocation();
  }

  void mountRest() {
    for (var element in assets) {
      if (element.parentId == null && element.locationId == null) {
        final data = Node(
            id: element.id,
            title: element.name,
            type: TypeItem.component,
            sensorType: element.sensorType);

        treeData.add(data);
      }
    }
  }

  void _mountRoots() {
    for (var element in locations) {
      if (element.parentId == null) {
        final node = Node(
          type: TypeItem.location,
          id: element.id,
          title: element.name,
        );
        treeData.add(node);
      }
    }
  }

  void _mountSubLocation() {
    for (var element in locations) {
      if (element.parentId != null) {
        //
        for (var e in treeData) {
          if (e.id == element.parentId) {
            e.isExpanded = true;
            final node = Node(
              id: element.id,
              title: element.name,
              type: TypeItem.location,
            );
            e.addChild(node);
          }
        }
      }
    }
  }

  void _mountAssetsTree() {
    for (var element in assets) {
      if (element.locationId != null &&
          element.sensorType == null &&
          element.parentId == null) {
        for (var e in treeData) {
          final node = Node(
              sensorType: e.sensorType,
              status: element.status,
              type: TypeItem.parent,
              id: element.id,
              title: element.name);
          addTree(e, element.locationId!, node);
        }
      }
    }

    for (var element in assets) {
      if (element.locationId == null &&
          element.sensorType == null &&
          element.parentId != null) {
        for (var e in treeData) {
          final data = Node(
              sensorType: e.sensorType,
              status: e.status,
              type: TypeItem.parent,
              id: element.parentId!,
              title: element.name);
          addTree(e, element.parentId!, data);
        }
      }
    }

    mountComponent();
  }

  void mountComponent() {
    for (var element in assets) {
      if (element.sensorType != null &&
          (element.parentId != null || element.locationId != null)) {
        final data = Node(
          sensorType: element.sensorType,
          type: TypeItem.component,
          id: element.id,
          status: element.status,
          title: element.name,
        );

        for (var e in treeData) {
          if (element.parentId != null) {
            addTree(e, element.parentId!, data);
          }

          if (element.locationId != null) {
            addTree(e, element.locationId!, data);
          }
        }
      }
    }
  }
}
