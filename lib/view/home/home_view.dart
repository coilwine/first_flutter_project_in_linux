import 'package:first_flutter_project_in_manjaro/components/card/categories_card.dart';
import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

import 'home_model.dart';

part 'home_string_values.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeModel? model;
  final _HomeStringValues values = _HomeStringValues();

  @override
  void initState() {
    super.initState();
    model = HomeModel('title', 'description', 'data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          values.title,
        ),
      ),
      body: Column(
        children: [
          Text(
            values.headline1Title,
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: ColorConstants.instance.appleBlossom),
          ),
          const Expanded(
            child: CategoriesCard(name: '50+', body: 'Categories'),
          ),
          Expanded(
            flex: 2,
            child: ListView(
              children: [
                Container(
                  height: 250,
                  color: ColorConstants.instance.appleBlossom,
                ),
                Container(
                  height: 50,
                  color: ColorConstants.instance.tundora,
                ),
                Container(
                  height: 250,
                  color: ColorConstants.instance.appleBlossom,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
