// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent()';
}


}

/// @nodoc
class $RegisterEventCopyWith<$Res>  {
$RegisterEventCopyWith(RegisterEvent _, $Res Function(RegisterEvent) __);
}


/// Adds pattern-matching-related methods to [RegisterEvent].
extension RegisterEventPatterns on RegisterEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _DeliveryAgentRegistering value)?  deliveryAgentRegistering,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _DeliveryAgentRegistering() when deliveryAgentRegistering != null:
return deliveryAgentRegistering(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _DeliveryAgentRegistering value)  deliveryAgentRegistering,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _DeliveryAgentRegistering():
return deliveryAgentRegistering(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _DeliveryAgentRegistering value)?  deliveryAgentRegistering,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _DeliveryAgentRegistering() when deliveryAgentRegistering != null:
return deliveryAgentRegistering(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( DeliveryAgentRegisterData deliveryAgentRegisterData)?  deliveryAgentRegistering,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _DeliveryAgentRegistering() when deliveryAgentRegistering != null:
return deliveryAgentRegistering(_that.deliveryAgentRegisterData);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( DeliveryAgentRegisterData deliveryAgentRegisterData)  deliveryAgentRegistering,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _DeliveryAgentRegistering():
return deliveryAgentRegistering(_that.deliveryAgentRegisterData);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( DeliveryAgentRegisterData deliveryAgentRegisterData)?  deliveryAgentRegistering,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _DeliveryAgentRegistering() when deliveryAgentRegistering != null:
return deliveryAgentRegistering(_that.deliveryAgentRegisterData);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements RegisterEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.started()';
}


}




/// @nodoc


class _DeliveryAgentRegistering implements RegisterEvent {
  const _DeliveryAgentRegistering(this.deliveryAgentRegisterData);
  

 final  DeliveryAgentRegisterData deliveryAgentRegisterData;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryAgentRegisteringCopyWith<_DeliveryAgentRegistering> get copyWith => __$DeliveryAgentRegisteringCopyWithImpl<_DeliveryAgentRegistering>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryAgentRegistering&&(identical(other.deliveryAgentRegisterData, deliveryAgentRegisterData) || other.deliveryAgentRegisterData == deliveryAgentRegisterData));
}


@override
int get hashCode => Object.hash(runtimeType,deliveryAgentRegisterData);

@override
String toString() {
  return 'RegisterEvent.deliveryAgentRegistering(deliveryAgentRegisterData: $deliveryAgentRegisterData)';
}


}

/// @nodoc
abstract mixin class _$DeliveryAgentRegisteringCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
  factory _$DeliveryAgentRegisteringCopyWith(_DeliveryAgentRegistering value, $Res Function(_DeliveryAgentRegistering) _then) = __$DeliveryAgentRegisteringCopyWithImpl;
@useResult
$Res call({
 DeliveryAgentRegisterData deliveryAgentRegisterData
});




}
/// @nodoc
class __$DeliveryAgentRegisteringCopyWithImpl<$Res>
    implements _$DeliveryAgentRegisteringCopyWith<$Res> {
  __$DeliveryAgentRegisteringCopyWithImpl(this._self, this._then);

  final _DeliveryAgentRegistering _self;
  final $Res Function(_DeliveryAgentRegistering) _then;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deliveryAgentRegisterData = null,}) {
  return _then(_DeliveryAgentRegistering(
null == deliveryAgentRegisterData ? _self.deliveryAgentRegisterData : deliveryAgentRegisterData // ignore: cast_nullable_to_non_nullable
as DeliveryAgentRegisterData,
  ));
}


}

/// @nodoc
mixin _$RegisterState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState()';
}


}

/// @nodoc
class $RegisterStateCopyWith<$Res>  {
$RegisterStateCopyWith(RegisterState _, $Res Function(RegisterState) __);
}


/// Adds pattern-matching-related methods to [RegisterState].
extension RegisterStatePatterns on RegisterState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RegisterInitial value)?  initial,TResult Function( RegisterLoading value)?  registerLoading,TResult Function( RegisterError value)?  registerError,TResult Function( RegisterSuccess value)?  registerSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RegisterInitial() when initial != null:
return initial(_that);case RegisterLoading() when registerLoading != null:
return registerLoading(_that);case RegisterError() when registerError != null:
return registerError(_that);case RegisterSuccess() when registerSuccess != null:
return registerSuccess(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RegisterInitial value)  initial,required TResult Function( RegisterLoading value)  registerLoading,required TResult Function( RegisterError value)  registerError,required TResult Function( RegisterSuccess value)  registerSuccess,}){
final _that = this;
switch (_that) {
case RegisterInitial():
return initial(_that);case RegisterLoading():
return registerLoading(_that);case RegisterError():
return registerError(_that);case RegisterSuccess():
return registerSuccess(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RegisterInitial value)?  initial,TResult? Function( RegisterLoading value)?  registerLoading,TResult? Function( RegisterError value)?  registerError,TResult? Function( RegisterSuccess value)?  registerSuccess,}){
final _that = this;
switch (_that) {
case RegisterInitial() when initial != null:
return initial(_that);case RegisterLoading() when registerLoading != null:
return registerLoading(_that);case RegisterError() when registerError != null:
return registerError(_that);case RegisterSuccess() when registerSuccess != null:
return registerSuccess(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  registerLoading,TResult Function( String errorMessage)?  registerError,TResult Function( DeliveryRegistrationResponseModel response)?  registerSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RegisterInitial() when initial != null:
return initial();case RegisterLoading() when registerLoading != null:
return registerLoading();case RegisterError() when registerError != null:
return registerError(_that.errorMessage);case RegisterSuccess() when registerSuccess != null:
return registerSuccess(_that.response);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  registerLoading,required TResult Function( String errorMessage)  registerError,required TResult Function( DeliveryRegistrationResponseModel response)  registerSuccess,}) {final _that = this;
switch (_that) {
case RegisterInitial():
return initial();case RegisterLoading():
return registerLoading();case RegisterError():
return registerError(_that.errorMessage);case RegisterSuccess():
return registerSuccess(_that.response);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  registerLoading,TResult? Function( String errorMessage)?  registerError,TResult? Function( DeliveryRegistrationResponseModel response)?  registerSuccess,}) {final _that = this;
switch (_that) {
case RegisterInitial() when initial != null:
return initial();case RegisterLoading() when registerLoading != null:
return registerLoading();case RegisterError() when registerError != null:
return registerError(_that.errorMessage);case RegisterSuccess() when registerSuccess != null:
return registerSuccess(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class RegisterInitial implements RegisterState {
  const RegisterInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState.initial()';
}


}




/// @nodoc


class RegisterLoading implements RegisterState {
  const RegisterLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState.registerLoading()';
}


}




/// @nodoc


class RegisterError implements RegisterState {
  const RegisterError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterErrorCopyWith<RegisterError> get copyWith => _$RegisterErrorCopyWithImpl<RegisterError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'RegisterState.registerError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $RegisterErrorCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory $RegisterErrorCopyWith(RegisterError value, $Res Function(RegisterError) _then) = _$RegisterErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$RegisterErrorCopyWithImpl<$Res>
    implements $RegisterErrorCopyWith<$Res> {
  _$RegisterErrorCopyWithImpl(this._self, this._then);

  final RegisterError _self;
  final $Res Function(RegisterError) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(RegisterError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RegisterSuccess implements RegisterState {
  const RegisterSuccess(this.response);
  

 final  DeliveryRegistrationResponseModel response;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterSuccessCopyWith<RegisterSuccess> get copyWith => _$RegisterSuccessCopyWithImpl<RegisterSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'RegisterState.registerSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $RegisterSuccessCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory $RegisterSuccessCopyWith(RegisterSuccess value, $Res Function(RegisterSuccess) _then) = _$RegisterSuccessCopyWithImpl;
@useResult
$Res call({
 DeliveryRegistrationResponseModel response
});




}
/// @nodoc
class _$RegisterSuccessCopyWithImpl<$Res>
    implements $RegisterSuccessCopyWith<$Res> {
  _$RegisterSuccessCopyWithImpl(this._self, this._then);

  final RegisterSuccess _self;
  final $Res Function(RegisterSuccess) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(RegisterSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as DeliveryRegistrationResponseModel,
  ));
}


}

// dart format on
