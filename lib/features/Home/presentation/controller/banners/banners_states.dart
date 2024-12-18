import 'package:mr_candy/features/Home/data/models/banners_model.dart';

abstract class BannersStates{}

class BannersInitialStates extends BannersStates{}
class BannersLoadingStates extends BannersStates{}
class BannersSuccessStates extends BannersStates{
  final List<BannersModel> bannersss;
  BannersSuccessStates({required this.bannersss});
}
class BannersFailureStates extends BannersStates{
  final String error;
  BannersFailureStates({required this.error});
}
