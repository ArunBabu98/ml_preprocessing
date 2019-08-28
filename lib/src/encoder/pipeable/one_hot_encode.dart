import 'package:ml_preprocessing/src/encoder/encoder_impl.dart';
import 'package:ml_preprocessing/src/encoder/encoder_type.dart';
import 'package:ml_preprocessing/src/encoder/series_encoder/series_encoder_factory_impl.dart';
import 'package:ml_preprocessing/src/pipeline/pipeable.dart';

/// A factory function to use `one hot` categorical data encoder in pipeline
PipeableOperatorFn encodeAsOneHotLabels({
  Iterable<int> columns,
  Iterable<String> columnNames,
  String headerPrefix,
  String headerPostfix,
}) => (data) => EncoderImpl(
  data,
  EncoderType.oneHot,
  SeriesEncoderFactoryImpl(),
  featureNames: columnNames,
  featureIds: columns,
  encodedHeaderPostfix: headerPostfix,
  encodedHeaderPrefix: headerPrefix,
);