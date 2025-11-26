// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileEvent()';
}


}

/// @nodoc
class $UpdateProfileEventCopyWith<$Res>  {
$UpdateProfileEventCopyWith(UpdateProfileEvent _, $Res Function(UpdateProfileEvent) __);
}


/// Adds pattern-matching-related methods to [UpdateProfileEvent].
extension UpdateProfileEventPatterns on UpdateProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _UpdatingDeliveryAgentProfile value)?  updatingDeliveryAgentProfile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UpdatingDeliveryAgentProfile() when updatingDeliveryAgentProfile != null:
return updatingDeliveryAgentProfile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _UpdatingDeliveryAgentProfile value)  updatingDeliveryAgentProfile,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _UpdatingDeliveryAgentProfile():
return updatingDeliveryAgentProfile(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _UpdatingDeliveryAgentProfile value)?  updatingDeliveryAgentProfile,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UpdatingDeliveryAgentProfile() when updatingDeliveryAgentProfile != null:
return updatingDeliveryAgentProfile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( UpdateAgentProfileData updatedProfileData)?  updatingDeliveryAgentProfile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UpdatingDeliveryAgentProfile() when updatingDeliveryAgentProfile != null:
return updatingDeliveryAgentProfile(_that.updatedProfileData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( UpdateAgentProfileData updatedProfileData)  updatingDeliveryAgentProfile,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _UpdatingDeliveryAgentProfile():
return updatingDeliveryAgentProfile(_that.updatedProfileData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( UpdateAgentProfileData updatedProfileData)?  updatingDeliveryAgentProfile,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UpdatingDeliveryAgentProfile() when updatingDeliveryAgentProfile != null:
return updatingDeliveryAgentProfile(_that.updatedProfileData);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements UpdateProfileEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileEvent.started()';
}


}




/// @nodoc


class _UpdatingDeliveryAgentProfile implements UpdateProfileEvent {
  const _UpdatingDeliveryAgentProfile(this.updatedProfileData);
  

 final  UpdateAgentProfileData updatedProfileData;

/// Create a copy of UpdateProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatingDeliveryAgentProfileCopyWith<_UpdatingDeliveryAgentProfile> get copyWith => __$UpdatingDeliveryAgentProfileCopyWithImpl<_UpdatingDeliveryAgentProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatingDeliveryAgentProfile&&(identical(other.updatedProfileData, updatedProfileData) || other.updatedProfileData == updatedProfileData));
}


@override
int get hashCode => Object.hash(runtimeType,updatedProfileData);

@override
String toString() {
  return 'UpdateProfileEvent.updatingDeliveryAgentProfile(updatedProfileData: $updatedProfileData)';
}


}

/// @nodoc
abstract mixin class _$UpdatingDeliveryAgentProfileCopyWith<$Res> implements $UpdateProfileEventCopyWith<$Res> {
  factory _$UpdatingDeliveryAgentProfileCopyWith(_UpdatingDeliveryAgentProfile value, $Res Function(_UpdatingDeliveryAgentProfile) _then) = __$UpdatingDeliveryAgentProfileCopyWithImpl;
@useResult
$Res call({
 UpdateAgentProfileData updatedProfileData
});




}
/// @nodoc
class __$UpdatingDeliveryAgentProfileCopyWithImpl<$Res>
    implements _$UpdatingDeliveryAgentProfileCopyWith<$Res> {
  __$UpdatingDeliveryAgentProfileCopyWithImpl(this._self, this._then);

  final _UpdatingDeliveryAgentProfile _self;
  final $Res Function(_UpdatingDeliveryAgentProfile) _then;

/// Create a copy of UpdateProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? updatedProfileData = null,}) {
  return _then(_UpdatingDeliveryAgentProfile(
null == updatedProfileData ? _self.updatedProfileData : updatedProfileData // ignore: cast_nullable_to_non_nullable
as UpdateAgentProfileData,
  ));
}


}

/// @nodoc
mixin _$UpdateProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileState()';
}


}

/// @nodoc
class $UpdateProfileStateCopyWith<$Res>  {
$UpdateProfileStateCopyWith(UpdateProfileState _, $Res Function(UpdateProfileState) __);
}


/// Adds pattern-matching-related methods to [UpdateProfileState].
extension UpdateProfileStatePatterns on UpdateProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UpdateProfileInitial value)?  initial,TResult Function( UpdateProfileLoading value)?  updateProfileLoading,TResult Function( UpdateProfileError value)?  updateProfileError,TResult Function( UpdateProfileSuccess value)?  updateProfileSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UpdateProfileInitial() when initial != null:
return initial(_that);case UpdateProfileLoading() when updateProfileLoading != null:
return updateProfileLoading(_that);case UpdateProfileError() when updateProfileError != null:
return updateProfileError(_that);case UpdateProfileSuccess() when updateProfileSuccess != null:
return updateProfileSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UpdateProfileInitial value)  initial,required TResult Function( UpdateProfileLoading value)  updateProfileLoading,required TResult Function( UpdateProfileError value)  updateProfileError,required TResult Function( UpdateProfileSuccess value)  updateProfileSuccess,}){
final _that = this;
switch (_that) {
case UpdateProfileInitial():
return initial(_that);case UpdateProfileLoading():
return updateProfileLoading(_that);case UpdateProfileError():
return updateProfileError(_that);case UpdateProfileSuccess():
return updateProfileSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UpdateProfileInitial value)?  initial,TResult? Function( UpdateProfileLoading value)?  updateProfileLoading,TResult? Function( UpdateProfileError value)?  updateProfileError,TResult? Function( UpdateProfileSuccess value)?  updateProfileSuccess,}){
final _that = this;
switch (_that) {
case UpdateProfileInitial() when initial != null:
return initial(_that);case UpdateProfileLoading() when updateProfileLoading != null:
return updateProfileLoading(_that);case UpdateProfileError() when updateProfileError != null:
return updateProfileError(_that);case UpdateProfileSuccess() when updateProfileSuccess != null:
return updateProfileSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  updateProfileLoading,TResult Function( String errorMessage)?  updateProfileError,TResult Function( UpdateProfileResponseModel response)?  updateProfileSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UpdateProfileInitial() when initial != null:
return initial();case UpdateProfileLoading() when updateProfileLoading != null:
return updateProfileLoading();case UpdateProfileError() when updateProfileError != null:
return updateProfileError(_that.errorMessage);case UpdateProfileSuccess() when updateProfileSuccess != null:
return updateProfileSuccess(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  updateProfileLoading,required TResult Function( String errorMessage)  updateProfileError,required TResult Function( UpdateProfileResponseModel response)  updateProfileSuccess,}) {final _that = this;
switch (_that) {
case UpdateProfileInitial():
return initial();case UpdateProfileLoading():
return updateProfileLoading();case UpdateProfileError():
return updateProfileError(_that.errorMessage);case UpdateProfileSuccess():
return updateProfileSuccess(_that.response);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  updateProfileLoading,TResult? Function( String errorMessage)?  updateProfileError,TResult? Function( UpdateProfileResponseModel response)?  updateProfileSuccess,}) {final _that = this;
switch (_that) {
case UpdateProfileInitial() when initial != null:
return initial();case UpdateProfileLoading() when updateProfileLoading != null:
return updateProfileLoading();case UpdateProfileError() when updateProfileError != null:
return updateProfileError(_that.errorMessage);case UpdateProfileSuccess() when updateProfileSuccess != null:
return updateProfileSuccess(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class UpdateProfileInitial implements UpdateProfileState {
  const UpdateProfileInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileState.initial()';
}


}




/// @nodoc


class UpdateProfileLoading implements UpdateProfileState {
  const UpdateProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileState.updateProfileLoading()';
}


}




/// @nodoc


class UpdateProfileError implements UpdateProfileState {
  const UpdateProfileError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileErrorCopyWith<UpdateProfileError> get copyWith => _$UpdateProfileErrorCopyWithImpl<UpdateProfileError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'UpdateProfileState.updateProfileError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileErrorCopyWith<$Res> implements $UpdateProfileStateCopyWith<$Res> {
  factory $UpdateProfileErrorCopyWith(UpdateProfileError value, $Res Function(UpdateProfileError) _then) = _$UpdateProfileErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$UpdateProfileErrorCopyWithImpl<$Res>
    implements $UpdateProfileErrorCopyWith<$Res> {
  _$UpdateProfileErrorCopyWithImpl(this._self, this._then);

  final UpdateProfileError _self;
  final $Res Function(UpdateProfileError) _then;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(UpdateProfileError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateProfileSuccess implements UpdateProfileState {
  const UpdateProfileSuccess(this.response);
  

 final  UpdateProfileResponseModel response;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileSuccessCopyWith<UpdateProfileSuccess> get copyWith => _$UpdateProfileSuccessCopyWithImpl<UpdateProfileSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'UpdateProfileState.updateProfileSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileSuccessCopyWith<$Res> implements $UpdateProfileStateCopyWith<$Res> {
  factory $UpdateProfileSuccessCopyWith(UpdateProfileSuccess value, $Res Function(UpdateProfileSuccess) _then) = _$UpdateProfileSuccessCopyWithImpl;
@useResult
$Res call({
 UpdateProfileResponseModel response
});




}
/// @nodoc
class _$UpdateProfileSuccessCopyWithImpl<$Res>
    implements $UpdateProfileSuccessCopyWith<$Res> {
  _$UpdateProfileSuccessCopyWithImpl(this._self, this._then);

  final UpdateProfileSuccess _self;
  final $Res Function(UpdateProfileSuccess) _then;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(UpdateProfileSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as UpdateProfileResponseModel,
  ));
}


}

// dart format on
