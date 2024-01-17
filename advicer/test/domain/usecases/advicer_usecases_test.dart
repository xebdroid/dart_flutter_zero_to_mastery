import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/repositories/advicer_repository.dart';
import 'package:advicer/domain/usecases/advicer_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advicer_usecases_test.mocks.dart';

@GenerateMocks([AdvicerRepository])
void main() {
  late AdvicerUsecases advicerUsecases;
  late MockAdvicerRepository mockAdvicerRepository;

  setUp(() {
    mockAdvicerRepository = MockAdvicerRepository();
    advicerUsecases = AdvicerUsecases(advicerRepository: mockAdvicerRepository);
  });

  group('getAdviceUsecase', () {
    final t_Advice = AdviceEntity(advice: 'test', id: 1);

    test('should return the same advice as repository', () async {
      // arrange
      when(mockAdvicerRepository.getAdviceFromApi())
          .thenAnswer((_) async => Right(t_Advice));

      // act
      final result = await advicerUsecases.getAdviceUsecase();

      // assert
      expect(result, Right(t_Advice));
      verify(mockAdvicerRepository.getAdviceFromApi());
      verifyNoMoreInteractions(mockAdvicerRepository);
    });

    
    test('should return the same server failure as repository', () async {
      // arrange
      when(mockAdvicerRepository.getAdviceFromApi())
          .thenAnswer((_) async => Left(ServerFailure()));

      // act
      final result = await advicerUsecases.getAdviceUsecase();

      // assert
      expect(result, Left(ServerFailure()));
      verify(mockAdvicerRepository.getAdviceFromApi());
      verifyNoMoreInteractions(mockAdvicerRepository);
    });

    
    test('should return the same general failure as repository', () async {
      // arrange
      when(mockAdvicerRepository.getAdviceFromApi())
          .thenAnswer((_) async => Left(GeneralFailure()));

      // act
      final result = await advicerUsecases.getAdviceUsecase();

      // assert
      expect(result, Left(GeneralFailure()));
      verify(mockAdvicerRepository.getAdviceFromApi());
      verifyNoMoreInteractions(mockAdvicerRepository);
    });
  });
}
