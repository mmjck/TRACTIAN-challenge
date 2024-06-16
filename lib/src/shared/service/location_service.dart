import 'package:tree_view_application/src/features/details/domain/models/location.dart';
import 'package:tree_view_application/src/features/details/data/datasources/location_datasource_impl.dart';

class LocationService {
  LocationRepository repository;

  LocationService({required this.repository}) {
    repository = repository;
  }

  List<Location> getAll() {
    return repository.getAll();
  }
}
