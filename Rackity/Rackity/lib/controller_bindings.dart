import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:rackity/controller/image_controller.dart';


class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ImagesController>(ImagesController());

  }
}

