import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tree_view_application/src/core/utils/constants/colors.dart';
import 'package:tree_view_application/src/core/utils/constants/keys_strings.dart';
import 'package:tree_view_application/src/features/details/presentation/pages/details_view_model.dart';
import 'package:tree_view_application/src/shared/domain/enums/enum.dart';
import 'package:tree_view_application/src/features/details/presentation/widgets/item_tree.dart';
import 'package:tree_view_application/src/features/details/presentation/widgets/search.dart';
import 'package:tree_view_application/src/features/details/presentation/widgets/short_button_filter.dart';
import 'package:tree_view_application/src/shared/models/tree_node.dart';

class InfoDetailsView extends StatefulWidget {
  final DetailsViewModel viewModel;
  const InfoDetailsView({super.key, required this.viewModel});

  @override
  State<InfoDetailsView> createState() => _InfoDetailsViewState();
}

class _InfoDetailsViewState extends State<InfoDetailsView> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(KeysString.assets),
        backgroundColor: ColorsUtils.darkBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
          padding: const EdgeInsets.symmetric(horizontal: 30),
        ),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      body: Builder(
        builder: (context) {
          return _buildBody();
        },
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildSearch(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              ChangeNotifierProvider<DetailsViewModel>.value(
                value: widget.viewModel,
                child: Column(
                  children: [
                    Consumer<DetailsViewModel>(
                      builder: (context, vM, _) => Row(
                        children: [
                          ShortButtonFilter(
                            icon: Icons.bolt,
                            text: KeysString.energy,
                            isSelected: vM.sensorTypeClicked != null,
                            onPressed: () {
                              vM.notify(() =>
                                  vM.setSensorType(value: SensorType.energy));
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ShortButtonFilter(
                              icon: Icons.info_outline_rounded,
                              text: KeysString.critical,
                              isSelected: vM.statusClicked != null,
                              onPressed: () => vM.notify(
                                  () => vM.setStatus(value: Status.alert)))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(child: _buildTree()),
      ],
    );
  }

  Widget _buildSearch() {
    return ChangeNotifierProvider<DetailsViewModel>.value(
      value: widget.viewModel,
      child: Consumer<DetailsViewModel>(
        builder: (context, vM, _) {
          return Search(
            onSubmitted: (e) => vM.notify(
              () => vM.fromSearch(),
            ),
            onSearchChanged: (e) => vM.notify(
              () => vM.query = e,
            ),
          );
        },
      ),
    );
  }

  Widget _buildTree() {
    return ChangeNotifierProvider<DetailsViewModel>(
      create: (BuildContext context) => widget.viewModel,
      child: Consumer<DetailsViewModel>(
        builder: (context, vM, _) {
          return ListView(children: _buildNodes(vM.getTree()));
        },
      ),
    );
  }

  List<Widget> _buildNodes(List<Node> nodes, {double padding = 10}) {
    List<Widget> nodeWidgets = [];
    for (var node in nodes) {
      nodeWidgets.add(
        Padding(
          padding: EdgeInsets.only(left: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                visualDensity: VisualDensity.compact,
                minVerticalPadding: 0,
                horizontalTitleGap: 0,
                leading: node.children.isNotEmpty
                    ? _buildListLeading(node)
                    : const SizedBox(
                        width: 10,
                      ),
                title: _buildListTitle(node),
              ),
              if (node.isExpanded)
                ..._buildNodes(node.children, padding: padding + 10),
            ],
          ),
        ),
      );
    }
    return nodeWidgets;
  }

  Widget _buildListTitle(Node node) {
    return ItemTree(
      type: node.type,
      title: node.title,
      status: node.status,
      sensorType: node.sensorType,
    );
  }

  Widget _buildListLeading(Node node) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      iconSize: 20,
      icon: Icon(
        node.isExpanded ? Icons.expand_less : Icons.expand_more,
      ),
      onPressed: () {
        // setState(() {
        //   node.isExpanded = !node.isExpanded;
        // });
      },
    );
  }
}
