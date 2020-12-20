//  SerialIn_SerialOut_HM-10_01
//
//  Uses hardware serial to talk to the host computer and AltSoftSerial for communication with the bluetooth module
//
//  What ever is entered in the serial monitor is sent to the connected device
//  Anything received from the connected device is copied to the serial monitor
//  Does not send line endings to the HM-10
//
//  Pins
//  BT VCC to Arduino 5V out. 
//  BT GND to GND
//  Arduino D8 (SS RX) - BT TX no need voltage divider 
//  Arduino D9 (SS TX) - BT RX through a voltage divider (5v to 3.3v)
//
 
#include <AltSoftSerial.h>
AltSoftSerial BTserial; 
// https://www.pjrc.com/teensy/td_libs_AltSoftSerial.html
 
#include "SIGFOX.h"
#include <TinyGPS++.h>
#include <SoftwareSerial.h> 
#include <Keypad.h>
#define TX 8
#define RX 9


static const int RXPin = 11, TXPin = 12;
static const uint32_t GPSBaud = 9600;

SoftwareSerial sigfox(RX,TX);
// The TinyGPS++ object
TinyGPSPlus gps;

// The serial connection to the GPS device
SoftwareSerial ss(RXPin, TXPin);

static const String device = "2C3192";                                 //  Set this to your device name if you're using UnaBiz Emulator.
static const bool useEmulator = false;                                //  Set to true if using UnaBiz Emulator.
static const bool echo = true;                                        //  Set to true if the SIGFOX library should display the executed commands.
static const Country country = COUNTRY_SG;                            //  Set this to your country to configure the SIGFOX transmission frequencies.
static UnaShieldV2S transceiver(country, useEmulator, device, echo);  //  Uncomment this for UnaBiz UnaShield V2S Dev Kit
String command = "";
char c = "";
boolean NL = true;
String bpm = "";
String a = "";
int BUTTON1 = 10; //button is hooked up to D13 pin
int myInt = 0;
byte digitCount = 0;
int maxbpm = 0; 

const int buzzer = 13;

const byte ROWS = 4; //four rows
const byte COLS = 3; //three columns
char keys[ROWS][COLS] = {
  {'1','2','3'},
  {'4','5','6'},
  {'7','8','9'},
  {'*','0','#'}
};
byte rowPins[ROWS] = {A5, A2, A3, 0}; //connect to the row pinouts of the keypad
byte colPins[COLS] = {A1, A0, A4}; //con nect to the column pinouts of the keypad

Keypad keypad = Keypad( makeKeymap(keys), rowPins, colPins, ROWS, COLS );

void setup() 
{
  sigfox.begin(9600); // Initalise Serial connection
  sigfox.write("AT$SF=0123CAFE\r"); // Serial write to Sigfox Module
  Serial.begin(9600);
  pinMode(BUTTON1,INPUT);
   
   
   Serial.print("Sketch:   ");   Serial.println(__FILE__);
   Serial.print("Uploaded: ");   Serial.println(__DATE__);
   Serial.println(" ");
 
    BTserial.begin(9600);  
    Serial.println("BTserial started at 9600");

    
    Serial.println(F("Running setup..."));  
    if (!transceiver.begin()) stop(F("Unable to init SIGFOX module, may be missing"));  //  Will never return.

    transceiver.sendMessage("0102030405060708090a0b0c");
    Serial.println("Waiting 1 seconds...");
    delay(1000);

    pinMode(buzzer, OUTPUT);

    
    ss.begin(GPSBaud);

    numberpad();
}
 
void loop()
{
// This sketch displays information every time a new sentence is correctly encoded.
  while (ss.available() > 0)
    if (gps.encode(ss.read()))
      //displayInfo();

  if (millis() > 5000 && gps.charsProcessed() < 10)
  {
    Serial.println(F("No GPS detected: check wiring."));
   // while(true);
  }
      
 while (BTserial.available())
    {
       char c = BTserial.read(); 
       if (c == 'Z'){
        break;
        delay(2000);
       }
      //if( c >= '0' && c <= '9') // is this an ascii digit between 0 and 9?
         // { 
           // bpm = (c - '0'); 
         // }
        //String mystring3 = c;
        a = a + c; 
    }
     Serial.println(a);

    if(a.toInt() > maxbpm && a.toInt() < 300){
    tone(buzzer, 100, 8000);
    String mystring = String(gps.location.lat(), 6);
    String mystring1 = String(gps.location.lng(), 6);
    delay(1000);
    transceiver.sendString("@"+a);
    delay(2000);
    transceiver.sendString("#"+mystring);//as an example, I maxed out all 12 bytes. each field is 4 bytes, "d1" is the key, "zoe" is the data
    delay(2000);
    transceiver.sendString("$"+mystring1);
     }
    // Message msg(transceiver);     //prepare message to send 
    // msg.addField("p1", a);    //here are all the 12 bytes you can send at once
    // msg.send();
    // delay(10000);
   //transceiver.sendString("@"+a);
   delay(1000);
   a="";

    buttonpress();
    
     
}
    // Read from the Bluetooth module and send to the Arduino Serial Monitor
void buttonpress()
{
  if(digitalRead(BUTTON1) == HIGH) //button is pressed
  { 
    tone(buzzer, 100, 8000); 
    //Serial.print(gps.location.lat(), 6);
    String mystring = String(gps.location.lat(), 6);
    String mystring1 = String(gps.location.lng(), 6);
    while (BTserial.available())
    {
        char c = BTserial.read(); 
       if (c == 'Z'){
        break;
        delay(1000);
       }
      //if( c >= '0' && c <= '9') // is this an ascii digit between 0 and 9?
         // { 
           // bpm = (c - '0'); 
         // }
        //String mystring3 = c;
        a = a + c; 
    }
   // Message msg(transceiver);     //prepare message to send 
    //msg.addField("d1", "SOS");    //here are all the 12 bytes you can send at once
    //msg.addField("d2", mystring);
    //msg.send();
    delay(1000);
    transceiver.sendString("!"+a);
    delay(2000);
    transceiver.sendString("#"+mystring);//as an example, I maxed out all 12 bytes. each field is 4 bytes, "d1" is the key, "zoe" is the data
    delay(2000);
    transceiver.sendString("$"+mystring1);
    a="";
    //you really need to send just 4 bytes to say that a button is pressed                              //send it!
    }
}

void numberpad()
{
    while (digitCount < 2) {
    char key = keypad.getKey();

    if (key >= '0' && key <= '9'){
      Serial.println(key);
      tone(buzzer, 100, 100); 
      myInt = (myInt * 10) + key -'0';
      digitCount++;
       if (digitCount == 2) {
         Serial.print("Age entered: ");
         Serial.println(myInt); 
                      
        }
      }
    }
    
  if (myInt >= 20 && myInt < 30){
  maxbpm = 200;
  Serial.print("Maximum Beats Per Minute (BPM): ");
  Serial.println(maxbpm); 
 }

  if (myInt >= 30 && myInt < 35){
  maxbpm = 190;
  Serial.print("Maximum Beats Per Minute (BPM): ");
  Serial.println(maxbpm); 
 }

  if (myInt >= 35 && myInt < 40){
  maxbpm = 185;
  Serial.print("Maximum Beats Per Minute (BPM): ");
  Serial.println(maxbpm); 
 }

  if (myInt >= 40 && myInt < 45){
  maxbpm = 180;
  Serial.print("Maximum Beats Per Minute (BPM): ");
  Serial.println(maxbpm); 
 }

  if (myInt >= 45 && myInt < 50){
  maxbpm = 175;
  Serial.print("Maximum Beats Per Minute (BPM): ");
  Serial.println(maxbpm); 
 }
 
  if (myInt >= 50 && myInt < 55){
  maxbpm = 170;
  Serial.print("Maximum Beats Per Minute (BPM): ");
  Serial.println(maxbpm); 
 }
 
  if (myInt >= 55 && myInt < 60){
  maxbpm = 165;
  Serial.print("Maximum Beats Per Minute (BPM): ");
  Serial.println(maxbpm); 
 }
}
void displayInfo()
{
  Serial.print(F("Location: ")); 
  if (gps.location.isValid())
  {
    Serial.print(gps.location.lat(), 6);
    Serial.print(F(","));
    Serial.print(gps.location.lng(), 6);

  }
  else
  {
    Serial.print(F("INVALID"));
    Serial.println(gps.satellites.value());
  }

  Serial.print(F("  Date/Time: "));
  if (gps.date.isValid())
  {
    Serial.print(gps.date.month());
    Serial.print(F("/"));
    Serial.print(gps.date.day());
    Serial.print(F("/"));
    Serial.print(gps.date.year());
  }
  else
  {
    Serial.print(F("INVALID"));
  }

  Serial.print(F(" "));
  if (gps.time.isValid())
  {
    if (gps.time.hour() < 10) Serial.print(F("0"));
    Serial.print(gps.time.hour());
    Serial.print(F(":"));
    if (gps.time.minute() < 10) Serial.print(F("0"));
     Serial.print(gps.time.minute());
    Serial.print(F(":"));
    if (gps.time.second() < 10) Serial.print(F("0"));
    Serial.print(gps.time.second());
    Serial.print(F("."));
    if (gps.time.centisecond() < 10) Serial.print(F("0"));
    Serial.print(gps.time.centisecond());
  }
  else
  {
    Serial.print(F("INVALID"));
  }

  Serial.println();
}
