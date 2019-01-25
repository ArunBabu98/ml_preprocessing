import 'package:logging/logging.dart';
import 'package:ml_preprocessing/src/categorical_encoder/encoder.dart';
import 'package:ml_preprocessing/src/ml_data/features_extractor/features_extractor.dart';
import 'package:ml_preprocessing/src/ml_data/value_converter/value_converter.dart';

abstract class MLDataFeaturesExtractorFactory {
  MLDataFeaturesExtractor create(List<List<Object>> records, List<bool> rowMask, List<bool> columnsMask,
      Map<int, CategoricalDataEncoder> encoders, int labelIdx, MLDataValueConverter valueConverter, Logger logger);
}
