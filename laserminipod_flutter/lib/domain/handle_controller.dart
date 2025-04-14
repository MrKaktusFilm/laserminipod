import 'package:flutter/material.dart';
import 'package:laserminipod_client/laserminipod_client.dart';
import 'package:user_app/data/network/abstract/handle_model_abstract.dart';
import 'package:user_app/domain/abstract/handle_controller_abstract.dart';
import 'package:user_app/domain/abstract/image_controller_abstract.dart';
import 'package:user_app/domain/abstract/navigation_controller_abstract.dart';
import 'package:user_app/domain/spraywall_transformation_controller.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:user_app/routes.dart';

class HandleController extends ChangeNotifier
    implements HandleControllerAbstract {
  final HandleModelAbstract _handleModel;
  final NavigationControllerAbstract _navigationController;
  static const double _startDiamter = 40;

  Offset? _selectedHandlePosition;
  double _selectedHandleDiameter = _startDiamter;
  int? _selectedHandleId;

  final SpraywallTransformationController _transformationController =
      SpraywallTransformationController();

  HandleController(
      {required HandleModelAbstract handleModel,
      required NavigationControllerAbstract navigationController,
      required ImageControllerAbstract imageController})
      : _handleModel = handleModel,
        _navigationController = navigationController;

  @override
  Offset? get selectedHandlePosition => _selectedHandlePosition;

  @override
  double get selectedHandleDiameter => _selectedHandleDiameter;

  @override
  int? get selectedHandleId => _selectedHandleId;

  @override
  SpraywallTransformationController get transformationController =>
      _transformationController;

  @override
  void setSelectedHandle(int? id, BuildContext context) {
    try {
      _selectedHandleId = id;
      Handle? handle = _handleModel.getHandleById(id!);
      _selectedHandleDiameter = handle!.radius.toDouble();
      _selectedHandlePosition =
          Offset(handle.x.toDouble(), handle.y.toDouble());
      if (context.mounted) {
        _navigationController.pushPage(context, AppRoute.handleManagementEdit);
      }
      notifyListeners();
    } on Exception catch (e) {
      UiHelper.showErrorSnackbar(UiHelper.getAppLocalization().error, e);
    }
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
  Future<void> saveHandle(BuildContext context) async {
    if (selectedHandlePosition == null) {
      throw Exception('Handle position is null');
    }
    try {
      if (_selectedHandleId == null) {
        await _handleModel.addHandle(
          selectedHandlePosition!.dx.toInt(),
          selectedHandlePosition!.dy.toInt(),
          selectedHandleDiameter.toInt(),
        );
      } else {
        await _handleModel.editHandle(
            selectedHandleId!,
            _selectedHandlePosition!.dx.toInt(),
            _selectedHandlePosition!.dy.toInt(),
            _selectedHandleDiameter.toInt());
      }
    } on Exception catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().saveHandleError, e);
    }

    deselectHandle();

    if (context.mounted) {
      _navigationController.closeCurrentScreen(context);
    }
  }

  @override
  void deselectHandle() {
    _selectedHandleId = null;
    _selectedHandleDiameter = _startDiamter;
  }

  @override
  Future<List<Handle>> loadAllHandles() async {
    try {
      return await _handleModel.loadAllHandles();
    } on Exception catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().loadHandleError, e);
      return [];
    }
  }

  @override
  Future<void> deleteHandle(BuildContext context) async {
    try {
      await _handleModel.removeHandle(selectedHandleId!);
    } on Exception catch (e) {
      UiHelper.showErrorSnackbar(
          UiHelper.getAppLocalization().deleteHandleError, e);
    }

    deselectHandle();

    if (context.mounted) {
      _navigationController.closeCurrentScreen(context);
    }
  }

  @override
  bool isHandleSelected() {
    return _selectedHandleId != null;
  }
}
