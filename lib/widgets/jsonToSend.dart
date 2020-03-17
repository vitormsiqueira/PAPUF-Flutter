import 'controle.dart';

String CreateJsonTempState(String temp, String state) {
  String json = '{\"temp\": \"${temp}\", \"state\": \"${state}\"}';
  print('json a ser enviado: ${json}');
  return json;
}

void RequestState(String topicAr) {
  //envia um pedido e estado on off para o ar, que deverá responde
  PublishM('{\"State?\"}', topicAr);
}
