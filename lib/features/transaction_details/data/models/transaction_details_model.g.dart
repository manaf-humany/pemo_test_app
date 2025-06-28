// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionDetailsModelAdapter
    extends TypeAdapter<TransactionDetailsModel> {
  @override
  final int typeId = 2;

  @override
  TransactionDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionDetailsModel();
  }

  @override
  void write(BinaryWriter writer, TransactionDetailsModel obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
