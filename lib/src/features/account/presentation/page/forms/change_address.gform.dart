// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'change_address.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveChangeAddressFormConsumer extends StatelessWidget {
  const ReactiveChangeAddressFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, ChangeAddressForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveChangeAddressForm.of(context);

    if (formModel is! ChangeAddressForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class ChangeAddressFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const ChangeAddressFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final ChangeAddressForm form;
}

class ReactiveChangeAddressForm extends StatelessWidget {
  const ReactiveChangeAddressForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final ChangeAddressForm form;

  final WillPopCallback? onWillPop;

  static ChangeAddressForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              ChangeAddressFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        ChangeAddressFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as ChangeAddressFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeAddressFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class ChangeAddressFormBuilder extends StatefulWidget {
  const ChangeAddressFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final ChangeAddress? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
      BuildContext context, ChangeAddressForm formModel, Widget? child) builder;

  final void Function(BuildContext context, ChangeAddressForm formModel)?
      initState;

  @override
  _ChangeAddressFormBuilderState createState() =>
      _ChangeAddressFormBuilderState();
}

class _ChangeAddressFormBuilderState extends State<ChangeAddressFormBuilder> {
  late FormGroup _form;

  late ChangeAddressForm _formModel;

  @override
  void initState() {
    _form = FormGroup({});
    _formModel = ChangeAddressForm(widget.model, _form, null);

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
  void didUpdateWidget(covariant ChangeAddressFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel = ChangeAddressForm(widget.model, _form, null);
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
    return ReactiveChangeAddressForm(
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

class ChangeAddressForm implements FormModel<ChangeAddress> {
  ChangeAddressForm(
    this.changeAddress,
    this.form,
    this.path,
  ) {}

  static String addressControlName = "address";

  static String latitudeControlName = "latitude";

  static String longitudeControlName = "longitude";

  final ChangeAddress? changeAddress;

  final FormGroup form;

  final String? path;

  String addressControlPath() => pathBuilder(addressControlName);
  String latitudeControlPath() => pathBuilder(latitudeControlName);
  String longitudeControlPath() => pathBuilder(longitudeControlName);
  String? get _addressValue => addressControl?.value;
  String? get _latitudeValue => latitudeControl?.value;
  String? get _longitudeValue => longitudeControl?.value;
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

  Object? get addressErrors => addressControl?.errors;
  Object? get latitudeErrors => latitudeControl?.errors;
  Object? get longitudeErrors => longitudeControl?.errors;
  void get addressFocus => form.focus(addressControlPath());
  void get latitudeFocus => form.focus(latitudeControlPath());
  void get longitudeFocus => form.focus(longitudeControlPath());
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

  void addressValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    addressControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void latitudeValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    latitudeControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void longitudeValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    longitudeControl?.updateValue(value,
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
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    latitudeControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void longitudeValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    longitudeControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

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
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      latitudeControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void longitudeValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      longitudeControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String>? get addressControl => containsAddress
      ? form.control(addressControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get latitudeControl => containsLatitude
      ? form.control(latitudeControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get longitudeControl => containsLongitude
      ? form.control(longitudeControlPath()) as FormControl<String>?
      : null;
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
  ChangeAddress get model {
    if (!form.valid) {
      debugPrint(
        'Prefer not to call `model` on non-valid form it could cause unexpected exceptions in case you created a non-nullable field in model and expect it to be guarded by some kind of `required` validator.',
      );
    }
    return ChangeAddress(
        zipCode: changeAddress?.zipCode,
        address: _addressValue,
        latitude: _latitudeValue,
        longitude: _longitudeValue);
  }

  ChangeAddressForm copyWithPath(String? path) {
    return ChangeAddressForm(changeAddress, form, path);
  }

  @override
  void updateValue(
    ChangeAddress value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(
          ChangeAddressForm(value, FormGroup({}), null).formElements().rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  @override
  void resetValue(
    ChangeAddress value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: ChangeAddressForm(value, FormGroup({}), null)
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
        addressControlName: FormControl<String>(
            value: changeAddress?.address,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        latitudeControlName: FormControl<String>(
            value: changeAddress?.latitude,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: true,
            touched: false),
        longitudeControlName: FormControl<String>(
            value: changeAddress?.longitude,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: true,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ReactiveChangeAddressFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveChangeAddressFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(ChangeAddressForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      ChangeAddressForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, ChangeAddressForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveChangeAddressForm.of(context);

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

class ReactiveChangeAddressFormFormGroupArrayBuilder<V>
    extends StatelessWidget {
  const ReactiveChangeAddressFormFormGroupArrayBuilder({
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
      ChangeAddressForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      ChangeAddressForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, V? item, ChangeAddressForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveChangeAddressForm.of(context);

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
