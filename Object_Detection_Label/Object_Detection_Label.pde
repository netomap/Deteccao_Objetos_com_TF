PImage img;

int x0, x1, y0, y1, xi, xf, yi, yf;
char label = '*';

String project_dir = "C:/Users/manuel/Documents/GitHub/Deteccao_Objetos_com_Keras_TF/Object_Detection_Label/";
String images_dir = project_dir + "images/";
String labels_file = project_dir + "labels.txt";

File dir;
File [] images;

int indiceAtual = -1;
String caminhoAtual;
String nomeAtual;

import java.io.FileWriter;
import java.io.*;
FileWriter fw;
BufferedWriter bw;

void setup(){
  size(800, 600);
  dir = new File(images_dir);
  images = dir.listFiles();
  atualizaImagem(1);
  resetarVariaveis();
}

void draw(){
  background(255);
  image(img, 0, 0);
  desenhaRetangulo();
}

void desenhaRetangulo(){
  noFill();
  strokeWeight(2);
  stroke(255,0,0);
  rect(xi,yi, (xf-xi), (yf-yi));
  stroke(0,255,0);
  rect(x0,y0, (x1-x0), (y1-y0));
}

void keyPressed(){
  if (keyCode == 32){ //se for espaço, entao reseta os valores das variáveis
    resetarVariaveis();
  }else if(keyCode == 39){ //seta para direita
    atualizaImagem(1);
  }else if(keyCode == 37){ // seta para esquerda
    atualizaImagem(-1);
  }else{
    label = key;
    prepararDadosESalvar();
  }
  println(keyCode);
}

void prepararDadosESalvar(){
  try {
    File file =new File(labels_file);
    if (!file.exists()) {
      file.createNewFile();
    }
 
    FileWriter fw = new FileWriter(file, true);///true = append
    BufferedWriter bw = new BufferedWriter(fw);
    PrintWriter pw = new PrintWriter(bw);
    
    x0 = min(xi, xf); y0 = min(yi, yf);
    x1 = max(xi, xf); y1 = max(yi, yf);
    if (x0 < 0){x0=0;}
    if (y0 < 0){y0=0;}
    if (x1 > img.width){x1=img.width;}
    if (y1 > img.height){y1=img.height;}
    
    String conteudo = nomeAtual + ";" + x0 + ";" + y0 + ";" + x1 + ";" + y1 + ";" + label;
        
    pw.write(conteudo);
    pw.write("\n");
    pw.close();
  }
  catch(IOException ioe) {
    System.out.println("Exception ");
    ioe.printStackTrace();
  }
}

void mousePressed(){
  if (mouseButton == LEFT){
    xi = mouseX;
    yi = mouseY;
  }
}

void mouseDragged(){
  xf = mouseX;
  yf = mouseY;
}

void atualizaImagem(int step){
  indiceAtual += step;
  if (indiceAtual <= 0){indiceAtual = 0;}
  if (indiceAtual > images.length-1){indiceAtual = images.length-1;}
  caminhoAtual = images[indiceAtual].getAbsolutePath();
  nomeAtual = caminhoAtual.substring(images_dir.length());
  img = loadImage(caminhoAtual);
  resetarVariaveis();
}

void resetarVariaveis(){
  x0=0;y0=0;x1=0;y1=0;xi=0;yi=0;xf=0;yf=0;label='*';
}
