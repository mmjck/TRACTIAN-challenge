import 'package:tree_view_application/src/features/details/domain/models/assets.dart';
import 'package:tree_view_application/src/features/details/data/spec/assets_datasource.dart';

class AssetsRepository implements AssetsDataSource {
  List<dynamic> data;

  AssetsRepository({required this.data}) {
    data = data;
  }

  @override
  List<Assets> getAll() {
    return data.map((e) => Assets.fromJson(e)).toList();
  }
}
