import 'package:angular/application_factory.dart';
import 'package:logging/logging.dart';
import 'package:resolutionizer/resolutionizer.dart';

void main() {
	Logger.root..level = Level.FINEST
	           ..onRecord.listen((LogRecord r) { print(r.message); } );

	applicationFactory()
		.addModule(new ResolutionizerApp())
		.run();
}
