import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/abstract/handle_model_abstract.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';
import 'package:user_app/domain/abstract/image_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';

class HandleController extends ChangeNotifier
    implements HandleControllerAbstract {
  final HandleModelAbstract _handleModel;
  final NavigationControllerAbstract _navigationController;
  final ImageControllerAbstract _imageController;

  static const double _startDiamter = 40;

  Offset? _selectedHandlePosition;
  double _selectedHandleDiameter = _startDiamter;
  int? _selectedHandleId;

  // TODO: configure start transformation
  final TransformationController _transformationController =
      TransformationController(Matrix4.identity());

  HandleController(
      {required HandleModelAbstract handleModel,
      required NavigationControllerAbstract navigationController,
      required ImageControllerAbstract imageController})
      : _handleModel = handleModel,
        _navigationController = navigationController,
        _imageController = imageController;

  @override
  Offset? get selectedHandlePosition => _selectedHandlePosition;

  @override
  double get selectedHandleDiameter => _selectedHandleDiameter;

  @override
  int? get selectedHandleId => _selectedHandleId;

  @override
  TransformationController get transformationController =>
      _transformationController;

  @override
  void setSelectedHandleId(int? id, BuildContext context) {
    _selectedHandleId = id;
    Handle? handle = _handleModel.getHandleById(id!);
    _selectedHandleDiameter = handle!.radius.toDouble();
    _selectedHandlePosition = Offset(handle.x.toDouble(), handle.y.toDouble());
    if (context.mounted) {
      _navigationController.switchToHandleManagementEdit(context);
    }
    notifyListeners();
  }

  @override
  void setSelectedHandleDiameter(double value) {
    _selectedHandleDiameter = value;
    notifyListeners();
  }

  @override
  void updateSelectedHandlePosition(Offset delta) {
    _selectedHandlePosition = _selectedHandlePosition! + delta;
    notifyListeners();
  }

  /// isn't mathematical middle, only approximation
  @override
  void setNewHandlePositionToScreenMiddle(BuildContext context) {
    if (!isHandleSelected()) {
      final Matrix4 matrix = Matrix4.inverted(_transformationController.value);
      final size = MediaQuery.of(context).size;

      final Offset screenCenter = Offset(size.width / 2, size.height / 2.3);

      _selectedHandlePosition =
          MatrixUtils.transformPoint(matrix, screenCenter);
    }
  }

  @override
  Future<bool> saveHandle(BuildContext context) async {
    if (selectedHandlePosition == null) {
      throw Exception('Handle position or diameter is null');
    }
    bool success = false;

    try {
      if (_selectedHandleId == null) {
        success = await _handleModel.addHandle(
          selectedHandlePosition!.dx.toInt(),
          selectedHandlePosition!.dy.toInt(),
          selectedHandleDiameter.toInt(),
        );
      } else {
        success = await _handleModel.editHandle(
            selectedHandleId!,
            _selectedHandlePosition!.dx.toInt(),
            _selectedHandlePosition!.dy.toInt(),
            _selectedHandleDiameter.toInt());
      }
    } on Exception {
      UiHelper.showErrorSnackbar("Fehler beim Speichern");
    }

    deselectHandle();

    if (context.mounted) {
      _navigationController.switchToHandleManagementOverview(context);
    }
    return success;
  }

  @override
  void deselectHandle() {
    _selectedHandleId = null;
    _selectedHandleDiameter = _startDiamter;
  }

  @override
  Future<List<Handle>> loadAllHandles() async {
    return await _handleModel.loadAllHandles();
  }

  @override
  Future<bool> deleteHandle(BuildContext context) async {
    bool success = false;
    try {
      success = await _handleModel.removeHandle(selectedHandleId!);
    } on Exception {
      UiHelper.showErrorSnackbar("Fehler beim löschen des Holds");
    }

    deselectHandle();

    if (context.mounted) {
      _navigationController.switchToHandleManagementOverview(context);
    }
    return success;
  }

  @override
  bool isHandleSelected() {
    return _selectedHandleId != null;
  }

  @override
  void initializeTransformationController(Size containerSize) {
    if (_transformationController.value != Matrix4.identity()) {
      return;
    }
    final imageSize = _imageController.imageDimensions;

    double scaleX = containerSize.width / imageSize!.$1;
    double scaleY = containerSize.height / imageSize.$2;
    double initialScale = scaleX > scaleY ? scaleX : scaleY;

    _transformationController.value = Matrix4.identity()..scale(initialScale);
    notifyListeners();
  }
}
