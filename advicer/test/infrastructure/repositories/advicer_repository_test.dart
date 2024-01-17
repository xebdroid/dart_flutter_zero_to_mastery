import 'dart:math';

import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/repositories/advicer_repository.dart';
import 'package:advicer/infrastructure/datasources/advicer_remote_datasource.dart';
import 'package:advicer/infrastructure/exceptions/exceptions.dart';
import 'package:advicer/infrastructure/models/advice_model.dart';
import 'package:advicer/infrastructure/repositories/advicer_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advicer_repository_test.mocks.dart';

@GenerateMocks([AdvicerRemoteDatasource])
void main() {
  late AdvicerRepository advicerRepository;
  late MockAdvicerRemoteDatasource mockAdvicerRemoteDatasource;

  setUp(() {
    mockAdvicerRemoteDatasource = MockAdvicerRemoteDatasource();
    advicerRepository = AdvicerRepositoryImpl(
        advicerRemoteDatasource: mockAdvicerRemoteDatasource);
  });

  group('getAdviceFromApi', () {
    final t_AdviceModel = AdviceModel(advice: 'test', id: 1);
    final AdviceEntity t_Advice = t_AdviceModel;

    test('should return remote data if the call to remote datasource is successful', () async {
      // arrange
      when(mockAdvicerRemoteDatasource.getRandomAdviceFromApi()).thenAnswer((_) async => t_AdviceModel);

      // act
      final result = await advicerRepository.getAdviceFromApi();

      // assert
      verify(mockAdvicerRemoteDatasource.getRandomAdviceFromApi());
      expect(result, Right(t_Advice));
      verifyNoMoreInteractions(mockAdvicerRemoteDatasource);
    });


    test('should return server failure if datasource throws server-exception', ()  async{
      // arrange
      when(mockAdvicerRemoteDatasource.getRandomAdviceFromApi()).thenThrow(ServerException());

      // act
      final result = await advicerRepository.getAdviceFromApi();

      // assert
      verify(mockAdvicerRemoteDatasource.getRandomAdviceFromApi());
      expect(result, Left(ServerFailure()));
      verifyNoMoreInteractions(mockAdvicerRemoteDatasource);
    });

  });
}
