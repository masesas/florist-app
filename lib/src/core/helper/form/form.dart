import 'package:reactive_forms/reactive_forms.dart';

part 'custom_form_control.dart';

Map<String, dynamic>? requiredValidator(AbstractControl<dynamic> control) {
  return Validators.required(control);
}
