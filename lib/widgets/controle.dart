import 'dart:async';

import 'package:flutter/material.dart';
import 'package:papuf/utils/control_temperature.dart';

import '../color_hex.dart';

import 'package:mqtt_client/mqtt_client.dart' as mqtt;

// Var's necessarias p conexão
String broker = 'soldier.cloudmqtt.com';
int port = 17843;
String username = 'efbwcvvu';
String passwd = 'FWF3kqx3Yupz';
String clientIdentifier = '27843';
String topic = "temp";

mqtt.MqttClient client;
mqtt.MqttConnectionState connectionState;

int ar1 = 10;
int ar2 = 10;

bool pressed = false;

class Controle extends StatefulWidget {
  final int currentSala;

  const Controle({this.currentSala});
  @override
  _ControleState createState() => _ControleState();
}

class _ControleState extends State<Controle> {
  String selected1 = "Off";
  String selected2 = "Off";
  int um = 1;
  int dois = 2;

  @override
  void initState() {
    super.initState();
    if (connectionState != mqtt.MqttConnectionState.connected) {
      _connect();
    }
  }

  double _temp = 30;
  StreamSubscription subscription;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _modulo(selected1, um),
        SizedBox(
          width: 40,
        ),
        _modulo(selected2, dois)
      ],
    );
  }

  _modulo(String selected, int i) {
    return Container(
      padding: EdgeInsets.all(15),
      width: 150,
      height: 350,
      decoration: _controleBoxDecoration(selected),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: selected == "On"
                ? _img("assets/images/icon_ar_branco.png")
                : _img("assets/images/icon_ar_azul.png"),
          ),
          // Container(
          //   width: 80,
          //   height: 60,
          //   child: InkWell(
          //     onTap: () {
          //       print(selected);
          //     },
          //     child: _textOthers(selected, '+', 45, FontWeight.w400),
          //   ),
          // ),
          // Container(
          //   width: 80,
          //   height: 60,
          //   child: _textOthers(selected, temp, 45, FontWeight.w300),
          // ),
          // Container(
          //   width: 80,
          //   height: 60,
          //   child: InkWell(
          //     onTap: () {
          //       print(selected);
          //     },
          //     child: _textOthers(selected, '-', 55, FontWeight.w400),
          //   ),
          // ),

          ControlTemperature(ar1, "temp-1"),
          //ControlTemperature(ar2, "temp-2"),

          Container(
            width: 80,
            height: 60,
            child: InkWell(
              onTap: () {
                print(selected);
                // aqui o selected não estava alterando o estado global, apenas qdo especificando se seelcted1 ou selected2
                // mas ta aí uma solução porca
                setState(() {
                  if (selected1 == 'Off' && i == 1) {
                    selected1 = 'On';
                  } else if (selected1 == 'On' && i == 1) {
                    selected1 = 'Off';
                  } else if (selected2 == 'Off' && i == 2) {
                    selected2 = 'On';
                  } else if (selected2 == 'On' && i == 2) {
                    selected2 = 'Off';
                  }
                });
              },
              splashColor: Colors.black,
              child: _textOnOff(selected),
            ),
          ),

        ],
      ),
    );
  }

  _controleBoxDecoration(String selected) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: selected == "On" ? hexToColor("#4163CD") : Colors.white,
      boxShadow: [
        BoxShadow(
          color: selected == "On" ? hexToColor("#838BDA") : Colors.black26,
          blurRadius: 15.0, // has the effect of softening the shadow
          spreadRadius: 0.5, // has the effect of extending the shadow
        )
      ],
    );
  }

  _textOnOff(String selected) {
    return Center(
      child: Text(
        selected,
        style: TextStyle(
          fontSize: 32,
          letterSpacing: .6,
          color: selected == "On" ? Colors.white : hexToColor("#4163CD"),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  _textOthers(
      String selected, String texto, int size, FontWeight myFontWeight) {
    return Center(
      child: Text(
        texto,
        style: TextStyle(
          fontSize: size.toDouble(),
          color: selected == "On" ? Colors.white : hexToColor("#4163CD"),
          fontWeight: myFontWeight,
        ),
      ),
    );
  }

  ///////////////////////////////
  ////////////////////
  Future _connect() async {
    client = mqtt.MqttClient(broker, '');
    client.port = port;

    client.logging(on: true);

    client.keepAlivePeriod = 30;

    client.onDisconnected = _onDisconnected;

    final mqtt.MqttConnectMessage connMess = mqtt.MqttConnectMessage()
        .withClientIdentifier(clientIdentifier)
        .startClean() // Non persistent session for testing
        .keepAliveFor(30)
        .withWillQos(mqtt.MqttQos.atMostOnce);
    print('[MQTT client] MQTT client connecting....');
    client.connectionMessage = connMess;

    /// Connect the client, any errors here are communicated by raising of the appropriate exception. Note
    /// in some circumstances the broker will just disconnect us, see the spec about this, we however will
    /// never send malformed messages.

    try {
      await client.connect(username, passwd);
    } catch (error) {
      print(error);
      _disconnect();
    }

    /// Check if we are connected
    if (client.connectionState == mqtt.MqttConnectionState.connected) {
      print('[MQTT client] connected');
      setState(() {
        connectionState = client.connectionState;
      });
    } else {
      print('[MQTT client] ERROR: MQTT client connection failed - '
          'disconnecting, state is ${client.connectionState}');
      _disconnect();
    }

    /// The client has a change notifier object(see the Observable class) which we then listen to to get
    /// notifications of published updates to each subscribed topic.
    subscription = client.updates.listen(_onMessage);

    _subscribeToTopic("temp-1");
    _subscribeToTopic("temp-2");
  }

  void _subscribeToTopic(String topic) {
    if (connectionState == mqtt.MqttConnectionState.connected) {
      print('[MQTT client] Subscribing to ${topic.trim()}');
      client.subscribe(topic, mqtt.MqttQos.exactlyOnce);
    }
  }

  void _disconnect() {
    print('[MQTT client] _disconnect()');
    client.disconnect();
    _onDisconnected();
  }

  void _onDisconnected() {
    print('[MQTT client] _onDisconnected');
    setState(() {
      //topics.clear();
      connectionState = client.connectionState;
      client = null;
      subscription.cancel();
      subscription = null;
    });
    print('[MQTT client] MQTT client disconnected');
  }

  void _onMessage(List<mqtt.MqttReceivedMessage> event) {
    print(event.length);
    final mqtt.MqttPublishMessage recMess =
        event[0].payload as mqtt.MqttPublishMessage;
    final String message =
        mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

    /// The above may seem a little convoluted for users only interested in the
    /// payload, some users however may be interested in the received publish message,
    /// lets not constrain ourselves yet until the package has been in the wild
    /// for a while.
    /// The payload is a byte buffer, this will be specific to the topic
    print('[MQTT client] MQTT message: topic is <${event[0].topic}>, '
        'payload is <-- ${message} -->');
    print(client.connectionState);
    print("[MQTT client] message with topic: ${event[0].topic}");
    print("[MQTT client] message with message: ${message}");
    _trataMsg(event[0].topic, message);
    print("conectado");
  }

  void _trataMsg(String topic, String msg) {
    if (topic == "temp-1") {
      setState(() {
        ar1 = int.parse(msg);
      });
    }
    if (topic == "temp-2") {
      setState(() {
        ar2 = int.parse(msg);
      });
    }
  }

    //################################################################
}

void PublishM(String mes, String topic) {
  final mqtt.MqttClientPayloadBuilder builder = mqtt.MqttClientPayloadBuilder();
  builder.addString(mes);
  client.publishMessage(topic, mqtt.MqttQos.values[1],
    builder.payload,
    retain: true,
  );
}

_img(String img) {
  return Container(
    height: 60,
    child: Image.asset(
      img,
      fit: BoxFit.cover,
    ),
  );
}
