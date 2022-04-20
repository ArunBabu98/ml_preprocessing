import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:ml_linalg/linalg.dart';
import 'package:ml_preprocessing/src/pipeline/pipeable.dart';
import 'package:ml_preprocessing/src/standardizer/standardizer_impl.dart';

/// A class that performs data standardization.
///
/// Data standardization is a process, targeted to make the data look like
/// normally distributed data (with zero mean and unit variance).
///
/// Standardization applies column-wise.
///
/// Example:
///
/// ```dart
/// import 'package:ml_dataframe/ml_dataframe.dart';
/// import 'package:ml_preprocessing/ml_preprocessing.dart';
///
/// void main() {
///   final data = DataFrame([
///     ['feature_1', 'feature_2', 'label'],
///     [         10,        33.2,       2],
///     [         20,          -1,       4],
///     [         40,         -10,       5],
///     [         55,         100,      10],
///   ]);
///   final standardizer = Standardizer(data);
///   final processed = standardizer.process(data);
///
///   print(processed);
///   // DataFrame (4 x 3)
///   //           feature_1             feature_2                  label
///   //  -1.217395305633545   0.06132180616259575    -1.1026456356048584
///   // -0.6445034146308899   -0.7300761342048645   -0.42409446835517883
///   //  0.5012804269790649   -0.9383387565612793   -0.08481889218091965
///   //  1.3606183528900146     1.607093095779419     1.6115589141845703
/// }
/// ```
abstract class Standardizer implements Pipeable {
  factory Standardizer(
    DataFrame fittingData, {
    DType dtype,
  }) = StandardizerImpl;
}