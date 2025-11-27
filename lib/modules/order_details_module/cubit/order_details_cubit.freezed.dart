// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderDetailsState()';
}


}

/// @nodoc
class $OrderDetailsStateCopyWith<$Res>  {
$OrderDetailsStateCopyWith(OrderDetailsState _, $Res Function(OrderDetailsState) __);
}


/// Adds pattern-matching-related methods to [OrderDetailsState].
extension OrderDetailsStatePatterns on OrderDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OrderDetailsInitial value)?  initial,TResult Function( OrderDetailsLoading value)?  orderDetailsLoading,TResult Function( OrderDetailsSuccess value)?  orderDetailsSuccess,TResult Function( OrderDetailsError value)?  orderDetailsError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OrderDetailsInitial() when initial != null:
return initial(_that);case OrderDetailsLoading() when orderDetailsLoading != null:
return orderDetailsLoading(_that);case OrderDetailsSuccess() when orderDetailsSuccess != null:
return orderDetailsSuccess(_that);case OrderDetailsError() when orderDetailsError != null:
return orderDetailsError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OrderDetailsInitial value)  initial,required TResult Function( OrderDetailsLoading value)  orderDetailsLoading,required TResult Function( OrderDetailsSuccess value)  orderDetailsSuccess,required TResult Function( OrderDetailsError value)  orderDetailsError,}){
final _that = this;
switch (_that) {
case OrderDetailsInitial():
return initial(_that);case OrderDetailsLoading():
return orderDetailsLoading(_that);case OrderDetailsSuccess():
return orderDetailsSuccess(_that);case OrderDetailsError():
return orderDetailsError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OrderDetailsInitial value)?  initial,TResult? Function( OrderDetailsLoading value)?  orderDetailsLoading,TResult? Function( OrderDetailsSuccess value)?  orderDetailsSuccess,TResult? Function( OrderDetailsError value)?  orderDetailsError,}){
final _that = this;
switch (_that) {
case OrderDetailsInitial() when initial != null:
return initial(_that);case OrderDetailsLoading() when orderDetailsLoading != null:
return orderDetailsLoading(_that);case OrderDetailsSuccess() when orderDetailsSuccess != null:
return orderDetailsSuccess(_that);case OrderDetailsError() when orderDetailsError != null:
return orderDetailsError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  orderDetailsLoading,TResult Function( OrderDetailsModel order)?  orderDetailsSuccess,TResult Function( String errorMessage)?  orderDetailsError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OrderDetailsInitial() when initial != null:
return initial();case OrderDetailsLoading() when orderDetailsLoading != null:
return orderDetailsLoading();case OrderDetailsSuccess() when orderDetailsSuccess != null:
return orderDetailsSuccess(_that.order);case OrderDetailsError() when orderDetailsError != null:
return orderDetailsError(_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  orderDetailsLoading,required TResult Function( OrderDetailsModel order)  orderDetailsSuccess,required TResult Function( String errorMessage)  orderDetailsError,}) {final _that = this;
switch (_that) {
case OrderDetailsInitial():
return initial();case OrderDetailsLoading():
return orderDetailsLoading();case OrderDetailsSuccess():
return orderDetailsSuccess(_that.order);case OrderDetailsError():
return orderDetailsError(_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  orderDetailsLoading,TResult? Function( OrderDetailsModel order)?  orderDetailsSuccess,TResult? Function( String errorMessage)?  orderDetailsError,}) {final _that = this;
switch (_that) {
case OrderDetailsInitial() when initial != null:
return initial();case OrderDetailsLoading() when orderDetailsLoading != null:
return orderDetailsLoading();case OrderDetailsSuccess() when orderDetailsSuccess != null:
return orderDetailsSuccess(_that.order);case OrderDetailsError() when orderDetailsError != null:
return orderDetailsError(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class OrderDetailsInitial implements OrderDetailsState {
  const OrderDetailsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderDetailsState.initial()';
}


}




/// @nodoc


class OrderDetailsLoading implements OrderDetailsState {
  const OrderDetailsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderDetailsState.orderDetailsLoading()';
}


}




/// @nodoc


class OrderDetailsSuccess implements OrderDetailsState {
  const OrderDetailsSuccess(this.order);
  

 final  OrderDetailsModel order;

/// Create a copy of OrderDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailsSuccessCopyWith<OrderDetailsSuccess> get copyWith => _$OrderDetailsSuccessCopyWithImpl<OrderDetailsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailsSuccess&&(identical(other.order, order) || other.order == order));
}


@override
int get hashCode => Object.hash(runtimeType,order);

@override
String toString() {
  return 'OrderDetailsState.orderDetailsSuccess(order: $order)';
}


}

/// @nodoc
abstract mixin class $OrderDetailsSuccessCopyWith<$Res> implements $OrderDetailsStateCopyWith<$Res> {
  factory $OrderDetailsSuccessCopyWith(OrderDetailsSuccess value, $Res Function(OrderDetailsSuccess) _then) = _$OrderDetailsSuccessCopyWithImpl;
@useResult
$Res call({
 OrderDetailsModel order
});




}
/// @nodoc
class _$OrderDetailsSuccessCopyWithImpl<$Res>
    implements $OrderDetailsSuccessCopyWith<$Res> {
  _$OrderDetailsSuccessCopyWithImpl(this._self, this._then);

  final OrderDetailsSuccess _self;
  final $Res Function(OrderDetailsSuccess) _then;

/// Create a copy of OrderDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? order = null,}) {
  return _then(OrderDetailsSuccess(
null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as OrderDetailsModel,
  ));
}


}

/// @nodoc


class OrderDetailsError implements OrderDetailsState {
  const OrderDetailsError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of OrderDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailsErrorCopyWith<OrderDetailsError> get copyWith => _$OrderDetailsErrorCopyWithImpl<OrderDetailsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailsError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'OrderDetailsState.orderDetailsError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $OrderDetailsErrorCopyWith<$Res> implements $OrderDetailsStateCopyWith<$Res> {
  factory $OrderDetailsErrorCopyWith(OrderDetailsError value, $Res Function(OrderDetailsError) _then) = _$OrderDetailsErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$OrderDetailsErrorCopyWithImpl<$Res>
    implements $OrderDetailsErrorCopyWith<$Res> {
  _$OrderDetailsErrorCopyWithImpl(this._self, this._then);

  final OrderDetailsError _self;
  final $Res Function(OrderDetailsError) _then;

/// Create a copy of OrderDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(OrderDetailsError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
