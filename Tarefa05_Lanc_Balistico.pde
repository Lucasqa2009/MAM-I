float t=0;
float distVert;
float vHor0 = 25;
float vVert0 = -105;
float grav = 10;

void setup() 
{
  size(600, 600);
  background(230, 200, 50);
  mostraGrid();

  //Calcula a distância do chão na vertical
  distVert = 600 + MRUV(vVert0, grav, t);

  //Desenha a bola
  fill(75, 75, 200);
  ellipse(MRU(vHor0, t), distVert, 30, 30);

  mostraTexto();

  //Atualiza o tempo
  t++;
}    

void draw() 
{
  background(230, 200, 50);
  mostraGrid();

  //Calcula a distância do chão na vertical
  distVert = 600 + MRUV(vVert0, grav, t);

  //Desenha a bola
  fill(75, 75, 200);
  ellipse(MRU(vHor0, t), distVert, 30, 30);

  mostraTexto();

  //Atualiza o tempo
  if(distVert <= 600)
  {
    t++;
  }
}







//Funções

float MRUV(float v, float a, float t)
{  
  //Cálculo da distância no MRUV
  float dMRUV;
  dMRUV = v*t/60 + a*(t/60)*(t/60)/2;
  return dMRUV;
}

float MRU(float v, float t)
{  
  //Cálculo da distância no MRU
  float dMRU;
  dMRU = v*t/60;
  return dMRU;
}

void mostraGrid()
{
  //Grade
  for (int i = 0; i < 12; i++)
  {
    line(i * 50, 0, i * 50, 600);
    line(0, i * 50, 600, i* 50);
  }

  //Mensura vertical da grade
  textSize(10);
  fill(0);
  int gradeDistHor = 50;
  for (int i = 50; i <= 600; i+=50)
  {
    text(gradeDistHor, 0, i);
    gradeDistHor += 50;
  }

  //Mensura horizontal da grade
  int gradeDistVert = 50;
  for (int i = 30; i <= 600; i+=50)
  {
    text(gradeDistVert, i, 10);
    gradeDistVert += 50;
  }
}

void mostraTexto()
{
  //Calcula a velocidade vertical num dado tempo
  float vVertFinal = vVert0 + (grav * t/60);

  //Calcula a velocidade resultante num dado tempo
  float vResultante = sqrt(sq(vVertFinal) + sq(vHor0));

  //Escreve em Strings os valores dos vetores que atuam na bola
  String s = "Vel. Resultante: " + nf(vResultante, 0, 2) + " m/s";
  String s2 = "Vel. Vertical: " + nf(vVertFinal, 0, 2) + " m/s";
  String s3 = "Vel. Horizontal: " + nf(vHor0, 0, 2) + " m/s";
  String s4 = "Gravidade: " + nf(grav, 0, 2) + "m/s²";
  String s5 = "Tempo: " + nf(t/60, 0, 2) + "seg.";
  
  //Checa se o texto ainda aparece na tela
  float auxHor = 0;
  float auxVert = 0;
  if (MRU(vHor0, t) > 365)
    auxHor = 250;
  if (distVert < 110)
    auxVert = 115;
    
  textSize(16);
  fill(0, 0, 100);
  text(s, MRU(vHor0, t) + 25 - auxHor, distVert - 78 + auxVert);
  fill(100, 0, 0);
  text(s2, MRU(vHor0, t) + 25 - auxHor, distVert - 63 + auxVert);
  fill(0, 0, 0);
  text(s3, MRU(vHor0, t) + 25 - auxHor, distVert - 48 + auxVert);
  fill(25, 0, 25);
  text(s4, MRU(vHor0, t) + 25 - auxHor, distVert - 33 + auxVert);
  fill(0, 0, 50);
  text(s5, MRU(vHor0, t) + 25 - auxHor, distVert - 18 + auxVert);
}
