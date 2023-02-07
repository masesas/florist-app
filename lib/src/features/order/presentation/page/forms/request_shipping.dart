import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import '../../../../../core/helper/form/form.dart';
import '../../../domain/entities/entity.dart';

part 'request_shipping.gform.dart';

@ReactiveFormAnnotation()
class RequestShipping extends RequestShippingEntity {
  const RequestShipping({
    @FormControlAnnotation<String>(
      validators: [requiredValidator],
    )
        final String? logistic,
    @FormControlAnnotation<String>(
      validators: [requiredValidator],
    )
        final String? vehicle,
    @FormControlAnnotation<String>()
        final String? pickupForm,
    @FormControlAnnotation<String>()
        final String? recipientAddress,
    @FormControlAnnotation<String>()
        final String? recipientName,
    @FormControlAnnotation<String>()
        final String? recipientContact,
    @FormControlAnnotation<String>()
        final String? remark,
    @FormControlAnnotation<String>()
        final String? scheduleProsses,
    @FormControlAnnotation<String>()
        final String? scheduleTime,
  }) : super(
          logistic: logistic ?? "",
          vehicle: vehicle ?? "",
          pickupForm: pickupForm ?? "",
          recipientAddress: recipientAddress ?? "",
          recipientName: recipientName ?? "",
          recipientContact: recipientContact ?? "",
          remark: remark ?? "",
          scheduleProsses: scheduleProsses ?? "",
          scheduleTime: scheduleTime ?? "",
        );
}
