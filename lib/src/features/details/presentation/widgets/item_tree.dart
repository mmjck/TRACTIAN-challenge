import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tree_view_application/src/core/utils/constants/constants.dart';
import 'package:tree_view_application/src/shared/domain/enums/enum.dart';

class ItemTree extends StatelessWidget {
  final String title;
  final TypeItem type;
  final Status? status;
  final SensorType? sensorType;

  const ItemTree({
    required this.type,
    required this.title,
    this.sensorType,
    this.status,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildImage(),
        const SizedBox(
          width: 10,
        ),
        _buildText(),
        if (sensorType != null && sensorType == SensorType.energy) ...[
          const SizedBox(
            width: 10,
          ),
          _buildIcon(icon: Icons.bolt_sharp, color: Colors.green)
        ],
        if (status != null && status == Status.alert) ...[
          const SizedBox(
            width: 10,
          ),
          _buildIcon(icon: Icons.circle, color: Colors.red, size: 10)
        ],
      ],
    );
  }

  Widget _buildIcon({required IconData icon, Color? color, double size = 20}) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }

  Widget _buildText() {
    return Flexible(
      child: Text(
        title,
        maxLines: 3,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.black,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildImage() {
    var image = StaticAssets.imgComponents;

    switch (type) {
      case TypeItem.location:
        image = StaticAssets.imgLocation;
      case TypeItem.component:
        image = StaticAssets.imgAssets;
      case TypeItem.parent:
        image = StaticAssets.imgComponents;
    }
    return Image.asset(
      image,
    );
  }
}
