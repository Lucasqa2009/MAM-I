//possíveis animações
Animacao baixo;
Animacao cima;
Animacao esquerda;
Animacao direita;
Animacao cima_esq;
Animacao cima_dir;
Animacao baixo_esq;
Animacao baixo_dir;

//posição do player
int posX;
int posY;

//estados
final int BAIXO = 0;
final int ESQ = 1;
final int DIR = 2;
final int CIMA = 3;
final int DR = 4;
final int DL = 5;
final int UR = 6;
final int UL = 7;
int estado = BAIXO;

//configura o mapa
PImage [] chao = new PImage [12];
int tamanhoTile = 48;
int [][] mapa = {{1, 2, 3, 1, 2, 3, 1, 2, 3, 1}, 
  {4, 5, 5, 5, 5, 5, 5, 5, 5, 6}, 
  {7, 0, 0, 0, 0, 0, 0, 0, 0, 8}, 
  {7, 0, 0, 0, 0, 0, 0, 0, 0, 8}, 
  {7, 0, 0, 0, 0, 0, 0, 0, 0, 8}, 
  {7, 0, 0, 0, 0, 0, 0, 0, 0, 8}, 
  {7, 0, 0, 0, 0, 0, 0, 0, 0, 8}, 
  {7, 0, 0, 0, 0, 0, 0, 0, 0, 8}, 
  {7, 0, 0, 0, 0, 0, 0, 0, 0, 8}, 
  {9, 10, 10, 10, 10, 10, 10, 10, 10, 11}};

//vetor das teclas pressionadas
boolean [] keys;

void setup()
{
  size(480, 480);
  
  //posição inicial do personagem
  posX = width/2 - 32;
  posY = height/2 - 32;

  //cria espaços para a animação de cada estado
  baixo = new Animacao("charDown", 0);
  cima = new Animacao("charUp", 1);
  direita = new Animacao("charRight", 2);
  esquerda = new Animacao("charLeft", 3);
  cima_esq = new Animacao("charUp_Left", 1);
  cima_dir = new Animacao("charUp_Right", 1);
  baixo_esq = new Animacao("charDown_Left", 0);
  baixo_dir = new Animacao("charDown_Right", 0);

  //carrega as animações de cada estado
  baixo.carregaSprite();  
  cima.carregaSprite();  
  direita.carregaSprite();
  esquerda.carregaSprite();
  cima_esq.carregaSprite();
  cima_dir.carregaSprite();
  baixo_dir.carregaSprite();
  baixo_esq.carregaSprite();

  //configurando os sprites do mapa
  for (int i = 0; i < chao.length; i++)
  {
    chao[i] = loadImage("tile" + nf(i, 3, 0) + ".png");
  }
  
  //configurando as teclas pressionadas
  keys = new boolean [4];
  for (int i = 0; i < keys.length; i++)
  {
    keys[i] = false;
  }
}

void draw()
{
  mostraMapa();
  desenhaSombra();
  mostraChar();
  MEF();
}



//transforma em true os elementos do vetor das teclas apertadas
void keyPressed()
{
  if (keyCode == DOWN)
  {
    keys[0] = true;
  }
  if (keyCode == UP)
  {
    keys[1] = true;
  }
  if (keyCode == RIGHT)
  {
    keys[2] = true;
  }
  if (keyCode == LEFT)
  {
    keys[3] = true;
  }
}

//transforma em false os elementos do vetor das teclas apertadas
void keyReleased()
{
  if (keyCode == DOWN)
  {
    keys[0] = false;
  }
  if (keyCode == UP)
  {
    keys[1] = false;
  }
  if (keyCode == RIGHT)
  {
    keys[2] = false;
  }
  if (keyCode == LEFT)
  {
    keys[3] = false;
  }
}


void mostraMapa()
{
  for (int i = 0; i < mapa.length; i++)
    for (int j = 0; j < mapa[i].length; j++)
    {
      image(chao[mapa[i][j]], j*tamanhoTile, i*tamanhoTile, tamanhoTile, tamanhoTile);
    }
}
