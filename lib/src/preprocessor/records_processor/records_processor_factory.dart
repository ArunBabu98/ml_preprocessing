import 'package:ml_linalg/dtype.dart';
import 'package:ml_preprocessing/src/categorical_data_codec/codec_factory.dart';
import 'package:ml_preprocessing/src/categorical_data_codec/encoding_type.dart';
import 'package:ml_preprocessing/src/preprocessor/numerical_converter/numerical_converter.dart';
import 'package:ml_preprocessing/src/preprocessor/records_processor/records_processor.dart';

abstract class RecordsProcessorFactory {
  RecordsProcessor create(
      List<List<dynamic>> records,
      List<int> columnIndices,
      List<int> rowIndices,
      Map<int, CategoricalDataEncodingType> encoders,
      NumericalConverter valueConverter,
      CategoricalDataCodecFactory codecFactory,
      DType dtype);
}
