import 'package:flutter/material.dart';
import 'package:tree_view_application/src/core/utils/constants/keys_strings.dart';
import 'package:tree_view_application/src/features/home/presentation/pages/home_view_model.dart';
import 'package:tree_view_application/src/features/home/presentation/widgets/info_row.dart';
import 'package:tree_view_application/data/database/database.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.setContext(Navigator.of(context).context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          KeysString.tractian,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: _buildInfo(),
    );
  }

  Widget _buildInfo() {
    return Column(children: [
      ...[
        InfoRow(
          onPressed: () =>
              viewModel.navigateToDetailsScreen(database: Database.JAGUAR),
          text: KeysString.jaguar,
        ),
        InfoRow(
          onPressed: () =>
              viewModel.navigateToDetailsScreen(database: Database.APEX),
          text: KeysString.apex,
        ),
        InfoRow(
          onPressed: () =>
              viewModel.navigateToDetailsScreen(database: Database.TOBIAS),
          text: KeysString.tobias,
        )
      ].expand((element) => [
            element,
            const SizedBox(
              height: 10,
            )
          ])
    ]);
  }
}
