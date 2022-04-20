import 'package:ml_preprocessing/ml_preprocessing.dart';
import 'package:ml_preprocessing/src/encoder/encoder_type.dart';

/// A way to handle unknown categorical data
///
/// During processing new data one can encounter previously unseen value. Let's
/// say, one has a list of values denoting a level of education:
///
/// ```
/// ['BSc', 'BSc', 'PhD', 'High School', 'PhD']
/// ```
///
/// One successfully applied some [EncoderType] to the data, let's say, [EncoderType.label].
///
/// But what should one do if there is an unknown categorical value, e.g.
/// 'School SAT', among new data to process through the same [Pipeline]?
///
/// [UnknownValueHandlingType.error] forces the pipeline to stop preprocessing
/// and throw an error
///
/// [UnknownValueHandlingType.ignore] makes it possible to continue the
/// preprocessing as nothing happened - in this case depending on the [EncoderType]
/// will be used an autogenerated encoded value
enum UnknownValueHandlingType {
  error,
  ignore,
}

const defaultUnknownValueHandlingType = UnknownValueHandlingType.ignore;
