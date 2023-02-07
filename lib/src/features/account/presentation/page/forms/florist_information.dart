import 'package:florist_app/src/core/global/domain/user_domain.dart';
import 'package:florist_app/src/core/helper/form/form.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'florist_information.gform.dart';

@ReactiveFormAnnotation()
class FloristInformation extends UserEntity {
  const FloristInformation({
    final String? userId,
    @FormControlAnnotation<String>(validators: [requiredValidator])
        final String? floristName,
    @FormControlAnnotation<String>(validators: [requiredValidator])
        final String? contactPerson,
    @FormControlAnnotation<String>(validators: [requiredValidator])
        final String? email,
    @FormControlAnnotation<String>(validators: [requiredValidator])
        final String? address,
    @FormControlAnnotation<double>(validators: [requiredValidator])
        final double? latitude,
    @FormControlAnnotation<double>(validators: [requiredValidator])
        final double? longitude,
  }) : super(
          userId: userId ?? "",
          floristName: floristName ?? "",
          contactPerson: contactPerson ?? "",
          email: email ?? "",
          address: address ?? "",
          latitude: latitude ?? 0.0,
          longitude: longitude ?? 0.0,
        );
}
