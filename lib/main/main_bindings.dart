import 'package:get/get.dart';
import 'package:twake/main/network/network_bindings.dart';

class MainBindings extends Bindings {
  @override
  Future dependencies() async {
    NetworkBindings().dependencies();
  }
}