void ballMovement()
{
  //Incrementos de posição
  bolaX += bolaXAux;
  bolaY += bolaYAux;

  //Limites para bola em cima e em baixo
  if (bolaY < 210 + diametro/2 || bolaY > height - diametro/2)
  {
    bolaYAux*= -1;
  }
  
  //Caixas de colisão
  colisaoP1();
  colisaoP2();
}

void spawnBola()    //Spawna a bola novamente e atualiza o escore
{
  if (bolaX > width + diametro || bolaX < diametro)
  {
    int delay = 120;
    if(tempoBolaAux >= delay)
    {
      if(bolaX > width + diametro)
      {
        scoreP2++;
      }
      else
      {
        scoreP1++;
      }
      bolaX = width/2;
      bolaXAux *= -1;
      bolaYAux = 0;
      bolaY = height/2 + 100;
      tempoBolaAux = 0;
    }
    else
    {
      fill(150);
      ellipse(width/2, height/2 + 100, diametro, diametro);
    }
    tempoBolaAux++;
  }
}
