int blocosLinha = 5;
int blocosColuna = 5;

int posInicialX = 50;
int posInicialY = 50;
void setup()
{
  size(600, 600);
  //Chama o comando de replicação
  replicar();
}

//Funções criadas

//Replica os blocos, com as linhas e colunas da entrada
void replicar()
{
  //Pula para a próxima linha, 
  //sempre que todos os blocos de uma forem colocados
  //formando uma coluna
  for (int i = 0; i < blocosColuna; i++)
  {
    //Coloca o número de blocos em uma linha
    for (int z = 0; z < blocosLinha; z++)
    {
      bloco(posInicialX, posInicialY);
      posInicialX += 100;
    }
    posInicialY += 100;
    posInicialX = 50;
  }
}

void bloco(int x, int y)    //Cria um bloco com os círculos
{
  //Tamanho da elipse exterior
  int tamanhoEllipse = 100;
  //Desenha um quadrado colorido aleatoriamente
  fill(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
  rect(x-50, y-50, 100, 100);
  //Laço que gera 3 círculos, do tamanho maior para o menor
  for (int i = 0; i<3; i++)
  {    
    fill(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
    ellipse(x, y, tamanhoEllipse, tamanhoEllipse);
    //Define um novo tamanho para as elipses, menor que a gerada anteriormente
    tamanhoEllipse = int(random(20, tamanhoEllipse -10));
  }
}
