import 'dart:io' show Platform;
import 'dart:async' show runZoned;
import 'package:path/path.dart' show join, dirname;
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_static/shelf_static.dart';

void main() {
  var pathToBuild = join(dirname(Platform.script.toFilePath()), '..', 'build/web');

  // Add handler for serving static files.
  var staticHandler = createStaticHandler(pathToBuild, defaultDocument: 'index.html');

  // Create top level handler for multi-plexing requests.
  var appHandler = new shelf.Cascade()
    .add(staticHandler) // try to serve a static file first
    .add(apiHandler)    // if not a static file then treat the request as an API request
    .handler;

  var handler = const shelf.Pipeline().addMiddleware(shelf.logRequests())
    .addHandler(appHandler);

  // Determine what port to bind to.
  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 4040 : int.parse(portEnv);

  runZoned(() {
    io.serve(handler, '0.0.0.0', port);
    print("Serving $pathToBuild on port $port");
  },
  onError: (e, stackTrace) => print('Error! $e $stackTrace'));
}

shelf.Response apiHandler(shelf.Request request) {
  return new shelf.Response.ok('This is where the api goes...');
}