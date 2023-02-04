part of 'forms.dart';

class ChangePasswordForm {
  static const String NEW_PW = "new_pw";
  static const String CONFIRM_PW = "confirm_pw";

  static Map<String, AbstractControl<dynamic>> newPw = {
    NEW_PW: FormControl<String>(validators: [
      Validators.required,
    ])
  };

  static Map<String, AbstractControl<dynamic>> confirmPw = {
    CONFIRM_PW: FormControl<String>(validators: [
      Validators.required,
    ])
  };
}
