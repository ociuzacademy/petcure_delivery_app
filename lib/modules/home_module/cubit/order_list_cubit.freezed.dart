// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderListState()';
}


}

/// @nodoc
class $OrderListStateCopyWith<$Res>  {
$OrderListStateCopyWith(OrderListState _, $Res Function(OrderListState) __);
}


/// Adds pattern-matching-related methods to [OrderListState].
extension OrderListStatePatterns on OrderListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OrderListInitial value)?  initial,TResult Function( OrderListLoading value)?  orderListLoading,TResult Function( OrderListError value)?  orderListError,TResult Function( OrderListSuccess value)?  orderListSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OrderListInitial() when initial != null:
return initial(_that);case OrderListLoading() when orderListLoading != null:
return orderListLoading(_that);case OrderListError() when orderListError != null:
return orderListError(_that);case OrderListSuccess() when orderListSuccess != null:
return orderListSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OrderListInitial value)  initial,required TResult Function( OrderListLoading value)  orderListLoading,required TResult Function( OrderListError value)  orderListError,required TResult Function( OrderListSuccess value)  orderListSuccess,}){
final _that = this;
switch (_that) {
case OrderListInitial():
return initial(_that);case OrderListLoading():
return orderListLoading(_that);case OrderListError():
return orderListError(_that);case OrderListSuccess():
return orderListSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OrderListInitial value)?  initial,TResult? Function( OrderListLoading value)?  orderListLoading,TResult? Function( OrderListError value)?  orderListError,TResult? Function( OrderListSuccess value)?  orderListSuccess,}){
final _that = this;
switch (_that) {
case OrderListInitial() when initial != null:
return initial(_that);case OrderListLoading() when orderListLoading != null:
return orderListLoading(_that);case OrderListError() when orderListError != null:
return orderListError(_that);case OrderListSuccess() when orderListSuccess != null:
return orderListSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  orderListLoading,TResult Function( String errorMessage)?  orderListError,TResult Function( DeliveryOrderListModel orderListData)?  orderListSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OrderListInitial() when initial != null:
return initial();case OrderListLoading() when orderListLoading != null:
return orderListLoading();case OrderListError() when orderListError != null:
return orderListError(_that.errorMessage);case OrderListSuccess() when orderListSuccess != null:
return orderListSuccess(_that.orderListData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  orderListLoading,required TResult Function( String errorMessage)  orderListError,required TResult Function( DeliveryOrderListModel orderListData)  orderListSuccess,}) {final _that = this;
switch (_that) {
case OrderListInitial():
return initial();case OrderListLoading():
return orderListLoading();case OrderListError():
return orderListError(_that.errorMessage);case OrderListSuccess():
return orderListSuccess(_that.orderListData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  orderListLoading,TResult? Function( String errorMessage)?  orderListError,TResult? Function( DeliveryOrderListModel orderListData)?  orderListSuccess,}) {final _that = this;
switch (_that) {
case OrderListInitial() when initial != null:
return initial();case OrderListLoading() when orderListLoading != null:
return orderListLoading();case OrderListError() when orderListError != null:
return orderListError(_that.errorMessage);case OrderListSuccess() when orderListSuccess != null:
return orderListSuccess(_that.orderListData);case _:
  return null;

}
}

}

/// @nodoc


class OrderListInitial implements OrderListState {
  const OrderListInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderListInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderListState.initial()';
}


}




/// @nodoc


class OrderListLoading implements OrderListState {
  const OrderListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderListState.orderListLoading()';
}


}




/// @nodoc


class OrderListError implements OrderListState {
  const OrderListError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of OrderListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderListErrorCopyWith<OrderListError> get copyWith => _$OrderListErrorCopyWithImpl<OrderListError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderListError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'OrderListState.orderListError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $OrderListErrorCopyWith<$Res> implements $OrderListStateCopyWith<$Res> {
  factory $OrderListErrorCopyWith(OrderListError value, $Res Function(OrderListError) _then) = _$OrderListErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$OrderListErrorCopyWithImpl<$Res>
    implements $OrderListErrorCopyWith<$Res> {
  _$OrderListErrorCopyWithImpl(this._self, this._then);

  final OrderListError _self;
  final $Res Function(OrderListError) _then;

/// Create a copy of OrderListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(OrderListError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OrderListSuccess implements OrderListState {
  const OrderListSuccess(this.orderListData);
  

 final  DeliveryOrderListModel orderListData;

/// Create a copy of OrderListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderListSuccessCopyWith<OrderListSuccess> get copyWith => _$OrderListSuccessCopyWithImpl<OrderListSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderListSuccess&&(identical(other.orderListData, orderListData) || other.orderListData == orderListData));
}


@override
int get hashCode => Object.hash(runtimeType,orderListData);

@override
String toString() {
  return 'OrderListState.orderListSuccess(orderListData: $orderListData)';
}


}

/// @nodoc
abstract mixin class $OrderListSuccessCopyWith<$Res> implements $OrderListStateCopyWith<$Res> {
  factory $OrderListSuccessCopyWith(OrderListSuccess value, $Res Function(OrderListSuccess) _then) = _$OrderListSuccessCopyWithImpl;
@useResult
$Res call({
 DeliveryOrderListModel orderListData
});




}
/// @nodoc
class _$OrderListSuccessCopyWithImpl<$Res>
    implements $OrderListSuccessCopyWith<$Res> {
  _$OrderListSuccessCopyWithImpl(this._self, this._then);

  final OrderListSuccess _self;
  final $Res Function(OrderListSuccess) _then;

/// Create a copy of OrderListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderListData = null,}) {
  return _then(OrderListSuccess(
null == orderListData ? _self.orderListData : orderListData // ignore: cast_nullable_to_non_nullable
as DeliveryOrderListModel,
  ));
}


}

// dart format on
