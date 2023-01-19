import 'package:offline_first/src/ui/home/repository.dart';

abstract class BaseHomeViewModelServiceLocator {
  const BaseHomeViewModelServiceLocator();

  HomeRepository getHomeRepository();
}
