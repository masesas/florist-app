import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import '../../../../../core/helper/form/form.dart';

part 'change_password.gform.dart';

@ReactiveFormAnnotation()
class ChangePassword {
  final String newPassword;
  final String confirmPassword;

  ChangePassword({
    @FormControlAnnotation<String>(validators: [
      requiredValidator,
    ])
        this.newPassword = '',
    @FormControlAnnotation<String>(validators: [
      requiredValidator,
    ])
        this.confirmPassword = '',
  });
}
