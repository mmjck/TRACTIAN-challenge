import 'package:tree_view_application/src/shared/service/assets_service.dart';
import 'package:tree_view_application/src/shared/service/location_service.dart';

class Dependency {
  final AssetsService assetsService;
  final LocationService locationService;

  Dependency({
    required this.locationService,
    required this.assetsService,
  });
}
