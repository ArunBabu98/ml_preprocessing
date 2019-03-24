import 'package:ml_preprocessing/src/categorical_encoder/encoder_type.dart';
import 'package:tuple/tuple.dart';

abstract class DataFrameParametersValidationErrorMessages {
  static const noErrorMsg = '';

  static String noHeaderExistsParameterProvidedMsg() =>
      '`headerExists` parameter is not provided';

  static String noHeaderProvidedMsg(Map<String, Iterable<Object>> categories) =>
      'no header provided to define, which columns belongs to given categories '
          '$categories';

  static String noHeaderProvidedForColumnEncodersMsg(
          Map<dynamic, CategoricalDataEncoderType> encoders) =>
      'no header provided to define, which columns belongs to given ecnoders '
          '$encoders';

  static String noLabelPositionMsg() => 'neither label index nor label name '
      'parameters are provided. It\'s necessary to specify, where label column '
      'resides';

  static String labelNameWithoutHeader() => 'label name is provided, but '
      'the dataset doesn\'t have a header';

  static String leftBoundGreaterThanRightMsg(Tuple2<int, int> range) =>
      'left boundary of the range $range is greater than the right one';

  static String intersectingRangesMsg(
          Tuple2<int, int> range1, Tuple2<int, int> range2) =>
      '$range1 and $range2 ranges are intersecting';

  static String labelIsNotInRangesMsg(
          int labelIdx, Iterable<Tuple2<int, int>> ranges) =>
      'label index $labelIdx is not in provided ranges $ranges';

  static String emptyCategoriesMsg() => 'provided categories are empty';

  static String emptyEncodersMsg() => 'provided encoders are empty';
}
