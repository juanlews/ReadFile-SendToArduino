/**
 * LoadFile 1
 * 
 * Carrega um arquivo texto
 * A new pair of numbers is loaded each frame and used to draw a point on the screen.
 */

String[] lines, convertedLines;
int index = 0, indexHex = 0;
int A = -69;
int B = -69;
boolean atribuido = false, carregado = false;

String AHex = "", BHex = "", opHex = "";

String operacao = "";
StringList toSave = new StringList();

import processing.serial.*;
Serial port;

void setup() {
  size(200, 200);
  background(0);
  stroke(255);
  frameRate(12);
  String portName = Serial.list()[0];
  port = new Serial(this, portName, 9600);

  lines = loadStrings("txt.txt");
  
}

void draw() {
  if (index < lines.length) {
    String[] pieces = split(lines[index], ';');
    if (pieces.length == 2) {
      
      String x = (pieces[0]) ;
      
      
      
      String[] atrib = split(x, '=');
      
      if ( atrib.length == 2 ){
        if(atrib[0].equals( "A" )) {
          A = parseInt( unhex( atrib[1].toString() ) );
          AHex = hex(A, 1);
        }
        if( atrib[0].equals( "B" )) {
          B = parseInt( unhex( atrib[1].toString() ));
          BHex = hex(B, 1);
        }
         
      } else if(atrib.length == 1){
          operacao = (atrib[0].toLowerCase());
          if( A == -69 || B == -69 ){
            println("não vai rolar, atribua valores pra A e B");
            
          }
          else if( operacao.equals( ("An").toLowerCase() ) ){
              opHex = hex(0, 1);
              atribuido = false;
          } 
          else if( operacao.equals( ("nAoB").toLowerCase() ) ){
              opHex = hex(1, 1);
              atribuido = false;
          } 
          else if( operacao.equals( ("AnB").toLowerCase() ) ){
              opHex = hex(2, 1);
              atribuido = false;
          } 
          else if( operacao.equals( ("zeroL").toLowerCase() ) ){
              opHex = hex(3, 1);
              atribuido = false;
          } 
          else if( operacao.equals( ("nAeB").toLowerCase() ) ){
              opHex = hex(4, 1);
              atribuido = false;
          } 
          else if( operacao.equals( ("Bn").toLowerCase() ) ){
              opHex = hex(5, 1);
              atribuido = false;
          } 
          else if( operacao.equals( ("AxB").toLowerCase() ) ){
              opHex = hex(6, 1);
              atribuido = false;
          } 
          else if( operacao.equals( ("ABn").toLowerCase() ) ){
              opHex = hex(7, 1);
              atribuido = false;
          } 
          else if( operacao.equals( ("AnoB").toLowerCase() ) ){
              opHex = hex(8, 1);
              atribuido = false;
          } 
          else if( operacao.equals( ("nAxB").toLowerCase() ) ){
              opHex = hex(9, 1);
              atribuido = false;
          } 
          else if( operacao.equals( ("B").toLowerCase() ) ){
              opHex = hex(10, 1);
              atribuido = false;
          } 
          else if( operacao.equals( ("AB").toLowerCase() ) ){
              opHex = hex(11, 1);
              atribuido = false;
          } 
          else if( operacao.equals( ("umL").toLowerCase() ) ){
              opHex = hex(12, 1);
              atribuido = false;
          } 
          else if( operacao.equals( ("AoBn").toLowerCase() ) ){
              opHex = hex(13, 1);
              atribuido = false;
          } 
          else if( operacao.equals( ("AoB").toLowerCase() ) ){
              opHex = hex(14, 1);
              atribuido = false;
          } 
          else if( operacao.equals( ("A").toLowerCase() ) ){
              opHex = hex(15, 1);
              atribuido = false;
          }   
          if(!atribuido && A != -69 && B != -69){
             println(AHex, BHex, opHex);
             toSave.append( AHex + "" + BHex + "" + opHex);
             atribuido = true;
          }
             
        }
      }
    // Go to the next line for the next run through draw()
    index = index + 1;
  }else{
    if(!carregado){
      saveStrings("testeularomhex", toSave.array());
      carrega();
    }
  }
}


void keyPressed(){
  if(carregado){
    if( keyCode == ENTER ){
      if(indexHex < convertedLines.length){
        String[] linhahex = split(convertedLines[indexHex], '\n');
        port.write(linhahex[0]+"\n");
        println(linhahex[0]);
        println(port.readString());
        indexHex++;
      }
    }
  }
}

void carrega(){
    
    convertedLines = loadStrings("testeularomhex");
    carregado = lines.length > 0 ? true:false ;
    
}
