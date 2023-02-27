import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import '../../../../../core/helper/form/form.dart';

part 'change_address.gform.dart';

@ReactiveFormAnnotation()
class ChangeAddress {
  String? zipCode;
  final String? address;
  final String? latitude;
  final String? longitude;

  ChangeAddress({
    this.zipCode,
    @FormControlAnnotation<String>(validators: [requiredValidator])
        this.address,
    @FormControlAnnotation<String>(disabled: true, validators: [
      requiredValidator
    ])
        this.latitude,
    @FormControlAnnotation<String>(disabled: true, validators: [
      requiredValidator
    ])
        this.longitude,
  });
}
