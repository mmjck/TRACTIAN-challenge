import 'package:tree_view_application/src/features/details/data/spec/assets_datasource.dart';
import 'package:tree_view_application/src/features/details/domain/models/assets.dart';

class AssetsRepository {
  final AssetsDataSource dataSource;

  AssetsRepository({required this.dataSource});

  List<Assets> getAssets() {
    return dataSource.getAll();
  }
}
