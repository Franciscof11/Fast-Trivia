import 'package:dio/dio.dart';
import 'package:fast_trivia/model/questao.dart';
import 'package:fast_trivia/model/questionario.dart';

class QuestionarioRepository {
  Future<List<Questionario>> getAllQuestionarios() async {
    final response =
        await Dio().get('http://192.168.100.11:8080/questionarios');

    try {
      if (response.statusCode == 200) {
        return response.data
            .map<Questionario>((map) => Questionario.fromMap(map))
            .toList();
      }
    } catch (error) {
      throw Exception(error);
    }
    return <Questionario>[];
  }

  Future<List<Questao>> getQuestoes(int idQuestionario) async {
    final response = await Dio()
        .get('http://192.168.100.11:8080/questionarios/$idQuestionario');

    try {
      if (response.statusCode == 200) {
        final data = response.data['questoes'];
        return data.map<Questao>((map) => Questao.fromMap(map)).toList();
      }
    } catch (error) {
      throw Exception(error);
    }
    return <Questao>[];
  }
}
