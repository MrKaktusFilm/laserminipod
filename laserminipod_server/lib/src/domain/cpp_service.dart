import 'dart:ffi' as ffi;
import 'dart:io';
import 'package:path/path.dart' as path;

typedef SayHelloFunc = ffi.Void Function(ffi.Int32, ffi.Int32, ffi.Double);
typedef SayHello = void Function(int, int, double);

class CppService {
  late final SayHello _sayHello;
  CppService() {
    String? libraryPath;
    if (Platform.isWindows) {
      libraryPath = path.join(Directory.current.path, 'lib', 'src', 'native',
          'LaserControll', 'x64', 'Debug', 'LaserControll.dll');
    } else if (Platform.isLinux) {
      libraryPath = path.join(Directory.current.path, 'lib', 'src', 'native',
          'LaserControll', 'x64', 'Debug', 'LaserControll.so');
    } else if (Platform.isMacOS) {
      libraryPath = path.join(Directory.current.path, 'lib', 'src', 'native',
          'LaserControll', 'x64', 'Debug', 'LaserControll.dylib');
    } else {
      throw UnsupportedError(
          'Unsupported platform: ${Platform.operatingSystem}');
    }
    final dylib = ffi.DynamicLibrary.open(libraryPath);
    _sayHello = dylib
        .lookup<ffi.NativeFunction<SayHelloFunc>>('HalloWeltParameter')
        .asFunction();
  }

  void hello(int x, int y, double radius) {
    _sayHello(x, y, radius);
  }
}
