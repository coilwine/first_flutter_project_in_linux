import '../../constants/duration_constants.dart';
import '../../constants/color_constants.dart';

abstract class BaseState {
  ColorConstants colorConstants = ColorConstants.instance;
  DurationConstants durationConstants = DurationConstants.instance;
}
