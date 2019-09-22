float t = 0;
float v = 10;
void setup() {
  size(600, 600);
  
  float d = MRU(v, t);
  background(230, 200, 50);
  mostraGrid();
  
  //Desenha a bolinha
  fill(80, 0, 200);
  ellipse(d, 275, 20, 20);
  
  //Mostra na tela o valor das variáveis
  mostraTexto(d, v, t/60);
  t++;
} 

void draw()
{    
  float d = MRU(v, t);
  background(230, 200, 50);
  mostraGrid();
  println("Tempo: " + nf(t/60, 0, 2) + ";", "  Distância: " + nf(d, 0, 2));
  
  //Desenha a bolinha
  fill(80, 0, 200);
  ellipse(d, 275, 20, 20);
  
  //Mostra na tela o valor das variáveis
  mostraTexto(d, v, t/60);
  if(d < 600)                //Garante que a aplicação pare quando chegar na posX 600
  {    
    t++;
  }
}







//Funções e procedimentos

float MRU(float v, float t) 
{
  float d = v*(t/60);
  return d;
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

void mostraTexto(float dist, float veloc, float tempo)
{
  int distAux = 0;
  String s = "Distância: " + nf(dist, 0, 2) + "m";
  String s2 = "Tempo: " + nf(tempo, 0, 2) + "s";
  String s3 = "Velocidade: " + nf(veloc, 0, 2) + "m/s";
  
  //Corrige a posição do texto no final
  if(dist > 425)
    distAux = -175;
  textSize(16);
  fill(0, 0, 100);
  text(s, dist + distAux, 314);
  fill(100, 0, 0);
  text(s2, dist + distAux, 332);
  fill(0, 0, 0);
  text(s3, dist + distAux, 350);
}
