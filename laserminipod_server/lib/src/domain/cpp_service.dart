import 'dart:ffi' as ffi;
import 'dart:io';
import 'package:path/path.dart' as path;

typedef hello_world_func = ffi.Void Function();
typedef SayHello = void Function();

class CppService {
  late final SayHello _sayHello;
  CppService() {
    var libraryPath = path.join(Directory.current.path, 'lib', 'src', 'native',
        'LaserControll', 'x64', 'Debug', 'LaserControll.dll');
    final dylib = ffi.DynamicLibrary.open(libraryPath);
    _sayHello = dylib
        .lookup<ffi.NativeFunction<hello_world_func>>('HalloWelt')
        .asFunction();
  }

  void hello() {
    _sayHello();
  }
}
