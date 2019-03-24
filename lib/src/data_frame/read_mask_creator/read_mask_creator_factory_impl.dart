import 'package:ml_preprocessing/src/data_frame/read_mask_creator/read_mask_creator.dart';
import 'package:ml_preprocessing/src/data_frame/read_mask_creator/read_mask_creator_factory.dart';
import 'package:ml_preprocessing/src/data_frame/read_mask_creator/read_mask_creator_impl.dart';

class DataFrameReadMaskCreatorFactoryImpl implements
    DataFrameReadMaskCreatorFactory {

  const DataFrameReadMaskCreatorFactoryImpl();

  @override
  DataFrameReadMaskCreator create() => DataFrameReadMaskCreatorImpl();
}
