// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionsModelAdapter extends TypeAdapter<TransactionsModel> {
  @override
  final int typeId = 1;

  @override
  TransactionsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionsModel(
      transactions: (fields[0] as List).cast<TransactionItemModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, TransactionsModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.transactions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionsModelImpl _$$TransactionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionsModelImpl(
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => TransactionItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TransactionsModelImplToJson(
        _$TransactionsModelImpl instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
    };
