import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/repositories/advicer_repository.dart';
import 'package:dartz/dartz.dart';

class AdvicerUsecases {
  final AdvicerRepository advicerRepository;

  AdvicerUsecases({required this.advicerRepository});

  Future<Either<Failure, AdviceEntity>> getAdviceUsecase() async {
    return advicerRepository.getAdviceFromApi();

    // call function from repository to get advice

    // Business logic implementieren z.B. Rechnungen etc.

    // return Left(GeneralFailure());

    // return Right(AdviceEntity(advice: 'example advice', id: 1));
  }
}
