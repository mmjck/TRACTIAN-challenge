import 'package:tree_view_application/src/features/details/domain/models/assets.dart';
import 'package:tree_view_application/src/features/details/data/datasources/assets_datasource_impl.dart';

class AssetsService {
  AssetsRepository repository;

  AssetsService({required this.repository}) {
    repository = repository;
  }

  List<Assets> getAll() {
    return repository.getAll();
  }
}
