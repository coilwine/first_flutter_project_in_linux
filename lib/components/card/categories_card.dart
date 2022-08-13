import 'package:flutter/material.dart';

import '../../constants/border_raduis_constants.dart';
import '../../constants/color_constants.dart';
import '../../constants/margin_constants.dart';
import '../../constants/padding_constants.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({Key? key, required this.name, required this.body})
      : super(key: key);

  final String name;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstants.instance.appleBlossom,
      margin: MarginConstants.instance.marginNormal,
      shape: RadiusConstants.instance.radiusCircularNormal,
      child: buildAlignPaddingTexts(context),
    );
  }

  Align buildAlignPaddingTexts(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: PaddingConstants.instance.paddingNormal,
        child: buildColumnTexts(context),
      ),
    );
  }

  Column buildColumnTexts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextName(context),
        buildTextBody(context),
      ],
    );
  }

  Text buildTextName(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context)
          .textTheme
          .headline3
          ?.copyWith(color: ColorConstants.instance.white),
    );
  }

  Text buildTextBody(BuildContext context) {
    return Text(
      body,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: ColorConstants.instance.white),
    );
  }
}
