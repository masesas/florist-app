import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import '../../../../core/helper/form/form.dart';

part 'login_widget.gform.dart';

@ReactiveFormAnnotation()
class LoginWidget {
  final String? username;
  final String? password;

  LoginWidget({
    @FormControlAnnotation<String>(validators: [requiredValidator])
        this.username,
    @FormControlAnnotation<String>(validators: [requiredValidator])
        this.password,
  });
}
