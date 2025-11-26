// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent()';
}


}

/// @nodoc
class $LoginEventCopyWith<$Res>  {
$LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}


/// Adds pattern-matching-related methods to [LoginEvent].
extension LoginEventPatterns on LoginEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _AgentLoggingIn value)?  agentLoggingIn,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AgentLoggingIn() when agentLoggingIn != null:
return agentLoggingIn(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _AgentLoggingIn value)  agentLoggingIn,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _AgentLoggingIn():
return agentLoggingIn(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _AgentLoggingIn value)?  agentLoggingIn,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AgentLoggingIn() when agentLoggingIn != null:
return agentLoggingIn(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String email,  String password)?  agentLoggingIn,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AgentLoggingIn() when agentLoggingIn != null:
return agentLoggingIn(_that.email,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String email,  String password)  agentLoggingIn,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _AgentLoggingIn():
return agentLoggingIn(_that.email,_that.password);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String email,  String password)?  agentLoggingIn,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AgentLoggingIn() when agentLoggingIn != null:
return agentLoggingIn(_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements LoginEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.started()';
}


}




/// @nodoc


class _AgentLoggingIn implements LoginEvent {
  const _AgentLoggingIn(this.email, this.password);
  

 final  String email;
 final  String password;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgentLoggingInCopyWith<_AgentLoggingIn> get copyWith => __$AgentLoggingInCopyWithImpl<_AgentLoggingIn>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgentLoggingIn&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginEvent.agentLoggingIn(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$AgentLoggingInCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory _$AgentLoggingInCopyWith(_AgentLoggingIn value, $Res Function(_AgentLoggingIn) _then) = __$AgentLoggingInCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$AgentLoggingInCopyWithImpl<$Res>
    implements _$AgentLoggingInCopyWith<$Res> {
  __$AgentLoggingInCopyWithImpl(this._self, this._then);

  final _AgentLoggingIn _self;
  final $Res Function(_AgentLoggingIn) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_AgentLoggingIn(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$LoginState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState()';
}


}

/// @nodoc
class $LoginStateCopyWith<$Res>  {
$LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginInitial value)?  initial,TResult Function( LoginLoading value)?  loginLoading,TResult Function( LoginError value)?  loginError,TResult Function( LoginSuccess value)?  loginSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial(_that);case LoginLoading() when loginLoading != null:
return loginLoading(_that);case LoginError() when loginError != null:
return loginError(_that);case LoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginInitial value)  initial,required TResult Function( LoginLoading value)  loginLoading,required TResult Function( LoginError value)  loginError,required TResult Function( LoginSuccess value)  loginSuccess,}){
final _that = this;
switch (_that) {
case LoginInitial():
return initial(_that);case LoginLoading():
return loginLoading(_that);case LoginError():
return loginError(_that);case LoginSuccess():
return loginSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginInitial value)?  initial,TResult? Function( LoginLoading value)?  loginLoading,TResult? Function( LoginError value)?  loginError,TResult? Function( LoginSuccess value)?  loginSuccess,}){
final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial(_that);case LoginLoading() when loginLoading != null:
return loginLoading(_that);case LoginError() when loginError != null:
return loginError(_that);case LoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loginLoading,TResult Function( String errorMessage)?  loginError,TResult Function( DeliveryAgentLoginResponseModel response)?  loginSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial();case LoginLoading() when loginLoading != null:
return loginLoading();case LoginError() when loginError != null:
return loginError(_that.errorMessage);case LoginSuccess() when loginSuccess != null:
return loginSuccess(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loginLoading,required TResult Function( String errorMessage)  loginError,required TResult Function( DeliveryAgentLoginResponseModel response)  loginSuccess,}) {final _that = this;
switch (_that) {
case LoginInitial():
return initial();case LoginLoading():
return loginLoading();case LoginError():
return loginError(_that.errorMessage);case LoginSuccess():
return loginSuccess(_that.response);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loginLoading,TResult? Function( String errorMessage)?  loginError,TResult? Function( DeliveryAgentLoginResponseModel response)?  loginSuccess,}) {final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial();case LoginLoading() when loginLoading != null:
return loginLoading();case LoginError() when loginError != null:
return loginError(_that.errorMessage);case LoginSuccess() when loginSuccess != null:
return loginSuccess(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class LoginInitial implements LoginState {
  const LoginInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.initial()';
}


}




/// @nodoc


class LoginLoading implements LoginState {
  const LoginLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.loginLoading()';
}


}




/// @nodoc


class LoginError implements LoginState {
  const LoginError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginErrorCopyWith<LoginError> get copyWith => _$LoginErrorCopyWithImpl<LoginError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'LoginState.loginError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $LoginErrorCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginErrorCopyWith(LoginError value, $Res Function(LoginError) _then) = _$LoginErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$LoginErrorCopyWithImpl<$Res>
    implements $LoginErrorCopyWith<$Res> {
  _$LoginErrorCopyWithImpl(this._self, this._then);

  final LoginError _self;
  final $Res Function(LoginError) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(LoginError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoginSuccess implements LoginState {
  const LoginSuccess(this.response);
  

 final  DeliveryAgentLoginResponseModel response;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginSuccessCopyWith<LoginSuccess> get copyWith => _$LoginSuccessCopyWithImpl<LoginSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'LoginState.loginSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $LoginSuccessCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginSuccessCopyWith(LoginSuccess value, $Res Function(LoginSuccess) _then) = _$LoginSuccessCopyWithImpl;
@useResult
$Res call({
 DeliveryAgentLoginResponseModel response
});




}
/// @nodoc
class _$LoginSuccessCopyWithImpl<$Res>
    implements $LoginSuccessCopyWith<$Res> {
  _$LoginSuccessCopyWithImpl(this._self, this._then);

  final LoginSuccess _self;
  final $Res Function(LoginSuccess) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(LoginSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as DeliveryAgentLoginResponseModel,
  ));
}


}

// dart format on
