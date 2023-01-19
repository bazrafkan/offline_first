import 'package:offline_first/src/ui/home/base/base_di_view_model_serivice_locator.dart';
import 'package:offline_first/src/ui/home/repository.dart';

class HomeViewModelServiceLocator extends BaseHomeViewModelServiceLocator {
  const HomeViewModelServiceLocator();

  @override
  HomeRepository getHomeRepository() {
    return HomeRepository();
  }
}
