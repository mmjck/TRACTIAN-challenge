import 'package:tree_view_application/src/features/details/data/spec/location_datasource.dart';
import 'package:tree_view_application/src/features/details/domain/models/location.dart';

class LocationRepository {
  final LocationDataSource dataSource;

  LocationRepository({required this.dataSource});

  List<Location> getAssets() {
    return dataSource.getAll();
  }
}
