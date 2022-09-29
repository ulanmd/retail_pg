import 'package:mobx/mobx.dart';

// Include generated file
part 'orderStore.g.dart';

// This is the class used by rest of your codebase
class Order = _Order with _$Order;

abstract class _Order with Store{
  @observable
  bool isOpen = false;

  void setTrue(){this.isOpen = true;}
  void setFalse(){this.isOpen = false;}
}