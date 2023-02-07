// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'request_shipping.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveRequestShippingFormConsumer extends StatelessWidget {
  const ReactiveRequestShippingFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
          BuildContext context, RequestShippingForm formModel, Widget? child)
      builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveRequestShippingForm.of(context);

    if (formModel is! RequestShippingForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class RequestShippingFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const RequestShippingFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final RequestShippingForm form;
}

class ReactiveRequestShippingForm extends StatelessWidget {
  const ReactiveRequestShippingForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final RequestShippingForm form;

  final WillPopCallback? onWillPop;

  static RequestShippingForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              RequestShippingFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        RequestShippingFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as RequestShippingFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return RequestShippingFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class RequestShippingFormBuilder extends StatefulWidget {
  const RequestShippingFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final RequestShipping? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
          BuildContext context, RequestShippingForm formModel, Widget? child)
      builder;

  final void Function(BuildContext context, RequestShippingForm formModel)?
      initState;

  @override
  _RequestShippingFormBuilderState createState() =>
      _RequestShippingFormBuilderState();
}

class _RequestShippingFormBuilderState
    extends State<RequestShippingFormBuilder> {
  late FormGroup _form;

  late RequestShippingForm _formModel;

  @override
  void initState() {
    _form = FormGroup({});
    _formModel = RequestShippingForm(widget.model, _form, null);

    final elements = _formModel.formElements();
    _form.setValidators(elements.validators);
    _form.setAsyncValidators(elements.asyncValidators);

    if (elements.disabled) {
      _form.markAsDisabled();
    }

    _form.addAll(elements.controls);

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant RequestShippingFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel = RequestShippingForm(widget.model, _form, null);
      final elements = _formModel.formElements();

      _form.updateValue(elements.rawValue);
      _form.setValidators(elements.validators);
      _form.setAsyncValidators(elements.asyncValidators);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveRequestShippingForm(
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _form,
        onWillPop: widget.onWillPop,
        builder: (BuildContext context, FormGroup formGroup, Widget? child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class RequestShippingForm implements FormModel<RequestShipping> {
  RequestShippingForm(
    this.requestShipping,
    this.form,
    this.path,
  ) {}

  static String logisticControlName = "logistic";

  static String vehicleControlName = "vehicle";

  static String pickupFormControlName = "pickupForm";

  static String recipientAddressControlName = "recipientAddress";

  static String recipientNameControlName = "recipientName";

  static String recipientContactControlName = "recipientContact";

  static String remarkControlName = "remark";

  static String scheduleProssesControlName = "scheduleProsses";

  static String scheduleTimeControlName = "scheduleTime";

  final RequestShipping? requestShipping;

  final FormGroup form;

  final String? path;

  String logisticControlPath() => pathBuilder(logisticControlName);
  String vehicleControlPath() => pathBuilder(vehicleControlName);
  String pickupFormControlPath() => pathBuilder(pickupFormControlName);
  String recipientAddressControlPath() =>
      pathBuilder(recipientAddressControlName);
  String recipientNameControlPath() => pathBuilder(recipientNameControlName);
  String recipientContactControlPath() =>
      pathBuilder(recipientContactControlName);
  String remarkControlPath() => pathBuilder(remarkControlName);
  String scheduleProssesControlPath() =>
      pathBuilder(scheduleProssesControlName);
  String scheduleTimeControlPath() => pathBuilder(scheduleTimeControlName);
  String? get _logisticValue => logisticControl?.value;
  String? get _vehicleValue => vehicleControl?.value;
  String? get _pickupFormValue => pickupFormControl?.value;
  String? get _recipientAddressValue => recipientAddressControl?.value;
  String? get _recipientNameValue => recipientNameControl?.value;
  String? get _recipientContactValue => recipientContactControl?.value;
  String? get _remarkValue => remarkControl?.value;
  String? get _scheduleProssesValue => scheduleProssesControl?.value;
  String? get _scheduleTimeValue => scheduleTimeControl?.value;
  bool get containsLogistic {
    try {
      form.control(logisticControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsVehicle {
    try {
      form.control(vehicleControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsPickupForm {
    try {
      form.control(pickupFormControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsRecipientAddress {
    try {
      form.control(recipientAddressControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsRecipientName {
    try {
      form.control(recipientNameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsRecipientContact {
    try {
      form.control(recipientContactControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsRemark {
    try {
      form.control(remarkControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsScheduleProsses {
    try {
      form.control(scheduleProssesControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsScheduleTime {
    try {
      form.control(scheduleTimeControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get logisticErrors => logisticControl?.errors;
  Object? get vehicleErrors => vehicleControl?.errors;
  Object? get pickupFormErrors => pickupFormControl?.errors;
  Object? get recipientAddressErrors => recipientAddressControl?.errors;
  Object? get recipientNameErrors => recipientNameControl?.errors;
  Object? get recipientContactErrors => recipientContactControl?.errors;
  Object? get remarkErrors => remarkControl?.errors;
  Object? get scheduleProssesErrors => scheduleProssesControl?.errors;
  Object? get scheduleTimeErrors => scheduleTimeControl?.errors;
  void get logisticFocus => form.focus(logisticControlPath());
  void get vehicleFocus => form.focus(vehicleControlPath());
  void get pickupFormFocus => form.focus(pickupFormControlPath());
  void get recipientAddressFocus => form.focus(recipientAddressControlPath());
  void get recipientNameFocus => form.focus(recipientNameControlPath());
  void get recipientContactFocus => form.focus(recipientContactControlPath());
  void get remarkFocus => form.focus(remarkControlPath());
  void get scheduleProssesFocus => form.focus(scheduleProssesControlPath());
  void get scheduleTimeFocus => form.focus(scheduleTimeControlPath());
  void logisticRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsLogistic) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          logisticControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            logisticControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void vehicleRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsVehicle) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          vehicleControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            vehicleControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void pickupFormRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsPickupForm) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          pickupFormControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            pickupFormControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void recipientAddressRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsRecipientAddress) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          recipientAddressControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            recipientAddressControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void recipientNameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsRecipientName) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          recipientNameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            recipientNameControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void recipientContactRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsRecipientContact) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          recipientContactControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            recipientContactControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void remarkRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsRemark) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          remarkControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            remarkControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void scheduleProssesRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsScheduleProsses) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          scheduleProssesControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            scheduleProssesControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void scheduleTimeRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsScheduleTime) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          scheduleTimeControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            scheduleTimeControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void logisticValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    logisticControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void vehicleValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    vehicleControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void pickupFormValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    pickupFormControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void recipientAddressValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    recipientAddressControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void recipientNameValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    recipientNameControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void recipientContactValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    recipientContactControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void remarkValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    remarkControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void scheduleProssesValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    scheduleProssesControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void scheduleTimeValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    scheduleTimeControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void logisticValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    logisticControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void vehicleValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    vehicleControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void pickupFormValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    pickupFormControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void recipientAddressValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    recipientAddressControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void recipientNameValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    recipientNameControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void recipientContactValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    recipientContactControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void remarkValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    remarkControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void scheduleProssesValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    scheduleProssesControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void scheduleTimeValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    scheduleTimeControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void logisticValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      logisticControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void vehicleValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      vehicleControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void pickupFormValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      pickupFormControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void recipientAddressValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      recipientAddressControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void recipientNameValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      recipientNameControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void recipientContactValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      recipientContactControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void remarkValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      remarkControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void scheduleProssesValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      scheduleProssesControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void scheduleTimeValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      scheduleTimeControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String>? get logisticControl => containsLogistic
      ? form.control(logisticControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get vehicleControl => containsVehicle
      ? form.control(vehicleControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get pickupFormControl => containsPickupForm
      ? form.control(pickupFormControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get recipientAddressControl => containsRecipientAddress
      ? form.control(recipientAddressControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get recipientNameControl => containsRecipientName
      ? form.control(recipientNameControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get recipientContactControl => containsRecipientContact
      ? form.control(recipientContactControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get remarkControl => containsRemark
      ? form.control(remarkControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get scheduleProssesControl => containsScheduleProsses
      ? form.control(scheduleProssesControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get scheduleTimeControl => containsScheduleTime
      ? form.control(scheduleTimeControlPath()) as FormControl<String>?
      : null;
  void logisticSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      logisticControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      logisticControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void vehicleSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      vehicleControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      vehicleControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void pickupFormSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      pickupFormControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      pickupFormControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void recipientAddressSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      recipientAddressControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      recipientAddressControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void recipientNameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      recipientNameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      recipientNameControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void recipientContactSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      recipientContactControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      recipientContactControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void remarkSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      remarkControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      remarkControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void scheduleProssesSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      scheduleProssesControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      scheduleProssesControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void scheduleTimeSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      scheduleTimeControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      scheduleTimeControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  RequestShipping get model {
    if (!form.valid) {
      debugPrint(
        'Prefer not to call `model` on non-valid form it could cause unexpected exceptions in case you created a non-nullable field in model and expect it to be guarded by some kind of `required` validator.',
      );
    }
    return RequestShipping(
        logistic: _logisticValue,
        vehicle: _vehicleValue,
        pickupForm: _pickupFormValue,
        recipientAddress: _recipientAddressValue,
        recipientName: _recipientNameValue,
        recipientContact: _recipientContactValue,
        remark: _remarkValue,
        scheduleProsses: _scheduleProssesValue,
        scheduleTime: _scheduleTimeValue);
  }

  RequestShippingForm copyWithPath(String? path) {
    return RequestShippingForm(requestShipping, form, path);
  }

  @override
  void updateValue(
    RequestShipping value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(
          RequestShippingForm(value, FormGroup({}), null)
              .formElements()
              .rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  @override
  void resetValue(
    RequestShipping value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: RequestShippingForm(value, FormGroup({}), null)
              .formElements()
              .rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  @override
  void reset({
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: formElements().rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  FormGroup formElements() => FormGroup({
        logisticControlName: FormControl<String>(
            value: requestShipping?.logistic,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        vehicleControlName: FormControl<String>(
            value: requestShipping?.vehicle,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        pickupFormControlName: FormControl<String>(
            value: requestShipping?.pickupForm,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        recipientAddressControlName: FormControl<String>(
            value: requestShipping?.recipientAddress,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        recipientNameControlName: FormControl<String>(
            value: requestShipping?.recipientName,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        recipientContactControlName: FormControl<String>(
            value: requestShipping?.recipientContact,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        remarkControlName: FormControl<String>(
            value: requestShipping?.remark,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        scheduleProssesControlName: FormControl<String>(
            value: requestShipping?.scheduleProsses,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        scheduleTimeControlName: FormControl<String>(
            value: requestShipping?.scheduleTime,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ReactiveRequestShippingFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveRequestShippingFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(RequestShippingForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      RequestShippingForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, RequestShippingForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveRequestShippingForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final itemList = (formArray.value ?? [])
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveRequestShippingFormFormGroupArrayBuilder<V>
    extends StatelessWidget {
  const ReactiveRequestShippingFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<V>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<V>> Function(
      RequestShippingForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      RequestShippingForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, V? item, RequestShippingForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveRequestShippingForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <V>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}
