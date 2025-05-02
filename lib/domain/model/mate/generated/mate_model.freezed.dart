// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../mate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MateModel {
  List<MateDetailModel> get mates => throw _privateConstructorUsedError;
  bool get last => throw _privateConstructorUsedError;

  /// Create a copy of MateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MateModelCopyWith<MateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MateModelCopyWith<$Res> {
  factory $MateModelCopyWith(MateModel value, $Res Function(MateModel) then) =
      _$MateModelCopyWithImpl<$Res, MateModel>;
  @useResult
  $Res call({List<MateDetailModel> mates, bool last});
}

/// @nodoc
class _$MateModelCopyWithImpl<$Res, $Val extends MateModel>
    implements $MateModelCopyWith<$Res> {
  _$MateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mates = null, Object? last = null}) {
    return _then(
      _value.copyWith(
            mates:
                null == mates
                    ? _value.mates
                    : mates // ignore: cast_nullable_to_non_nullable
                        as List<MateDetailModel>,
            last:
                null == last
                    ? _value.last
                    : last // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MateModelImplCopyWith<$Res>
    implements $MateModelCopyWith<$Res> {
  factory _$$MateModelImplCopyWith(
    _$MateModelImpl value,
    $Res Function(_$MateModelImpl) then,
  ) = __$$MateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MateDetailModel> mates, bool last});
}

/// @nodoc
class __$$MateModelImplCopyWithImpl<$Res>
    extends _$MateModelCopyWithImpl<$Res, _$MateModelImpl>
    implements _$$MateModelImplCopyWith<$Res> {
  __$$MateModelImplCopyWithImpl(
    _$MateModelImpl _value,
    $Res Function(_$MateModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mates = null, Object? last = null}) {
    return _then(
      _$MateModelImpl(
        mates:
            null == mates
                ? _value._mates
                : mates // ignore: cast_nullable_to_non_nullable
                    as List<MateDetailModel>,
        last:
            null == last
                ? _value.last
                : last // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$MateModelImpl implements _MateModel {
  const _$MateModelImpl({
    required final List<MateDetailModel> mates,
    required this.last,
  }) : _mates = mates;

  final List<MateDetailModel> _mates;
  @override
  List<MateDetailModel> get mates {
    if (_mates is EqualUnmodifiableListView) return _mates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mates);
  }

  @override
  final bool last;

  @override
  String toString() {
    return 'MateModel(mates: $mates, last: $last)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MateModelImpl &&
            const DeepCollectionEquality().equals(other._mates, _mates) &&
            (identical(other.last, last) || other.last == last));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_mates),
    last,
  );

  /// Create a copy of MateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MateModelImplCopyWith<_$MateModelImpl> get copyWith =>
      __$$MateModelImplCopyWithImpl<_$MateModelImpl>(this, _$identity);
}

abstract class _MateModel implements MateModel {
  const factory _MateModel({
    required final List<MateDetailModel> mates,
    required final bool last,
  }) = _$MateModelImpl;

  @override
  List<MateDetailModel> get mates;
  @override
  bool get last;

  /// Create a copy of MateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MateModelImplCopyWith<_$MateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
