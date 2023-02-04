part of 'form.dart';

class FormName {
  static const String userId = "userId";
  static const String password = "password";
  static const String passwordConfirmation = "password_confirmation";
  static const String number = "number";
}

class CustomFormControl {
  static Map<String, AbstractControl<dynamic>> userId = {
    FormName.userId: FormControl<String>(validators: [
      Validators.required,
    ])
  };

  static Map<String, AbstractControl<dynamic>> number = {
    FormName.number: FormControl<String>(validators: [
      Validators.required,
      Validators.number,
    ])
  };

  static Map<String, AbstractControl<dynamic>> password = {
    FormName.password: FormControl<String>(
      validators: [
        Validators.required,
      ],
    )
  };

  static Map<String, AbstractControl<dynamic>> passwordConfirmation = {
    FormName.passwordConfirmation: FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
  };
}
