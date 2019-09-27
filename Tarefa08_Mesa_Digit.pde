//Configs gerais
float k = 40; 
float compRect = 16 * k;
float largRect = 9 * k;
int diametro = 10;

//Configs do rastro de tinta
Tint [] tinta;
int currentIndex = 0;
int tintLength = 1000;

//Configs do ponteiro
final color NAOCLICOU = color(255, 100, 100);
final color CLICOU = color(150, 150, 255);
color corPonteiro = NAOCLICOU;

void setup()
{
  background(255, 200, 0);
  size(1200, 900);
  frameRate(300);

  //Desenha o retângulo no centro da tela
  rect((width/2) - compRect/2, (height/2) - largRect/2, compRect, largRect);

  //Cria espaços na memória para o caminho de tinta
  tinta = new Tint[tintLength];
  for (int i = 0; i < tinta.length; i++)
  {
    tinta[i] = new Tint();
  }
}

void draw()
{
  background(255, 200, 0);
  fill(255);
  stroke(0);
  strokeWeight(4);
  rect((width/2) - compRect/2, (height/2) - largRect/2, compRect, largRect);
  
  //Usando a função map() em X
  float mapX = map(mouseX, 0, width, 
    dist(0, 0, (width/2) - compRect/2, 0) + diametro/2, dist(0, 0, (width/2) + compRect/2, 0) - diametro/2);
  //Usando a função map() em Y
  float mapY = map(mouseY, 0, height, 
    dist(0, 0, (height/2) - largRect/2, 0) + diametro/2, dist(0, 0, (height/2) + largRect/2, 0) - diametro/2);
    
  mostraTinta(mapX, mapY);
  ponteiro(mapX, mapY);

  fill(255, 100, 100);
  ellipse(mouseX, mouseY, 25, 25);
}




void ponteiro(float mapXPont, float mapYPont)
{
  strokeWeight(1);
  fill(corPonteiro);
  stroke(0);
  strokeWeight(1);
  ellipse(mapXPont, mapYPont, diametro, diametro);
  line(mapXPont - diametro/2, mapYPont, mapXPont + diametro/2, mapYPont);
  line(mapXPont, mapYPont - diametro/2, mapXPont, mapYPont + diametro/2);
}

void mostraTinta(float posX, float posY)
{  
  //Checa se o mouse está sendo pressionado
  if (mousePressed)
  {
    corPonteiro = CLICOU;
    //Adiciona a informação de onde foi pintado ao vetor
    tinta[currentIndex].start(posX, posY);
    currentIndex++;
    if (currentIndex >= tintLength)
    {
      currentIndex = 0;
    }
  } else
  {
    corPonteiro = NAOCLICOU;
  }

  //Mostra na tela o caminho de tinta
  for (int i = 0; i < tinta.length; i++)
  {
    tinta[i].display();
  }
  fill(200, 100, 100);
}

//Classe Tinta
class Tint
{
  float x;
  float y;
  color cor = 0;

  void start(float posX, float posY)
  {
    x = posX;
    y = posY;
  }

  void display()
  {
    fill(cor);
    noStroke();
    ellipse(x, y, diametro, diametro);
  }
}
