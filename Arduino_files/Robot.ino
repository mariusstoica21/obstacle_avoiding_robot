#include <ESP8266WiFi.h>
#include <SoftwareSerial.h>
#include <FirebaseArduino.h>
#include <ESP8266HTTPClient.h>
#include <ArduinoJson.h>
#include <Servo.h>

//Firebase host name
#define FIREBASE_HOST "" //Add Firebase hostname
//Secret key firebase
#define FIREBASE_AUTH "" //Add secret key


//Wifi username and password
#define WIFI_SSID "" //Add your WiFi username
#define WIFI_PASSWORD "" //Add your WiFi password




//Variable declaration

String dir = "";
int speedVal = 0;
int servoVal = 0;
                                          
//Distance sensor
const int trigPin = 4;                   //D2
const int echoPin = 14;                  //D5
long duration;
int distance;

//HBridge and DC motors
const int leftMotorForward = 12;        //D6
const int rightMotorForward = 15;       //D8
const int leftMotorBackward = 0;        //D3
const int rightMotorBackward = 13;      //D7
const int rightMotorENB = 16;           //D0
const int leftMotorENB = 5;             //D1

//Create one second interval
unsigned long previousMillis = 0;
const long interval = 1000;

//Servomotor object
Servo servo;

void setup() {
  
  //DC motors
  pinMode(leftMotorForward, OUTPUT);
  pinMode(rightMotorForward, OUTPUT);
  pinMode(leftMotorBackward, OUTPUT);
  pinMode(rightMotorBackward, OUTPUT);
  pinMode(rightMotorENB, OUTPUT);
  pinMode(leftMotorENB, OUTPUT);
  
  //Distance sensor
  pinMode(trigPin, OUTPUT); 
  pinMode(echoPin, INPUT); 
  
  //Servomotor
  servo.attach(2); //D4
  servo.write(0);
  
  //Set baud rate for serial port, in order to display information like direction,speedValue,angleValue
  Serial.begin(115200);
  delay(500);
  
  //Connect to WiFi network
  WiFi.begin(WIFI_SSID,WIFI_PASSWORD);
  Serial.println("Connecting");
  while(WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("Connected");
  Serial.println(WiFi.localIP());
  
  //Start Firebase connection
  Firebase.begin(FIREBASE_HOST,FIREBASE_AUTH);

  delay(1000); 
}


void loop() {
  
  dir = Firebase.getString("Direction/dir");
  servoVal = Firebase.getInt("AngleVal/value");
  speedVal = Firebase.getInt("SpeedSel/value");
  Serial.print("Direction: ");
  Serial.println(dir);
  Serial.print("Servo value: ");
  Serial.println(servoVal);
  Serial.print("Speed value: ");
  Serial.println(speedVal);
  delay(100);

  if (dir == "up")
  {
    motorUp();   
  }
  if (dir == "stop")
  {
    motorStop();   
  }
  
  if (dir == "left")
  {
    motorLeft(); 
  }
  if (dir == "right")
  {
    motorRight();
  }
  if (dir == "down")
  {
    motorDown();    
  }

  setServoAngle();
  
  readDistance();
  
  sendDataToFirebase();
}

void motorUp()
{
  digitalWrite(leftMotorENB, HIGH);
  digitalWrite(rightMotorENB, HIGH);
  analogWrite(leftMotorENB,speedVal*200);
  analogWrite(rightMotorENB,speedVal*200);
  digitalWrite(rightMotorForward, HIGH);
  digitalWrite(leftMotorForward, HIGH);
  digitalWrite(leftMotorBackward, LOW); 
  digitalWrite(rightMotorBackward, LOW);
  delay(100); //300
  Firebase.setString("Direction/dir","stop");
  digitalWrite(leftMotorENB,LOW);
  digitalWrite(rightMotorENB, LOW);
}

void motorStop()
{
  digitalWrite(leftMotorENB,LOW);
  digitalWrite(rightMotorENB, LOW);
  digitalWrite(leftMotorForward, LOW);
  digitalWrite(leftMotorBackward, LOW);
  digitalWrite(rightMotorForward, LOW);
  digitalWrite(rightMotorBackward, LOW);
}

void motorLeft()
{
  analogWrite(leftMotorENB,speedVal*200);
  analogWrite(rightMotorENB,speedVal*200);
  digitalWrite(leftMotorENB,HIGH);
  digitalWrite(rightMotorENB, LOW);
  digitalWrite(leftMotorForward, HIGH);
  digitalWrite(leftMotorBackward, LOW);
  digitalWrite(rightMotorForward, LOW);
  digitalWrite(rightMotorBackward, LOW);
  delay(100);
  Firebase.setString("Direction/dir","stop");
  digitalWrite(leftMotorENB,LOW);
  digitalWrite(rightMotorENB, LOW);
}

void motorRight()
{
  analogWrite(leftMotorENB,speedVal*200);
  analogWrite(rightMotorENB,speedVal*200);
  digitalWrite(leftMotorENB,LOW);
  digitalWrite(rightMotorENB, HIGH);
  digitalWrite(leftMotorForward,LOW);
  digitalWrite(leftMotorBackward, LOW);
  digitalWrite(rightMotorForward, HIGH);
  digitalWrite(rightMotorBackward,LOW);
  delay(100);
  Firebase.setString("Direction/dir","stop");
  digitalWrite(leftMotorENB,LOW);
  digitalWrite(rightMotorENB, LOW);  
}

void motorDown()
{
  digitalWrite(leftMotorENB,HIGH);
  digitalWrite(rightMotorENB, HIGH);
  digitalWrite(leftMotorForward, LOW);
  digitalWrite(rightMotorForward, LOW);
  digitalWrite(rightMotorBackward, HIGH);
  digitalWrite(leftMotorBackward, HIGH);
  delay(100);
  Firebase.setString("Direction/dir","stop");
  digitalWrite(leftMotorENB,LOW);
  digitalWrite(rightMotorENB, LOW);
}

void setServoAngle()
{
  servo.write(servoVal);
}

void readDistance()
{
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  duration = pulseIn(echoPin, HIGH);
  distance= duration*0.034/2;
  Serial.print("Distance: ");
  Serial.println(distance);
}

void sendDataToFirebase()
{
  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis >= interval)
  {
    setParameters();
    previousMillis = currentMillis;
  }
}

void setParameters(){
  Firebase.setFloat("Distance/value",float(distance));
}
