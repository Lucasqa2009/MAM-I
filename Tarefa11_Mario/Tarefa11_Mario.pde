PImage marioParado, marioMartelando, marioPulando01, marioPulando02, background, chao;
float compImgMario = 300;

final int marioPARADO = 0;
final int marioMARTELANDO = 1;
final int marioPULANDO = 2;
final int marioMARTELA_PULANDO = 3;
final int marioPULA_MARTELANDO = 4;
int estadoMario = marioPARADO;

float posYMario;

int tempo = 0;
int delay = 0;
int tempoNoAr = 0;
int delayNoAr = 30;

int sombraComp = 90;
int sombraLarg = 25;

void setup()
{
  size(600, 600);
  marioParado = loadImage("MarioPARADO.png");
  marioMartelando = loadImage("MarioMARTELANDO.png");
  marioPulando01 = loadImage("MarioPULANDO001.png");
  marioPulando02 = loadImage("MarioPULANDO002.png");
  background = loadImage("background.png");

  posYMario = (height/2) - 55;
}

void draw()
{
  background(200);
  //Cenário
  image(background, 0, 0);

  //Sombra
  fill(80, 160, 80);
  noStroke();
  ellipse(width/2, 473, sombraComp, sombraLarg);
  //Mário
  MEFMario();
  mostraMario();
}

void MEFMario()
{

  switch(estadoMario)
  {
  case marioPARADO:
    if (keyPressed)
    {
      if (key == ' ')
      {

        estadoMario = marioMARTELANDO;
        delay = 60;
      } else if (keyCode == UP)
      {

        estadoMario = marioPULANDO;
      }
    }

    break;

  case marioMARTELANDO:
    tempoNoAr++;
    if (tempoNoAr >= delayNoAr)
    {
      estadoMario = marioPARADO;
      tempoNoAr = 0;
    }    

    if (keyPressed && keyCode == UP)
    {
      estadoMario = marioPULA_MARTELANDO;
      tempoNoAr = 0;
    }

    fill(80, 160, 80);
    noStroke();
    ellipse(width/2 - 50, 473, sombraComp, sombraLarg);

    break;

  case marioPULANDO:
    //Delay para ele voltar ao parado
    tempoNoAr++;
    if (tempoNoAr >= delayNoAr)
    {
      estadoMario = marioPARADO;
      tempoNoAr = 0;
      posYMario = (height/2) - 45;
    }

    //Faz o Mário subir e descer
    if (tempoNoAr < 15)
    {
      posYMario -= 8;
      sombraComp -= 4;
      sombraLarg -=1;
    } else
    {
      posYMario += 8;
      sombraComp += 4;
      sombraLarg +=1;
    }

    if (keyPressed && key == ' ')
    {
      estadoMario = marioMARTELA_PULANDO;
    }
    break;

  case marioMARTELA_PULANDO:

    //Delay para ele voltar ao parado
    tempoNoAr++;
    if (tempoNoAr >= delayNoAr)
    {
      estadoMario = marioPARADO;
      tempoNoAr = 0;      
      posYMario = (height/2) - 45;
    }

    //Faz o Mário subir e descer
    if (tempoNoAr < 15)
    {
      posYMario -= 8;
      sombraComp -= 4;
      sombraLarg -=1;
    } else
    {
      posYMario += 8;
      sombraComp += 4;
      sombraLarg +=1;
    }
    break;
  case marioPULA_MARTELANDO:

    //Delay para ele voltar ao parado
    tempoNoAr++;
    if (tempoNoAr >= delayNoAr)
    {
      estadoMario = marioPARADO;
      tempoNoAr = 0;      
      posYMario = (height/2) - 45;
    }

    //Faz o Mário subir e descer
    if (tempoNoAr < 15)
    {
      posYMario -= 8;
      sombraComp -= 4;
      sombraLarg -=1;
    } else
    {
      posYMario += 8;
      sombraComp += 4;
      sombraLarg +=1;
    }
    break;
  }
}

void mostraMario()
{
  switch(estadoMario)
  {
  case marioPARADO:
    image(marioParado, (width/2) - (compImgMario/2), posYMario);
    break;
  case marioMARTELANDO:
    image(marioMartelando, (width/2) - (compImgMario/2), posYMario);
    break;
  case marioPULANDO:
    if (posYMario >= (height/2) - 80)
      image(marioPulando01, (width/2) - (compImgMario/2), posYMario);
    else
      image(marioPulando02, (width/2) - (compImgMario/2), posYMario);
    break;
  case marioMARTELA_PULANDO:
    image(marioMartelando, (width/2) - (compImgMario/2), posYMario);
    break;
  case marioPULA_MARTELANDO:
    image(marioMartelando, (width/2) - (compImgMario/2), posYMario);
    break;
  }
}
