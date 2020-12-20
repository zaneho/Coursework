//REFERENCE: 
//  https://github.com/EnvironmentMonitor/Pulse-Sensor-ESP8266-ADC0, 
//  http://www.martyncurrey.com/hm-10-bluetooth-4ble-modules/
//  https://github.com/WorldFamousElectronics/Fritzing_PulseSensor_Files

#include <Ticker.h>
#include <SoftwareSerial.h>

SoftwareSerial mySerial(5, 4); // RX, TX 
Ticker flipper;

// these variables are volatile because they are used during the interrupt service routine!
volatile int BPM;                   // used to hold the pulse rate
volatile int Signal;                // holds the incoming raw data
volatile int IBI = 600;             // holds the time between beats, must be seeded! 
volatile boolean Pulse = false;     // true when pulse wave is high, false when it's low
volatile boolean QS = false;        // becomes true when Arduoino finds a beat.


void setup(){
  Serial.begin(9600);            
  mySerial.begin(9600);

  //setting the pulse sender as the central device and then pair it to the pulse receiver
  mySerial.print("AT+IMME1" );
  delay(1000);    
  mySerial.print("AT+ROLE1" );
  delay(1000);
  mySerial.print("AT+COND436399CC02A" );
  delay(1000);
  
  interruptSetup();             
}

void loop(){
    String c;
  //sendDataToProcessing('S', Signal);     // send Processing the raw Pulse Sensor data
  if (QS == true){                       // Quantified Self flag is true when arduino finds a heartbeat
        sendDataToProcessing('B',BPM);   // send heart rate with a 'B' prefix
          // send time between beats with a 'Q' prefix
        QS = false;                      // reset the Quantified Self flag for next time    
     }

  if (Serial.available()) {
    c = Serial.read();
    mySerial.print(c);
  }
  if (mySerial.available()) {
    c = mySerial.read();
    Serial.println(c);    
  }
  
  delay(10);                       
}

void sendDataToProcessing(char symbol, int data ){
  //mySerial.print(symbol);                // symbol prefix tells Processing what type of data is coming
  Serial.write(data);                // the data to send culminating in a carriage return
  mySerial.print(String(data) + "Z");
}
