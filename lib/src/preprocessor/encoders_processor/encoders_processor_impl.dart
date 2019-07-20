import 'package:ml_linalg/dtype.dart';
import 'package:ml_preprocessing/src/categorical_encoder/encoder_factory.dart';
import 'package:ml_preprocessing/src/categorical_encoder/encoder_type.dart';
import 'package:ml_preprocessing/src/preprocessor/encoders_processor/encoders_processor.dart';

class EncodersProcessorImpl implements EncodersProcessor {
  EncodersProcessorImpl(List<String> _columnNames, this._encoderFactory,
      [DType dtype = DType.float32])
      : _colNameToIdx = _columnNames.asMap().map(
          (idx, name) => MapEntry(name, idx)),
        _dtype = dtype;

  final DType _dtype;
  final Map<String, int> _colNameToIdx;
  final CategoricalDataEncoderFactory _encoderFactory;

  @override
  Map<int, CategoricalDataEncoderType> createEncoders(
      Map<int, CategoricalDataEncoderType> indexesToEncoderTypes,
      Map<CategoricalDataEncoderType, Iterable<String>> encoderTypesToNames,
      Map<String, CategoricalDataEncoderType> namesToEncoderTypes,
  ) {
    if (indexesToEncoderTypes?.isNotEmpty == true) {
      return indexesToEncoderTypes;
    } else if (_colNameToIdx.isNotEmpty)  {
      if (encoderTypesToNames?.isNotEmpty == true) {
        return _createEncodersFromEncoderToName(encoderTypesToNames);
      } else if (namesToEncoderTypes?.isNotEmpty == true) {
        return _createEncodersFromNameToEncoder(namesToEncoderTypes);
      }
    }
    return {};
  }

  Map<int, CategoricalDataEncoderType> _createEncodersFromEncoderToName(
      Map<CategoricalDataEncoderType, Iterable<String>> encoderToName) {
    final encoders = <int, CategoricalDataEncoderType>{};
    for (final entry in encoderToName.entries) {
      for (final name in entry.value.toSet()) {
        final idxToEncoder = _createEntry(name, entry.key);
        if (encoders.containsKey(idxToEncoder.key)) {
          throw Exception('Column `$name` is going to be encoded at least by '
              'two different encoders, please, re-check your input parameters');
        }
        encoders[idxToEncoder.key] = idxToEncoder.value;
      }
    }
    return encoders;
  }

  Map<int, CategoricalDataEncoderType> _createEncodersFromNameToEncoder(
          Map<String, CategoricalDataEncoderType> nameToEncoder) =>
    nameToEncoder.map((colName, encoderType) =>
        _createEntry(colName, encoderType));

  MapEntry<int, CategoricalDataEncoderType> _createEntry(String colName,
      CategoricalDataEncoderType encoderType) {
    if (!_colNameToIdx.containsKey(colName)) {
      throw Exception('Column named `$colName` does not exist, please, '
          'double check your dataset column names');
    }
    final idx = _colNameToIdx[colName];
    return MapEntry(idx, encoderType);
  }
}
