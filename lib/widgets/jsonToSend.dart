
import 'package:papuf/utils/connect_MQTT.dart';

String createJsonTempState(String temp, String state){
  String json = '{\"temp\": \"${temp}\", \"state\": \"${state}\"}';
  print('json a ser enviado: ${json}');
  return json;
}

void requestState(String topicAr){ //envia um pedido e estado on off para o ar, que deverá responde
  publishM('{\"State?\"}', topicAr);
}

