// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionItemModelAdapter extends TypeAdapter<TransactionItemModel> {
  @override
  final int typeId = 0;

  @override
  TransactionItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionItemModel(
      id: fields[0] as String,
      name: fields[1] as String,
      date: fields[2] as int,
      merchant: fields[3] as String,
      billingAmount: fields[4] as num,
      image: fields[5] as String,
      billingCurrency: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionItemModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.merchant)
      ..writeByte(4)
      ..write(obj.billingAmount)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.billingCurrency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionItemModelImpl _$$TransactionItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionItemModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      date: (json['date'] as num).toInt(),
      merchant: json['merchant'] as String,
      billingAmount: json['billingAmount'] as num,
      image: json['image'] as String,
      billingCurrency: json['billingCurrency'] as String,
    );

Map<String, dynamic> _$$TransactionItemModelImplToJson(
        _$TransactionItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date': instance.date,
      'merchant': instance.merchant,
      'billingAmount': instance.billingAmount,
      'image': instance.image,
      'billingCurrency': instance.billingCurrency,
    };
