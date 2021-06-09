#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
       
long duration;
int distance;

String apiKey = "ZHCG69HTKTGD8WZT";
const char* ssid = "DSH";
const char* password = "Wohngemeinschaft";
const char* server = "api.thingspeak.com";

void setup() {
  
  Serial.begin(115200);
  pinMode(D0, OUTPUT); 
  pinMode(D1, INPUT); 
  delay(100);

  // Configure Wi-Fi
  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  delay(100);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(100);
    Serial.print(".");
  }

  // Print connection data
  if (WiFi.status() == WL_CONNECTED) {
    Serial.print("Bağlıyım bebiş :)");
    Serial.println(WiFi.localIP());
    Serial.print("RSSI: ");
    Serial.println(WiFi.RSSI());
  }
}


void loop() {
 
  digitalWrite(D0, LOW);
  delayMicroseconds(2);
  digitalWrite(D0, HIGH);
  delayMicroseconds(10);
  digitalWrite(D0, LOW);

 duration = pulseIn(D1, HIGH);

 distance= duration*0.034/2;

  Serial.print("Distance: ");
  Serial.println(distance);

  Serial.println("Prepare to send data");

  WiFiClient client;

  const int httpPort = 80;

  if (!client.connect(server, httpPort)) {
    Serial.println("connection failed");
    return;
  }
  else
  {
    String data_to_send = apiKey;
    data_to_send += "&field1=";
    data_to_send += String(distance);
    data_to_send += "\r\n\r\n";

    client.print("POST /update HTTP/1.1\n");
    client.print("Host: api.thingspeak.com\n");
    client.print("Connection: close\n");
    client.print("X-THINGSPEAKAPIKEY: " + apiKey + "\n");
    client.print("Content-Type: application/x-www-form-urlencoded\n");
    client.print("Content-Length: ");
    client.print(data_to_send.length());
    client.print("\n\n");
    client.print(data_to_send);

    delay(100);
  }
  
  client.stop();

  delay(100);

}
