// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_agent_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeliveryAgentProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryAgentProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryAgentProfileState()';
}


}

/// @nodoc
class $DeliveryAgentProfileStateCopyWith<$Res>  {
$DeliveryAgentProfileStateCopyWith(DeliveryAgentProfileState _, $Res Function(DeliveryAgentProfileState) __);
}


/// Adds pattern-matching-related methods to [DeliveryAgentProfileState].
extension DeliveryAgentProfileStatePatterns on DeliveryAgentProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeliveryAgentProfileInitial value)?  initial,TResult Function( DeliveryAgentProfileLoading value)?  deliveryAgentProfileLoading,TResult Function( DeliveryAgentProfileError value)?  deliveryAgentProfileError,TResult Function( DeliveryAgentProfileSuccess value)?  deliveryAgentProfileSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeliveryAgentProfileInitial() when initial != null:
return initial(_that);case DeliveryAgentProfileLoading() when deliveryAgentProfileLoading != null:
return deliveryAgentProfileLoading(_that);case DeliveryAgentProfileError() when deliveryAgentProfileError != null:
return deliveryAgentProfileError(_that);case DeliveryAgentProfileSuccess() when deliveryAgentProfileSuccess != null:
return deliveryAgentProfileSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeliveryAgentProfileInitial value)  initial,required TResult Function( DeliveryAgentProfileLoading value)  deliveryAgentProfileLoading,required TResult Function( DeliveryAgentProfileError value)  deliveryAgentProfileError,required TResult Function( DeliveryAgentProfileSuccess value)  deliveryAgentProfileSuccess,}){
final _that = this;
switch (_that) {
case DeliveryAgentProfileInitial():
return initial(_that);case DeliveryAgentProfileLoading():
return deliveryAgentProfileLoading(_that);case DeliveryAgentProfileError():
return deliveryAgentProfileError(_that);case DeliveryAgentProfileSuccess():
return deliveryAgentProfileSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeliveryAgentProfileInitial value)?  initial,TResult? Function( DeliveryAgentProfileLoading value)?  deliveryAgentProfileLoading,TResult? Function( DeliveryAgentProfileError value)?  deliveryAgentProfileError,TResult? Function( DeliveryAgentProfileSuccess value)?  deliveryAgentProfileSuccess,}){
final _that = this;
switch (_that) {
case DeliveryAgentProfileInitial() when initial != null:
return initial(_that);case DeliveryAgentProfileLoading() when deliveryAgentProfileLoading != null:
return deliveryAgentProfileLoading(_that);case DeliveryAgentProfileError() when deliveryAgentProfileError != null:
return deliveryAgentProfileError(_that);case DeliveryAgentProfileSuccess() when deliveryAgentProfileSuccess != null:
return deliveryAgentProfileSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  deliveryAgentProfileLoading,TResult Function( String errorMessage)?  deliveryAgentProfileError,TResult Function( DeliveryAgentProfileModel agentProfileData)?  deliveryAgentProfileSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeliveryAgentProfileInitial() when initial != null:
return initial();case DeliveryAgentProfileLoading() when deliveryAgentProfileLoading != null:
return deliveryAgentProfileLoading();case DeliveryAgentProfileError() when deliveryAgentProfileError != null:
return deliveryAgentProfileError(_that.errorMessage);case DeliveryAgentProfileSuccess() when deliveryAgentProfileSuccess != null:
return deliveryAgentProfileSuccess(_that.agentProfileData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  deliveryAgentProfileLoading,required TResult Function( String errorMessage)  deliveryAgentProfileError,required TResult Function( DeliveryAgentProfileModel agentProfileData)  deliveryAgentProfileSuccess,}) {final _that = this;
switch (_that) {
case DeliveryAgentProfileInitial():
return initial();case DeliveryAgentProfileLoading():
return deliveryAgentProfileLoading();case DeliveryAgentProfileError():
return deliveryAgentProfileError(_that.errorMessage);case DeliveryAgentProfileSuccess():
return deliveryAgentProfileSuccess(_that.agentProfileData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  deliveryAgentProfileLoading,TResult? Function( String errorMessage)?  deliveryAgentProfileError,TResult? Function( DeliveryAgentProfileModel agentProfileData)?  deliveryAgentProfileSuccess,}) {final _that = this;
switch (_that) {
case DeliveryAgentProfileInitial() when initial != null:
return initial();case DeliveryAgentProfileLoading() when deliveryAgentProfileLoading != null:
return deliveryAgentProfileLoading();case DeliveryAgentProfileError() when deliveryAgentProfileError != null:
return deliveryAgentProfileError(_that.errorMessage);case DeliveryAgentProfileSuccess() when deliveryAgentProfileSuccess != null:
return deliveryAgentProfileSuccess(_that.agentProfileData);case _:
  return null;

}
}

}

/// @nodoc


class DeliveryAgentProfileInitial implements DeliveryAgentProfileState {
  const DeliveryAgentProfileInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryAgentProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryAgentProfileState.initial()';
}


}




/// @nodoc


class DeliveryAgentProfileLoading implements DeliveryAgentProfileState {
  const DeliveryAgentProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryAgentProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryAgentProfileState.deliveryAgentProfileLoading()';
}


}




/// @nodoc


class DeliveryAgentProfileError implements DeliveryAgentProfileState {
  const DeliveryAgentProfileError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of DeliveryAgentProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryAgentProfileErrorCopyWith<DeliveryAgentProfileError> get copyWith => _$DeliveryAgentProfileErrorCopyWithImpl<DeliveryAgentProfileError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryAgentProfileError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'DeliveryAgentProfileState.deliveryAgentProfileError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $DeliveryAgentProfileErrorCopyWith<$Res> implements $DeliveryAgentProfileStateCopyWith<$Res> {
  factory $DeliveryAgentProfileErrorCopyWith(DeliveryAgentProfileError value, $Res Function(DeliveryAgentProfileError) _then) = _$DeliveryAgentProfileErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$DeliveryAgentProfileErrorCopyWithImpl<$Res>
    implements $DeliveryAgentProfileErrorCopyWith<$Res> {
  _$DeliveryAgentProfileErrorCopyWithImpl(this._self, this._then);

  final DeliveryAgentProfileError _self;
  final $Res Function(DeliveryAgentProfileError) _then;

/// Create a copy of DeliveryAgentProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(DeliveryAgentProfileError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeliveryAgentProfileSuccess implements DeliveryAgentProfileState {
  const DeliveryAgentProfileSuccess(this.agentProfileData);
  

 final  DeliveryAgentProfileModel agentProfileData;

/// Create a copy of DeliveryAgentProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryAgentProfileSuccessCopyWith<DeliveryAgentProfileSuccess> get copyWith => _$DeliveryAgentProfileSuccessCopyWithImpl<DeliveryAgentProfileSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryAgentProfileSuccess&&(identical(other.agentProfileData, agentProfileData) || other.agentProfileData == agentProfileData));
}


@override
int get hashCode => Object.hash(runtimeType,agentProfileData);

@override
String toString() {
  return 'DeliveryAgentProfileState.deliveryAgentProfileSuccess(agentProfileData: $agentProfileData)';
}


}

/// @nodoc
abstract mixin class $DeliveryAgentProfileSuccessCopyWith<$Res> implements $DeliveryAgentProfileStateCopyWith<$Res> {
  factory $DeliveryAgentProfileSuccessCopyWith(DeliveryAgentProfileSuccess value, $Res Function(DeliveryAgentProfileSuccess) _then) = _$DeliveryAgentProfileSuccessCopyWithImpl;
@useResult
$Res call({
 DeliveryAgentProfileModel agentProfileData
});




}
/// @nodoc
class _$DeliveryAgentProfileSuccessCopyWithImpl<$Res>
    implements $DeliveryAgentProfileSuccessCopyWith<$Res> {
  _$DeliveryAgentProfileSuccessCopyWithImpl(this._self, this._then);

  final DeliveryAgentProfileSuccess _self;
  final $Res Function(DeliveryAgentProfileSuccess) _then;

/// Create a copy of DeliveryAgentProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? agentProfileData = null,}) {
  return _then(DeliveryAgentProfileSuccess(
null == agentProfileData ? _self.agentProfileData : agentProfileData // ignore: cast_nullable_to_non_nullable
as DeliveryAgentProfileModel,
  ));
}


}

// dart format on
