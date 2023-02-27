import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'florist_information.gform.dart';

@ReactiveFormAnnotation()
class FloristInformation {
  final String? floristName;
  final String? contactPerson;
  final String? email;

  const FloristInformation({
    @FormControlAnnotation<String>() this.floristName,
    @FormControlAnnotation<String>() this.contactPerson,
    @FormControlAnnotation<String>() this.email,
  });
}
