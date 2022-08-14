import '../../core/extension/context_extension.dart';
import '../../components/card/categories_card.dart';
import '../../core/base/base_state.dart';
import 'home_model.dart';
import 'home_view_model.dart';
import 'package:flutter/material.dart';
part 'home_string_values.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with BaseState {
  HomeModel? model;
  final _HomeStringValues values = _HomeStringValues();
  final HomeViewModel viewModel = HomeViewModel();

  int value = 0;

  @override
  void initState() {
    super.initState();
    model =
        HomeModel(values.cardTitle, values.cardDescription, values.cardData);
    getSharedValues();
  }

  Future<void> getSharedValues() async {
    value = (await viewModel.getValueOnPreferences())!;
    setState(() {});
  }

  void _changeValue() {
    value = viewModel.randomValue();
    viewModel.setValueOnPreferences(value);
    setState(() {});
  }

  Color get _primary =>
      value % 2 == 0 ? colorConstants.appleBlossom : colorConstants.tundora;
  Color get _secondary =>
      value % 2 == 0 ? colorConstants.sanMarino : colorConstants.malachite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      appBar: AppBar(centerTitle: true, title: Text(values.title)),
      body: Column(children: [
        buildText(context),
        Expanded(child: buildCategoriesCard()),
        Expanded(
          flex: 2,
          child: buildListView(context),
        )
      ]),
    );
  }

  FloatingActionButton buildFloatingActionButton() =>
      FloatingActionButton(onPressed: _changeValue, child: Text('$value'));

  Text buildText(BuildContext context) {
    return Text(values.headline1Title,
        style: Theme.of(context)
            .textTheme
            .headline1
            ?.copyWith(color: colorConstants.appleBlossom));
  }

  CategoriesCard buildCategoriesCard() {
    return CategoriesCard(
        name: model?.title ?? values.err,
        body: model?.description ?? values.err);
  }

  ListView buildListView(BuildContext context) {
    return ListView(children: [
      AnimatedContainer(
          duration: durationConstants.durationLow,
          height: context.dynamicHeight(0.1),
          color: _primary),
      AnimatedContainer(
          duration: durationConstants.durationLow,
          height: context.dynamicHeight(0.01),
          color: _primary),
      AnimatedContainer(
          duration: durationConstants.durationLow,
          height: context.dynamicHeight(0.1),
          color: _secondary),
      AnimatedContainer(
          duration: durationConstants.durationLow,
          height: context.dynamicHeight(0.12),
          color: _primary)
    ]);
  }
}
