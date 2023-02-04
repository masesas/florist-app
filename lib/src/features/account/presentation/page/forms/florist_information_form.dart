part of 'forms.dart';

class FloristInformationForm {
  static const String FLORIST_NAME = "florist_name";
  static const String CONTACT_NUMBER = "contact_number";
  static const String EMAIL = "email";

  static Map<String, AbstractControl<dynamic>> floristName = {
    FLORIST_NAME: FormControl<String>(validators: [
      Validators.required,
    ])
  };

  static Map<String, AbstractControl<dynamic>> contactNumber = {
    CONTACT_NUMBER: FormControl<String>(validators: [
      Validators.required,
    ])
  };

  static Map<String, AbstractControl<dynamic>> email = {
    EMAIL: FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ])
  };
}
