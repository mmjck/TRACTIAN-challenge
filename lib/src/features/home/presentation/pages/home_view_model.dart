import 'package:flutter/material.dart';
import 'package:tree_view_application/src/features/details/di/details_dependency_injection.dart';
import 'package:tree_view_application/src/features/details/presentation/pages/details_view.dart';
import 'package:tree_view_application/src/features/details/presentation/pages/details_view_model.dart';
import 'package:tree_view_application/src/shared/models/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  BuildContext? context;
  void setContext(BuildContext ctx) {
    context = ctx;
  }

  void navigateToDetailsScreen({required Map<String, dynamic> database}) {
    if (context != null) {
      Navigator.push(
        context!,
        MaterialPageRoute(
            builder: (c) => InfoDetailsView(
                viewModel: DetailsViewModel(
                    dependencies: DetailsDependencies(database: database)))),
      );
    }
  }

  @override
  void onInit() {}
}
