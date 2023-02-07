// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'florist_information.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveFloristInformationFormConsumer extends StatelessWidget {
  const ReactiveFloristInformationFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
          BuildContext context, FloristInformationForm formModel, Widget? child)
      builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveFloristInformationForm.of(context);

    if (formModel is! FloristInformationForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class FloristInformationFormInheritedStreamer
    extends InheritedStreamer<dynamic> {
  const FloristInformationFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final FloristInformationForm form;
}

class ReactiveFloristInformationForm extends StatelessWidget {
  const ReactiveFloristInformationForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final FloristInformationForm form;

  final WillPopCallback? onWillPop;

  static FloristInformationForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              FloristInformationFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        FloristInformationFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as FloristInformationFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return FloristInformationFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class FloristInformationFormBuilder extends StatefulWidget {
  const FloristInformationFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final FloristInformation? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
          BuildContext context, FloristInformationForm formModel, Widget? child)
      builder;

  final void Function(BuildContext context, FloristInformationForm formModel)?
      initState;

  @override
  _FloristInformationFormBuilderState createState() =>
      _FloristInformationFormBuilderState();
}

class _FloristInformationFormBuilderState
    extends State<FloristInformationFormBuilder> {
  late FormGroup _form;

  late FloristInformationForm _formModel;

  @override
  void initState() {
    _form = FormGroup({});
    _formModel = FloristInformationForm(widget.model, _form, null);

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
  void didUpdateWidget(covariant FloristInformationFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel = FloristInformationForm(widget.model, _form, null);
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
    return ReactiveFloristInformationForm(
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

class FloristInformationForm implements FormModel<FloristInformation> {
  FloristInformationForm(
    this.floristInformation,
    this.form,
    this.path,
  ) {}

  static String floristNameControlName = "floristName";

  static String contactPersonControlName = "contactPerson";

  static String emailControlName = "email";

  static String addressControlName = "address";

  static String latitudeControlName = "latitude";

  static String longitudeControlName = "longitude";

  final FloristInformation? floristInformation;

  final FormGroup form;

  final String? path;

  String floristNameControlPath() => pathBuilder(floristNameControlName);
  String contactPersonControlPath() => pathBuilder(contactPersonControlName);
  String emailControlPath() => pathBuilder(emailControlName);
  String addressControlPath() => pathBuilder(addressControlName);
  String latitudeControlPath() => pathBuilder(latitudeControlName);
  String longitudeControlPath() => pathBuilder(longitudeControlName);
  String? get _floristNameValue => floristNameControl?.value;
  String? get _contactPersonValue => contactPersonControl?.value;
  String? get _emailValue => emailControl?.value;
  String? get _addressValue => addressControl?.value;
  double? get _latitudeValue => latitudeControl?.value;
  double? get _longitudeValue => longitudeControl?.value;
  bool get containsFloristName {
    try {
      form.control(floristNameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsContactPerson {
    try {
      form.control(contactPersonControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsEmail {
    try {
      form.control(emailControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsAddress {
    try {
      form.control(addressControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsLatitude {
    try {
      form.control(latitudeControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsLongitude {
    try {
      form.control(longitudeControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get floristNameErrors => floristNameControl?.errors;
  Object? get contactPersonErrors => contactPersonControl?.errors;
  Object? get emailErrors => emailControl?.errors;
  Object? get addressErrors => addressControl?.errors;
  Object? get latitudeErrors => latitudeControl?.errors;
  Object? get longitudeErrors => longitudeControl?.errors;
  void get floristNameFocus => form.focus(floristNameControlPath());
  void get contactPersonFocus => form.focus(contactPersonControlPath());
  void get emailFocus => form.focus(emailControlPath());
  void get addressFocus => form.focus(addressControlPath());
  void get latitudeFocus => form.focus(latitudeControlPath());
  void get longitudeFocus => form.focus(longitudeControlPath());
  void floristNameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsFloristName) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          floristNameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            floristNameControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void contactPersonRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsContactPerson) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          contactPersonControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            contactPersonControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void emailRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsEmail) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          emailControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            emailControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void addressRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsAddress) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          addressControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            addressControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void latitudeRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsLatitude) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          latitudeControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            latitudeControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void longitudeRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsLongitude) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          longitudeControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            longitudeControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void floristNameValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    floristNameControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void contactPersonValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    contactPersonControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void emailValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    emailControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void addressValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    addressControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void latitudeValueUpdate(
    double? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    latitudeControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void longitudeValueUpdate(
    double? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    longitudeControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void floristNameValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    floristNameControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void contactPersonValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    contactPersonControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void emailValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    emailControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void addressValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    addressControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void latitudeValuePatch(
    double? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    latitudeControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void longitudeValuePatch(
    double? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    longitudeControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void floristNameValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      floristNameControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void contactPersonValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      contactPersonControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void emailValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      emailControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void addressValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      addressControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void latitudeValueReset(
    double? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      latitudeControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void longitudeValueReset(
    double? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      longitudeControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String>? get floristNameControl => containsFloristName
      ? form.control(floristNameControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get contactPersonControl => containsContactPerson
      ? form.control(contactPersonControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get emailControl => containsEmail
      ? form.control(emailControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get addressControl => containsAddress
      ? form.control(addressControlPath()) as FormControl<String>?
      : null;
  FormControl<double>? get latitudeControl => containsLatitude
      ? form.control(latitudeControlPath()) as FormControl<double>?
      : null;
  FormControl<double>? get longitudeControl => containsLongitude
      ? form.control(longitudeControlPath()) as FormControl<double>?
      : null;
  void floristNameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      floristNameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      floristNameControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void contactPersonSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      contactPersonControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      contactPersonControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void emailSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      emailControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      emailControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void addressSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      addressControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      addressControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void latitudeSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      latitudeControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      latitudeControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void longitudeSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      longitudeControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      longitudeControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  FloristInformation get model {
    if (!form.valid) {
      debugPrint(
        'Prefer not to call `model` on non-valid form it could cause unexpected exceptions in case you created a non-nullable field in model and expect it to be guarded by some kind of `required` validator.',
      );
    }
    return FloristInformation(
        userId: floristInformation?.userId,
        floristName: _floristNameValue,
        contactPerson: _contactPersonValue,
        email: _emailValue,
        address: _addressValue,
        latitude: _latitudeValue,
        longitude: _longitudeValue);
  }

  FloristInformationForm copyWithPath(String? path) {
    return FloristInformationForm(floristInformation, form, path);
  }

  @override
  void updateValue(
    FloristInformation value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(
          FloristInformationForm(value, FormGroup({}), null)
              .formElements()
              .rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  @override
  void resetValue(
    FloristInformation value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: FloristInformationForm(value, FormGroup({}), null)
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
        floristNameControlName: FormControl<String>(
            value: floristInformation?.floristName,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        contactPersonControlName: FormControl<String>(
            value: floristInformation?.contactPerson,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        emailControlName: FormControl<String>(
            value: floristInformation?.email,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        addressControlName: FormControl<String>(
            value: floristInformation?.address,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        latitudeControlName: FormControl<double>(
            value: floristInformation?.latitude,
            validators: [
              (control) => requiredValidator(control as FormControl<double>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        longitudeControlName: FormControl<double>(
            value: floristInformation?.longitude,
            validators: [
              (control) => requiredValidator(control as FormControl<double>)
            ],
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

class ReactiveFloristInformationFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveFloristInformationFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(FloristInformationForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      FloristInformationForm formModel)? builder;

  final Widget Function(BuildContext context, int i, T? item,
      FloristInformationForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveFloristInformationForm.of(context);

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

class ReactiveFloristInformationFormFormGroupArrayBuilder<V>
    extends StatelessWidget {
  const ReactiveFloristInformationFormFormGroupArrayBuilder({
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
      FloristInformationForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      FloristInformationForm formModel)? builder;

  final Widget Function(BuildContext context, int i, V? item,
      FloristInformationForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveFloristInformationForm.of(context);

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
