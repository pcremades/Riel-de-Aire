#include <SPI.h>
#include <Adafruit_GFX.h>
#include <Adafruit_PCD8544.h>

Adafruit_PCD8544 display = Adafruit_PCD8544(8, 7, 6, 5, 4);

int IRD1=2, IRD2 = 3, IRE1=12, IRE2=11;
float evento1=0, evento2 =0, duracion=0;
boolean estadoc1, estadoc2, estadoc01=0, estadoc02=0; 
String msj;
int m=0,n=0,c=0;

void setup() {
  
  display.begin();
  display.setContrast(50);
  display.display(); 
  Serial.begin(115200); 
  pinMode(IRD1, INPUT_PULLUP);
  pinMode(IRD2, INPUT_PULLUP);
  pinMode(IRE2, OUTPUT);
  pinMode(IRE1, OUTPUT); 
  pinMode(13, OUTPUT); 
  digitalWrite(IRE1, HIGH); 
  digitalWrite(IRE2, HIGH);
  delay(1000);
  display.clearDisplay();
  display.display();
  display.setCursor(0,0);
  display.println("Compuerta A:");
  display.setCursor(0,8);
  display.println("T:      (s)");
  display.setCursor(0,16);
  display.println("V:      (m/s)");
  display.setCursor(0,24);
  display.println("Compuerta B:");
    display.setCursor(0,32);
  display.println("T:      (s)");
  display.setCursor(0,40);
  display.println("V:      (m/s)");
  display.display();
}

void loop() {
  estadoc1=digitalRead (IRD1);
  estadoc2=digitalRead (IRD2);
  digitalWrite(13, !estadoc1);
  
      if (estadoc1!=estadoc01)
      {
        if(n==0){
            evento1=millis();
            msj="A";//msj sirve para identificar las puertas al comunicarse con procesing
            Serial.println(msj);
            n++;
            }else if(n==1){
                      evento2=millis();
                      duracion=(evento2-evento1);
                      msj="A";
                      msj.concat(duracion);
                      display.setCursor(10,8);
                      display.setTextColor(BLACK, WHITE);
                      display.println(duracion/1000.000);
                      display.setCursor(10,16);
                      display.println(0.1/(duracion/1000.000));//0.1m largo de la bandera
                      display.display();
                      Serial.println(msj);
                      n=0;
            }
                  
        }
      estadoc01=estadoc1;    
      if (estadoc2!=estadoc02)
      {
        if(m==0){
            evento1=millis();
            msj="B";
            Serial.println(msj);
            m++;
            }else if(m==1){
                      evento2=millis();
                      duracion=evento2-evento1;
                      msj="B";
                      msj.concat(duracion);
                      display.setCursor(10,32);
                      display.setTextColor(BLACK, WHITE);
                      display.println(duracion/1000.000);
                      display.setCursor(10,40);
                      display.println(0.1/(duracion/1000.000));
                      display.display();
                      Serial.println(msj);
                      m=0;
            }
                  
        }
      estadoc02=estadoc2;
}
