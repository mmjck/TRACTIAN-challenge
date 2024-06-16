import 'package:tree_view_application/src/features/details/presentation/pages/details_view_model.dart';
import 'package:tree_view_application/src/shared/domain/enums/enum.dart';
import 'package:tree_view_application/src/shared/models/tree_node.dart';

extension FilterViewModel on DetailsViewModel {
  bool byStatus(Node node) {
    if (statusClicked != null) {
      return statusClicked == node.status;
    }

    return node.status == statusClicked;
  }

  bool bySensor(Node node) {
    if (sensorTypeClicked != null) {
      return sensorTypeClicked == node.sensorType;
    }

    return node.sensorType == sensorTypeClicked;
  }

  List<Node> fromFilter({Status? status, SensorType? sensorType}) {
    final List<Node> data = [];

    for (var element in treeData) {
      final d =
          element.filterTree((n) => status != null ? byStatus(n) : bySensor(n));
      if (d != null) {
        data.add(d);
      }
    }

    return data;
  }
}
