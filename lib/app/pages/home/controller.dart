import 'package:camera/camera.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController with StateMixin {
  late CameraController controller;

  @override
  void onInit() async {
    final _cameras = await availableCameras();
    initCamera(_cameras);
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void initCamera(List<CameraDescription> cameras) async {
    change(null, status: RxStatus.loading());
    controller = CameraController(cameras[0], ResolutionPreset.max);
    await controller.initialize();
    change(null, status: RxStatus.success());
  }

  void onDroppedFile(value) {
    print(value);
  }
}
