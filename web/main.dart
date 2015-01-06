import 'package:angular/application_factory.dart';
import 'package:resolutionizer/resolutionizer.dart';

void main() {
	applicationFactory()
		.addModule(new ResolutionizerApp())
		.run();
}
