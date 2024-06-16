import 'package:tree_view_application/src/features/details/domain/models/location.dart';

abstract class LocationDataSource {
  List<Location> getAll();
}
