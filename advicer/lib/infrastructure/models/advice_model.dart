import 'package:advicer/domain/entities/advice_entity.dart';

class AdviceModel extends AdviceEntity {
  AdviceModel({required String advice, required int id})
      : super(advice: advice, id: id);

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(
      id: json['id'],
      advice: json['advice'],
    );
  } 
}
