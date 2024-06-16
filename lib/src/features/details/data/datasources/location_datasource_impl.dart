import 'package:tree_view_application/src/features/details/domain/models/location.dart';
import 'package:tree_view_application/src/features/details/data/spec/location_datasource.dart';

class LocationRepository implements LocationDataSource {
  List<dynamic> data;

  LocationRepository({required this.data}) {
    data = data;
  }

  @override
  List<Location> getAll() {
    return data.map((e) => Location.fromJson(e)).toList();
  }
}
