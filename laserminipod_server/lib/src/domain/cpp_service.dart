import 'dart:ffi' as ffi;
import 'dart:io';
import 'package:path/path.dart' as path;

typedef SayHelloFunc = ffi.Void Function(ffi.Int32, ffi.Int32, ffi.Double);
typedef SayHello = void Function(int, int, double);

class CppService {
  late final SayHello _sayHello;
  CppService() {
    var libraryPath = path.join(Directory.current.path, 'lib', 'src', 'native',
        'LaserControll', 'x64', 'Debug', 'LaserControll.dll');
    final dylib = ffi.DynamicLibrary.open(libraryPath);
    _sayHello = dylib
        .lookup<ffi.NativeFunction<SayHelloFunc>>('HalloWeltParameter')
        .asFunction();
  }

  void hello(int x, int y, double radius) {
    _sayHello(x, y, radius);
  }
}
