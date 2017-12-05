 import processing.serial.*;
import co.jimezam.util.Dialogo;
String[] serialPorts;
Serial myPort;
float tiempo,tiempo1,tiempo2,largob=0.1,V1=0,V2=0;
int n=0,m=0;
String SHIT,str2="1000";
PImage bg,cuadro,b3s, boton2,cuadrosel,b3,cuadrob;

void setup() 
  {
    serialPorts = Serial.list(); //Get the list of tty interfaces
  for( int i=0; i<serialPorts.length; i++){ //Search for ttyACM*
    if( serialPorts[i].contains("COM") ){  //If found, try to open port.
                println(serialPorts[i]);
      try{
        myPort = new Serial(this, serialPorts[i], 115200);
        myPort.bufferUntil(10);
      }
      catch(Exception e){
      }}}
    cuadrosel= loadImage("cuadrosel.jpg");
    cuadro= loadImage("cuadro.png");
    cuadrob= loadImage("cuadrob.png");
    bg = loadImage("Interfaz2.jpg");
    //bg = loadImage("Interfaz.jpg");
    b3s = loadImage("b3s.png");
    b3 = loadImage("b3.png");
    boton2 = loadImage("b2.png");
    background(bg);
    size(401, 283);
    //myPort = new Serial(this, "COM4", 115200);
    textSize(26);
    text(largob,173,44);
    tiempo1=0;
    tiempo2=0;
  }

void draw() 
  {
sombrear ();
     while (myPort.available() > 0) 
     {
       SHIT=myPort.readString();
       fill(0);
       char a=SHIT.charAt(0);
       SHIT=SHIT.substring(1);
       if (a=='A')
       {
           image(cuadrosel, 32, 95);
           textSize(26);
           if(m==1){
           image(cuadro,32,95);
           tiempo= parseInt(SHIT);
           tiempo1=tiempo/1000;
           V1=largob/tiempo1;
           text(tiempo1,60,150);text(V1,60,220);m=0;}else{m++;}
          
           
       }
       else if (a=='B')
       { 
             image(cuadrosel, 221, 95);
             textSize(26);
             if(n==1){
             image(cuadro, 221, 95);
             tiempo= parseInt(SHIT);
             tiempo2=tiempo/1000;
             V2=largob/tiempo2;
             text(tiempo2,249,150);text(V2,249,220);n=0;}else{n++;}
             
        }
     
     }
  }
void sombrear (){
  if(mouseX>=48 && mouseX<=153)
 {
   if(mouseY>=13 && mouseY<=52)
    {image(b3,0,0);}else{image(b3s,0,0);}}else{image(b3s,0,0);}}
void mousePressed ()
{
  if(mouseX>=48 && mouseX<=153)
 {
   if(mouseY>=13 && mouseY<=52)
    { 
      String str1 =  Dialogo.preguntar("Largo Bandera", "Introduzca el largo de la bandera (mm)");
      if(str1==null){str1=str2;}
      else if (str1==""){str1=str2;}
      else{
        str2=str1;
        largob = parseInt(str2);
        image(cuadrob, 159,1);
        textSize(26);
        largob=largob/10000;
        text(largob,173,44);}}
  }
  }