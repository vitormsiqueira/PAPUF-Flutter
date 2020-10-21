import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;

// Var's necessarias p/ conexão
String broker = 'soldier.cloudmqtt.com';
int port = 17843;
String username = 'efbwcvvu';
String passwd = 'FWF3kqx3Yupz';
String clientIdentifier = '27843';
String topic = "temp";

mqtt.MqttClient client;
mqtt.MqttConnectionState connectionState;

int ar1 = 19;
int ar2 = 17;

class ConnectMQTT extends StatefulWidget {
  @override
  _ConnectMQTTState createState() => _ConnectMQTTState();
}

class _ConnectMQTTState extends State<ConnectMQTT> {
  double _temp = 30;
  StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    if (connectionState != mqtt.MqttConnectionState.connected) {
      _connect();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

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
        print("jgjfkdlslkdlsjfksdjfk");
      });
    }
    if (topic == "temp-2") {
      setState(() {
        ar2 = int.parse(msg);
      });
    }
  }
}

void publishM(String mes, String topic) {
  final mqtt.MqttClientPayloadBuilder builder = mqtt.MqttClientPayloadBuilder();
  builder.addString(mes);
  client.publishMessage(
    topic,
    mqtt.MqttQos.values[1],
    builder.payload,
    retain: true,
  );
}
