import 'package:tree_view_application/src/core/utils/constants/app_constants.dart';
import 'package:tree_view_application/src/shared/models/dependency.dart';
import 'package:tree_view_application/src/features/details/data/datasources/assets_datasource_impl.dart';
import 'package:tree_view_application/src/features/details/data/datasources/location_datasource_impl.dart';
import 'package:tree_view_application/src/shared/service/assets_service.dart';
import 'package:tree_view_application/src/shared/service/location_service.dart';

class DetailsDependencies {
  final Map<String, dynamic> database;
  Dependency? dependency;

  DetailsDependencies({required this.database}) {
    init();
  }

  void init() {
    dependency = Dependency(
        assetsService: AssetsService(
            repository: AssetsRepository(
          data: database[AppConstants.ASSETS],
        )),
        locationService: LocationService(
            repository:
                LocationRepository(data: database[AppConstants.LOCATIONS])));
  }
}
