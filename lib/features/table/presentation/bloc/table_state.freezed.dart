// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TableState {
  List<Court> get courts => throw _privateConstructorUsedError;
  List<Schedule> get schedule => throw _privateConstructorUsedError;
  bool get pinVerified => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        $default, {
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        initial,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        loading,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        loaded,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        $default, {
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        initial,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loading,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loaded,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        $default, {
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        initial,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loading,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loaded,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TableState value) $default, {
    required TResult Function(TableInitialState value) initial,
    required TResult Function(TableLoadingState value) loading,
    required TResult Function(TableLoadedState value) loaded,
    required TResult Function(TableErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TableState value)? $default, {
    TResult? Function(TableInitialState value)? initial,
    TResult? Function(TableLoadingState value)? loading,
    TResult? Function(TableLoadedState value)? loaded,
    TResult? Function(TableErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TableState value)? $default, {
    TResult Function(TableInitialState value)? initial,
    TResult Function(TableLoadingState value)? loading,
    TResult Function(TableLoadedState value)? loaded,
    TResult Function(TableErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TableStateCopyWith<TableState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableStateCopyWith<$Res> {
  factory $TableStateCopyWith(
          TableState value, $Res Function(TableState) then) =
      _$TableStateCopyWithImpl<$Res, TableState>;
  @useResult
  $Res call({List<Court> courts, List<Schedule> schedule, bool pinVerified});
}

/// @nodoc
class _$TableStateCopyWithImpl<$Res, $Val extends TableState>
    implements $TableStateCopyWith<$Res> {
  _$TableStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courts = null,
    Object? schedule = null,
    Object? pinVerified = null,
  }) {
    return _then(_value.copyWith(
      courts: null == courts
          ? _value.courts
          : courts // ignore: cast_nullable_to_non_nullable
              as List<Court>,
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
      pinVerified: null == pinVerified
          ? _value.pinVerified
          : pinVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TableStateImplCopyWith<$Res>
    implements $TableStateCopyWith<$Res> {
  factory _$$TableStateImplCopyWith(
          _$TableStateImpl value, $Res Function(_$TableStateImpl) then) =
      __$$TableStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Court> courts, List<Schedule> schedule, bool pinVerified});
}

/// @nodoc
class __$$TableStateImplCopyWithImpl<$Res>
    extends _$TableStateCopyWithImpl<$Res, _$TableStateImpl>
    implements _$$TableStateImplCopyWith<$Res> {
  __$$TableStateImplCopyWithImpl(
      _$TableStateImpl _value, $Res Function(_$TableStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courts = null,
    Object? schedule = null,
    Object? pinVerified = null,
  }) {
    return _then(_$TableStateImpl(
      courts: null == courts
          ? _value._courts
          : courts // ignore: cast_nullable_to_non_nullable
              as List<Court>,
      schedule: null == schedule
          ? _value._schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
      pinVerified: null == pinVerified
          ? _value.pinVerified
          : pinVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TableStateImpl extends _TableState {
  _$TableStateImpl(
      {final List<Court> courts = const [],
      final List<Schedule> schedule = const [],
      this.pinVerified = false})
      : _courts = courts,
        _schedule = schedule,
        super._();

  final List<Court> _courts;
  @override
  @JsonKey()
  List<Court> get courts {
    if (_courts is EqualUnmodifiableListView) return _courts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courts);
  }

  final List<Schedule> _schedule;
  @override
  @JsonKey()
  List<Schedule> get schedule {
    if (_schedule is EqualUnmodifiableListView) return _schedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedule);
  }

  @override
  @JsonKey()
  final bool pinVerified;

  @override
  String toString() {
    return 'TableState(courts: $courts, schedule: $schedule, pinVerified: $pinVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableStateImpl &&
            const DeepCollectionEquality().equals(other._courts, _courts) &&
            const DeepCollectionEquality().equals(other._schedule, _schedule) &&
            (identical(other.pinVerified, pinVerified) ||
                other.pinVerified == pinVerified));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_courts),
      const DeepCollectionEquality().hash(_schedule),
      pinVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TableStateImplCopyWith<_$TableStateImpl> get copyWith =>
      __$$TableStateImplCopyWithImpl<_$TableStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        $default, {
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        initial,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        loading,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        loaded,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        error,
  }) {
    return $default(courts, schedule, pinVerified);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        $default, {
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        initial,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loading,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loaded,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        error,
  }) {
    return $default?.call(courts, schedule, pinVerified);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        $default, {
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        initial,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loading,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loaded,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(courts, schedule, pinVerified);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TableState value) $default, {
    required TResult Function(TableInitialState value) initial,
    required TResult Function(TableLoadingState value) loading,
    required TResult Function(TableLoadedState value) loaded,
    required TResult Function(TableErrorState value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TableState value)? $default, {
    TResult? Function(TableInitialState value)? initial,
    TResult? Function(TableLoadingState value)? loading,
    TResult? Function(TableLoadedState value)? loaded,
    TResult? Function(TableErrorState value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TableState value)? $default, {
    TResult Function(TableInitialState value)? initial,
    TResult Function(TableLoadingState value)? loading,
    TResult Function(TableLoadedState value)? loaded,
    TResult Function(TableErrorState value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _TableState extends TableState {
  factory _TableState(
      {final List<Court> courts,
      final List<Schedule> schedule,
      final bool pinVerified}) = _$TableStateImpl;
  _TableState._() : super._();

  @override
  List<Court> get courts;
  @override
  List<Schedule> get schedule;
  @override
  bool get pinVerified;
  @override
  @JsonKey(ignore: true)
  _$$TableStateImplCopyWith<_$TableStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TableInitialStateImplCopyWith<$Res>
    implements $TableStateCopyWith<$Res> {
  factory _$$TableInitialStateImplCopyWith(_$TableInitialStateImpl value,
          $Res Function(_$TableInitialStateImpl) then) =
      __$$TableInitialStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Court> courts, List<Schedule> schedule, bool pinVerified});
}

/// @nodoc
class __$$TableInitialStateImplCopyWithImpl<$Res>
    extends _$TableStateCopyWithImpl<$Res, _$TableInitialStateImpl>
    implements _$$TableInitialStateImplCopyWith<$Res> {
  __$$TableInitialStateImplCopyWithImpl(_$TableInitialStateImpl _value,
      $Res Function(_$TableInitialStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courts = null,
    Object? schedule = null,
    Object? pinVerified = null,
  }) {
    return _then(_$TableInitialStateImpl(
      courts: null == courts
          ? _value._courts
          : courts // ignore: cast_nullable_to_non_nullable
              as List<Court>,
      schedule: null == schedule
          ? _value._schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
      pinVerified: null == pinVerified
          ? _value.pinVerified
          : pinVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TableInitialStateImpl extends TableInitialState {
  _$TableInitialStateImpl(
      {final List<Court> courts = const [],
      final List<Schedule> schedule = const [],
      this.pinVerified = false})
      : _courts = courts,
        _schedule = schedule,
        super._();

  final List<Court> _courts;
  @override
  @JsonKey()
  List<Court> get courts {
    if (_courts is EqualUnmodifiableListView) return _courts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courts);
  }

  final List<Schedule> _schedule;
  @override
  @JsonKey()
  List<Schedule> get schedule {
    if (_schedule is EqualUnmodifiableListView) return _schedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedule);
  }

  @override
  @JsonKey()
  final bool pinVerified;

  @override
  String toString() {
    return 'TableState.initial(courts: $courts, schedule: $schedule, pinVerified: $pinVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableInitialStateImpl &&
            const DeepCollectionEquality().equals(other._courts, _courts) &&
            const DeepCollectionEquality().equals(other._schedule, _schedule) &&
            (identical(other.pinVerified, pinVerified) ||
                other.pinVerified == pinVerified));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_courts),
      const DeepCollectionEquality().hash(_schedule),
      pinVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TableInitialStateImplCopyWith<_$TableInitialStateImpl> get copyWith =>
      __$$TableInitialStateImplCopyWithImpl<_$TableInitialStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        $default, {
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        initial,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        loading,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        loaded,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        error,
  }) {
    return initial(courts, schedule, pinVerified);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        $default, {
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        initial,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loading,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loaded,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        error,
  }) {
    return initial?.call(courts, schedule, pinVerified);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        $default, {
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        initial,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loading,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loaded,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(courts, schedule, pinVerified);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TableState value) $default, {
    required TResult Function(TableInitialState value) initial,
    required TResult Function(TableLoadingState value) loading,
    required TResult Function(TableLoadedState value) loaded,
    required TResult Function(TableErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TableState value)? $default, {
    TResult? Function(TableInitialState value)? initial,
    TResult? Function(TableLoadingState value)? loading,
    TResult? Function(TableLoadedState value)? loaded,
    TResult? Function(TableErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TableState value)? $default, {
    TResult Function(TableInitialState value)? initial,
    TResult Function(TableLoadingState value)? loading,
    TResult Function(TableLoadedState value)? loaded,
    TResult Function(TableErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TableInitialState extends TableState {
  factory TableInitialState(
      {final List<Court> courts,
      final List<Schedule> schedule,
      final bool pinVerified}) = _$TableInitialStateImpl;
  TableInitialState._() : super._();

  @override
  List<Court> get courts;
  @override
  List<Schedule> get schedule;
  @override
  bool get pinVerified;
  @override
  @JsonKey(ignore: true)
  _$$TableInitialStateImplCopyWith<_$TableInitialStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TableLoadingStateImplCopyWith<$Res>
    implements $TableStateCopyWith<$Res> {
  factory _$$TableLoadingStateImplCopyWith(_$TableLoadingStateImpl value,
          $Res Function(_$TableLoadingStateImpl) then) =
      __$$TableLoadingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Court> courts, List<Schedule> schedule, bool pinVerified});
}

/// @nodoc
class __$$TableLoadingStateImplCopyWithImpl<$Res>
    extends _$TableStateCopyWithImpl<$Res, _$TableLoadingStateImpl>
    implements _$$TableLoadingStateImplCopyWith<$Res> {
  __$$TableLoadingStateImplCopyWithImpl(_$TableLoadingStateImpl _value,
      $Res Function(_$TableLoadingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courts = null,
    Object? schedule = null,
    Object? pinVerified = null,
  }) {
    return _then(_$TableLoadingStateImpl(
      courts: null == courts
          ? _value._courts
          : courts // ignore: cast_nullable_to_non_nullable
              as List<Court>,
      schedule: null == schedule
          ? _value._schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
      pinVerified: null == pinVerified
          ? _value.pinVerified
          : pinVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TableLoadingStateImpl extends TableLoadingState {
  _$TableLoadingStateImpl(
      {final List<Court> courts = const [],
      final List<Schedule> schedule = const [],
      this.pinVerified = false})
      : _courts = courts,
        _schedule = schedule,
        super._();

  final List<Court> _courts;
  @override
  @JsonKey()
  List<Court> get courts {
    if (_courts is EqualUnmodifiableListView) return _courts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courts);
  }

  final List<Schedule> _schedule;
  @override
  @JsonKey()
  List<Schedule> get schedule {
    if (_schedule is EqualUnmodifiableListView) return _schedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedule);
  }

  @override
  @JsonKey()
  final bool pinVerified;

  @override
  String toString() {
    return 'TableState.loading(courts: $courts, schedule: $schedule, pinVerified: $pinVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableLoadingStateImpl &&
            const DeepCollectionEquality().equals(other._courts, _courts) &&
            const DeepCollectionEquality().equals(other._schedule, _schedule) &&
            (identical(other.pinVerified, pinVerified) ||
                other.pinVerified == pinVerified));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_courts),
      const DeepCollectionEquality().hash(_schedule),
      pinVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TableLoadingStateImplCopyWith<_$TableLoadingStateImpl> get copyWith =>
      __$$TableLoadingStateImplCopyWithImpl<_$TableLoadingStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        $default, {
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        initial,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        loading,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        loaded,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        error,
  }) {
    return loading(courts, schedule, pinVerified);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        $default, {
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        initial,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loading,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loaded,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        error,
  }) {
    return loading?.call(courts, schedule, pinVerified);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        $default, {
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        initial,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loading,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loaded,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(courts, schedule, pinVerified);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TableState value) $default, {
    required TResult Function(TableInitialState value) initial,
    required TResult Function(TableLoadingState value) loading,
    required TResult Function(TableLoadedState value) loaded,
    required TResult Function(TableErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TableState value)? $default, {
    TResult? Function(TableInitialState value)? initial,
    TResult? Function(TableLoadingState value)? loading,
    TResult? Function(TableLoadedState value)? loaded,
    TResult? Function(TableErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TableState value)? $default, {
    TResult Function(TableInitialState value)? initial,
    TResult Function(TableLoadingState value)? loading,
    TResult Function(TableLoadedState value)? loaded,
    TResult Function(TableErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TableLoadingState extends TableState {
  factory TableLoadingState(
      {final List<Court> courts,
      final List<Schedule> schedule,
      final bool pinVerified}) = _$TableLoadingStateImpl;
  TableLoadingState._() : super._();

  @override
  List<Court> get courts;
  @override
  List<Schedule> get schedule;
  @override
  bool get pinVerified;
  @override
  @JsonKey(ignore: true)
  _$$TableLoadingStateImplCopyWith<_$TableLoadingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TableLoadedStateImplCopyWith<$Res>
    implements $TableStateCopyWith<$Res> {
  factory _$$TableLoadedStateImplCopyWith(_$TableLoadedStateImpl value,
          $Res Function(_$TableLoadedStateImpl) then) =
      __$$TableLoadedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Court> courts, List<Schedule> schedule, bool pinVerified});
}

/// @nodoc
class __$$TableLoadedStateImplCopyWithImpl<$Res>
    extends _$TableStateCopyWithImpl<$Res, _$TableLoadedStateImpl>
    implements _$$TableLoadedStateImplCopyWith<$Res> {
  __$$TableLoadedStateImplCopyWithImpl(_$TableLoadedStateImpl _value,
      $Res Function(_$TableLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courts = null,
    Object? schedule = null,
    Object? pinVerified = null,
  }) {
    return _then(_$TableLoadedStateImpl(
      courts: null == courts
          ? _value._courts
          : courts // ignore: cast_nullable_to_non_nullable
              as List<Court>,
      schedule: null == schedule
          ? _value._schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
      pinVerified: null == pinVerified
          ? _value.pinVerified
          : pinVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TableLoadedStateImpl extends TableLoadedState {
  _$TableLoadedStateImpl(
      {final List<Court> courts = const [],
      final List<Schedule> schedule = const [],
      this.pinVerified = false})
      : _courts = courts,
        _schedule = schedule,
        super._();

  final List<Court> _courts;
  @override
  @JsonKey()
  List<Court> get courts {
    if (_courts is EqualUnmodifiableListView) return _courts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courts);
  }

  final List<Schedule> _schedule;
  @override
  @JsonKey()
  List<Schedule> get schedule {
    if (_schedule is EqualUnmodifiableListView) return _schedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedule);
  }

  @override
  @JsonKey()
  final bool pinVerified;

  @override
  String toString() {
    return 'TableState.loaded(courts: $courts, schedule: $schedule, pinVerified: $pinVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._courts, _courts) &&
            const DeepCollectionEquality().equals(other._schedule, _schedule) &&
            (identical(other.pinVerified, pinVerified) ||
                other.pinVerified == pinVerified));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_courts),
      const DeepCollectionEquality().hash(_schedule),
      pinVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TableLoadedStateImplCopyWith<_$TableLoadedStateImpl> get copyWith =>
      __$$TableLoadedStateImplCopyWithImpl<_$TableLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        $default, {
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        initial,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        loading,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        loaded,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        error,
  }) {
    return loaded(courts, schedule, pinVerified);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        $default, {
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        initial,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loading,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loaded,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        error,
  }) {
    return loaded?.call(courts, schedule, pinVerified);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        $default, {
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        initial,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loading,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loaded,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(courts, schedule, pinVerified);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TableState value) $default, {
    required TResult Function(TableInitialState value) initial,
    required TResult Function(TableLoadingState value) loading,
    required TResult Function(TableLoadedState value) loaded,
    required TResult Function(TableErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TableState value)? $default, {
    TResult? Function(TableInitialState value)? initial,
    TResult? Function(TableLoadingState value)? loading,
    TResult? Function(TableLoadedState value)? loaded,
    TResult? Function(TableErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TableState value)? $default, {
    TResult Function(TableInitialState value)? initial,
    TResult Function(TableLoadingState value)? loading,
    TResult Function(TableLoadedState value)? loaded,
    TResult Function(TableErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TableLoadedState extends TableState {
  factory TableLoadedState(
      {final List<Court> courts,
      final List<Schedule> schedule,
      final bool pinVerified}) = _$TableLoadedStateImpl;
  TableLoadedState._() : super._();

  @override
  List<Court> get courts;
  @override
  List<Schedule> get schedule;
  @override
  bool get pinVerified;
  @override
  @JsonKey(ignore: true)
  _$$TableLoadedStateImplCopyWith<_$TableLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TableErrorStateImplCopyWith<$Res>
    implements $TableStateCopyWith<$Res> {
  factory _$$TableErrorStateImplCopyWith(_$TableErrorStateImpl value,
          $Res Function(_$TableErrorStateImpl) then) =
      __$$TableErrorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Court> courts, List<Schedule> schedule, bool pinVerified});
}

/// @nodoc
class __$$TableErrorStateImplCopyWithImpl<$Res>
    extends _$TableStateCopyWithImpl<$Res, _$TableErrorStateImpl>
    implements _$$TableErrorStateImplCopyWith<$Res> {
  __$$TableErrorStateImplCopyWithImpl(
      _$TableErrorStateImpl _value, $Res Function(_$TableErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courts = null,
    Object? schedule = null,
    Object? pinVerified = null,
  }) {
    return _then(_$TableErrorStateImpl(
      courts: null == courts
          ? _value._courts
          : courts // ignore: cast_nullable_to_non_nullable
              as List<Court>,
      schedule: null == schedule
          ? _value._schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
      pinVerified: null == pinVerified
          ? _value.pinVerified
          : pinVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TableErrorStateImpl extends TableErrorState {
  _$TableErrorStateImpl(
      {final List<Court> courts = const [],
      final List<Schedule> schedule = const [],
      this.pinVerified = false})
      : _courts = courts,
        _schedule = schedule,
        super._();

  final List<Court> _courts;
  @override
  @JsonKey()
  List<Court> get courts {
    if (_courts is EqualUnmodifiableListView) return _courts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courts);
  }

  final List<Schedule> _schedule;
  @override
  @JsonKey()
  List<Schedule> get schedule {
    if (_schedule is EqualUnmodifiableListView) return _schedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedule);
  }

  @override
  @JsonKey()
  final bool pinVerified;

  @override
  String toString() {
    return 'TableState.error(courts: $courts, schedule: $schedule, pinVerified: $pinVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableErrorStateImpl &&
            const DeepCollectionEquality().equals(other._courts, _courts) &&
            const DeepCollectionEquality().equals(other._schedule, _schedule) &&
            (identical(other.pinVerified, pinVerified) ||
                other.pinVerified == pinVerified));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_courts),
      const DeepCollectionEquality().hash(_schedule),
      pinVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TableErrorStateImplCopyWith<_$TableErrorStateImpl> get copyWith =>
      __$$TableErrorStateImplCopyWithImpl<_$TableErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        $default, {
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        initial,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        loading,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        loaded,
    required TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)
        error,
  }) {
    return error(courts, schedule, pinVerified);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        $default, {
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        initial,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loading,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loaded,
    TResult? Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        error,
  }) {
    return error?.call(courts, schedule, pinVerified);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        $default, {
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        initial,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loading,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        loaded,
    TResult Function(
            List<Court> courts, List<Schedule> schedule, bool pinVerified)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(courts, schedule, pinVerified);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TableState value) $default, {
    required TResult Function(TableInitialState value) initial,
    required TResult Function(TableLoadingState value) loading,
    required TResult Function(TableLoadedState value) loaded,
    required TResult Function(TableErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TableState value)? $default, {
    TResult? Function(TableInitialState value)? initial,
    TResult? Function(TableLoadingState value)? loading,
    TResult? Function(TableLoadedState value)? loaded,
    TResult? Function(TableErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TableState value)? $default, {
    TResult Function(TableInitialState value)? initial,
    TResult Function(TableLoadingState value)? loading,
    TResult Function(TableLoadedState value)? loaded,
    TResult Function(TableErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TableErrorState extends TableState {
  factory TableErrorState(
      {final List<Court> courts,
      final List<Schedule> schedule,
      final bool pinVerified}) = _$TableErrorStateImpl;
  TableErrorState._() : super._();

  @override
  List<Court> get courts;
  @override
  List<Schedule> get schedule;
  @override
  bool get pinVerified;
  @override
  @JsonKey(ignore: true)
  _$$TableErrorStateImplCopyWith<_$TableErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
