//Variáveis de posição dos players
int posP1Y;
int posP2Y;
int posP1X;
int posP2X;

//Variáveis que remetem a bola
int bolaX;
int bolaY;
int bolaXAux = 10;
int bolaYAux = 0;
int diametro = 20;
int tempoBolaAux = 0;

//Variáveis do escore
int scoreP1 = 0;
int scoreP2 = 0;

//Lista de vetor para guardar as teclas que serão pressionadas
boolean [] keys;

void setup()
{
  size(800, 600);
  
  bolaY = height/2 + 100;
  bolaX = width/2;
  posP1Y = height/2 + 50;
  posP2Y = posP1Y;
  posP1X = width - 30;
  posP2X = 10;
  
  //configurando o "nome" e o valor das teclas que serão pressionadas
  keys = new boolean [4];
  for (int i = 0; i < keys.length; i++)
  {
    keys[i] = false;
  }
}

void draw()
{
  background(0);

  //UI  
  linhaTracejada();
  mostraScore();

  //Player1
  noStroke();
  rect(posP1X, posP1Y, 20, 100);
  movementP1();
  //Se o player está apertando para cima
  if (keys[0])
  {
    posP1Y -= 7;
  }
  //Se o player está apertando para baixo
  if (keys[1])
  {
    posP1Y += 7;
  }

  //Player2
  noStroke();
  rect(posP2X, posP2Y, 20, 100);
  movementP2();
  //Se o player está apertando para cima
  if (keys[2])
  {
    posP2Y -= 7;
  }
  //Se o player está apertando para baixo
  if (keys[3])
  {
    posP2Y += 7;
  }

  //Mostra os diferentes parâmetros do colisor dos players
  cores();

  //Bola
  ballMovement();
  spawnBola();
  fill(255);
  ellipse(bolaX, bolaY, diametro, diametro);
}

void keyPressed()
{
  if (keyCode == UP)
  {
    keys[0] = true;
  } 
  if (keyCode == DOWN)
  {
    keys[1] = true;
  }
  if (key == 'w' || key == 'W')
  {
    keys[2] = true;
  }
  if (key == 's' || key == 'S')
  {
    keys[3] = true;
  }
}

void keyReleased()
{
  if (keyCode == UP)
  {
    keys[0] = false;
  } 
  if (keyCode == DOWN)
  {
    keys[1] = false;
  }
  if (key == 'w' || key == 'W')
  {
    keys[2] = false;
  }
  if (key == 's' || key == 'S')
  {
    keys[3] = false;
  }
}

void cores()
{
  fill(255, 50, 50);
  rect(posP1X + 3, posP1Y + 3, 14, 12);
  rect(posP1X + 3, posP1Y + 85, 14, 12);
  rect(posP2X + 3, posP2Y + 3, 14, 12);
  rect(posP2X + 3, posP2Y + 85, 14, 12);

  fill(255, 150, 50);
  rect(posP1X + 3, posP1Y + 12, 14, 25);
  rect(posP1X + 3, posP1Y + 63, 14, 25);
  rect(posP2X + 3, posP2Y + 12, 14, 25);
  rect(posP2X + 3, posP2Y + 63, 14, 25);
  
  fill(200, 100, 250);
  rect(posP1X + 3, posP1Y + 37, 14, 10);
  rect(posP1X + 3, posP1Y + 53, 14, 10);
  rect(posP2X + 3, posP2Y + 37, 14, 10);
  rect(posP2X + 3, posP2Y + 53, 14, 10);

  fill(100, 100, 255);
  rect(posP1X + 3, posP1Y + 47, 14, 6);
  rect(posP2X + 3, posP2Y + 47, 14, 6);
}
