import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_games_app/app/modules/games/errors/games_errors.dart';
import 'package:my_games_app/app/modules/games/external/datasources/games_dio_datasource.dart';

import '../../../../../utils/games_api_return.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = GamesDioDatasource(dio);
  final request = RequestOptions(path: "");

  test('Deve retornar os dados do Dio sem erro', () {
    when(() => dio.get(any())).thenAnswer(
      (_) async => Response(
        data: games,
        requestOptions: request,
        statusCode: 200,
      ),
    );
    final future = datasource.showGames();
    expect(future, completes);
  });
  test('Deve retornar um DioError', () {
    when(() => dio.get(any())).thenThrow(DioError(
      requestOptions: request,
      response: Response(
        requestOptions: request,
        data: {},
        statusCode: 400,
      ),
    ));
    final future = datasource.showGames();
    expect(future, throwsA(isA<DioDatasourceErrors>()));
  });
}
