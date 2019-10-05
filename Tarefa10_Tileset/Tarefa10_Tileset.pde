PImage [] grama;
PImage [] planta;

int [][] desnivelAleat;

int [][] mapa = {
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}};

float tamanho = 100;

void setup()
{
  size(800, 800);
  background(0, 0, 50);  
  
  //configura a obtenção das imagens
  grama = new PImage [30];
  planta = new PImage[16];
  desnivelAleat = new int [10][10];

  for (int i = 0; i < grama.length; i++)
  {
    grama[i] = loadImage("tile" + nf(i, 3, 0) + ".png");
  }  
  for (int i = 0; i < planta.length; i++)
  {
    planta[i] = loadImage("planta" + nf(i, 3, 0) + ".png");
  }
  
  aleatorizaAltura();
  aleatorizaTiles();
}

void draw()
{
  background(0, 0, 50);
  desenhaMapa();
}

void keyPressed()
{
  if (key == ' ')
  {
    aleatorizaAltura();
    aleatorizaTiles();
  }
}

void desenhaMapa()
{
  for (int i = 0; i < mapa.length; i++)
    for (int j = 0; j < mapa[i].length; j++)
    {
      image(grama[mapa[i][j]], width/2 - tamanho/2 - i*37 + j*37, 200 + i *18.5 + j * 18.5 - desnivelAleat[i][j], tamanho, tamanho);
      
      //dá uma variedade às plantas e aos blocos em que elas surgem
      if (mapa[i][j] == 0 ||mapa[i][j] == 1)
        image(planta[8], width/2 - tamanho/2 - i*37 + j*37, 200 + i *18.5 + j * 18.5  - 25 - desnivelAleat[i][j], tamanho, tamanho);
      if (mapa[i][j] == 26 ||mapa[i][j] == 3)
        image(planta[15], width/2 - tamanho/2 - i*37 + j*37, 200 + i *18.5 + j * 18.5  - 25 - desnivelAleat[i][j], tamanho, tamanho);
      if (mapa[i][j] == 8 ||mapa[i][j] == 5)
        image(planta[5], width/2 - tamanho/2 - i*37 + j*37, 200 + i *18.5 + j * 18.5  - 25 - desnivelAleat[i][j], tamanho, tamanho);
      if (mapa[i][j] == 18 ||mapa[i][j] == 21 || mapa[i][j] == 13)
        image(planta[2], width/2 - tamanho/2 - i*37 + j*37, 200 + i *18.5 + j * 18.5  - 25 - desnivelAleat[i][j], tamanho, tamanho);
    }
}

//Aleatoriza o tile que será mostrado, alterando o valor no vetor mapa
void aleatorizaTiles()
{
  for (int i = 0; i < mapa.length; i++)
    for (int j = 0; j < mapa[i].length; j++)
    {
      mapa[i][j] = int(random(0, 30));
    }
}

//Guarda desníveis para serem usados no desenhaMapa(), sem isso, estaria mudando o denível dos blocos a todo momento
void aleatorizaAltura()
{
  for (int i = 0; i < desnivelAleat.length; i++)
    for (int j = 0; j < desnivelAleat[i].length; j++)
    {
      desnivelAleat[i][j] = int(random(0, 30));
    }
}
