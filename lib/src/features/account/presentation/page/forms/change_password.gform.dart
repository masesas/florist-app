// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'change_password.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveChangePasswordFormConsumer extends StatelessWidget {
  const ReactiveChangePasswordFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
          BuildContext context, ChangePasswordForm formModel, Widget? child)
      builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveChangePasswordForm.of(context);

    if (formModel is! ChangePasswordForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class ChangePasswordFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const ChangePasswordFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final ChangePasswordForm form;
}

class ReactiveChangePasswordForm extends StatelessWidget {
  const ReactiveChangePasswordForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final ChangePasswordForm form;

  final WillPopCallback? onWillPop;

  static ChangePasswordForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              ChangePasswordFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        ChangePasswordFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as ChangePasswordFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return ChangePasswordFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class ChangePasswordFormBuilder extends StatefulWidget {
  const ChangePasswordFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final ChangePassword? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
          BuildContext context, ChangePasswordForm formModel, Widget? child)
      builder;

  final void Function(BuildContext context, ChangePasswordForm formModel)?
      initState;

  @override
  _ChangePasswordFormBuilderState createState() =>
      _ChangePasswordFormBuilderState();
}

class _ChangePasswordFormBuilderState extends State<ChangePasswordFormBuilder> {
  late FormGroup _form;

  late ChangePasswordForm _formModel;

  @override
  void initState() {
    _form = FormGroup({});
    _formModel = ChangePasswordForm(widget.model, _form, null);

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
  void didUpdateWidget(covariant ChangePasswordFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel = ChangePasswordForm(widget.model, _form, null);
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
    return ReactiveChangePasswordForm(
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

class ChangePasswordForm implements FormModel<ChangePassword> {
  ChangePasswordForm(
    this.changePassword,
    this.form,
    this.path,
  ) {}

  static String newPasswordControlName = "newPassword";

  static String confirmPasswordControlName = "confirmPassword";

  final ChangePassword? changePassword;

  final FormGroup form;

  final String? path;

  String newPasswordControlPath() => pathBuilder(newPasswordControlName);
  String confirmPasswordControlPath() =>
      pathBuilder(confirmPasswordControlName);
  String get _newPasswordValue => newPasswordControl.value ?? "";
  String get _confirmPasswordValue => confirmPasswordControl.value ?? "";
  bool get containsNewPassword {
    try {
      form.control(newPasswordControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsConfirmPassword {
    try {
      form.control(confirmPasswordControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get newPasswordErrors => newPasswordControl.errors;
  Object? get confirmPasswordErrors => confirmPasswordControl.errors;
  void get newPasswordFocus => form.focus(newPasswordControlPath());
  void get confirmPasswordFocus => form.focus(confirmPasswordControlPath());
  void newPasswordValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    newPasswordControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void confirmPasswordValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    confirmPasswordControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void newPasswordValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    newPasswordControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void confirmPasswordValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    confirmPasswordControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void newPasswordValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      newPasswordControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void confirmPasswordValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      confirmPasswordControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String> get newPasswordControl =>
      form.control(newPasswordControlPath()) as FormControl<String>;
  FormControl<String> get confirmPasswordControl =>
      form.control(confirmPasswordControlPath()) as FormControl<String>;
  void newPasswordSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      newPasswordControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      newPasswordControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void confirmPasswordSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      confirmPasswordControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      confirmPasswordControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  ChangePassword get model {
    if (!form.valid) {
      debugPrint(
        'Prefer not to call `model` on non-valid form it could cause unexpected exceptions in case you created a non-nullable field in model and expect it to be guarded by some kind of `required` validator.',
      );
    }
    return ChangePassword(
        newPassword: _newPasswordValue, confirmPassword: _confirmPasswordValue);
  }

  ChangePasswordForm copyWithPath(String? path) {
    return ChangePasswordForm(changePassword, form, path);
  }

  @override
  void updateValue(
    ChangePassword value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(
          ChangePasswordForm(value, FormGroup({}), null)
              .formElements()
              .rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  @override
  void resetValue(
    ChangePassword value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: ChangePasswordForm(value, FormGroup({}), null)
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
        newPasswordControlName: FormControl<String>(
            value: changePassword?.newPassword,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        confirmPasswordControlName: FormControl<String>(
            value: changePassword?.confirmPassword,
            validators: [
              (control) => requiredValidator(control as FormControl<String>)
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

class ReactiveChangePasswordFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveChangePasswordFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(ChangePasswordForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      ChangePasswordForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, ChangePasswordForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveChangePasswordForm.of(context);

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

class ReactiveChangePasswordFormFormGroupArrayBuilder<V>
    extends StatelessWidget {
  const ReactiveChangePasswordFormFormGroupArrayBuilder({
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
      ChangePasswordForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      ChangePasswordForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, V? item, ChangePasswordForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveChangePasswordForm.of(context);

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
