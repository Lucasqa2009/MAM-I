void mostraChar()
{
  switch(estado)
  {
  case BAIXO:
    baixo.display();
    break;
  case CIMA:
    cima.display();
    break;
  case ESQ:
    esquerda.display();
    break;
  case DIR:
    direita.display();
    break;
  case DR:
    baixo_dir.display();
    break;
  case DL:
    baixo_esq.display();
    break;
  case UR:
    cima_dir.display();
    break;
  case UL:
    cima_esq.display();
    break;
  }
}

void desenhaSombra()
{
  fill(50, 0, 0);
  noStroke();
  ellipse(posX + 32, posY + 52, 30, 5);
}

void MEF()
{
  //Se estiver apertando para baixo
  if (keys[0] && !keys[1])
  {
    //e também para a direita
    if (keys[0] && keys[2])
    {
      estado = DR;
    } 
    //ou também para esquerda
    else if (keys[0] && keys[3])
    {
      estado = DL;
    }
    //ou só pra baixo mesmo
    else
    {
      estado = BAIXO;
    }

    //movimentação no eixo
    if (posY <= height - 75)
      posY += 5;
  } 
  //Se estiver apertando para cima
  if (keys[1] && !keys[0])
  {
    //e também para a direita
    if (keys[1] && keys[2])
    {
      estado = UR;
    } 
    //ou também para esquerda
    else if (keys[1] && keys[3])
    {
      estado = UL;
    } 
    //ou só pra cima mesmo
    else
    {
      estado = CIMA;
    }
    
    //movimentação no eixo
    if (posY >= 40)
      posY -= 5;
  } 
  //Se estiver apertando para direita
  if (keys[2] && !keys[3])
  {
    //e também para a baixo
    if (keys[0] && keys[2])
    {
      estado = DR;
    } 
    //ou também para cima
    else if (keys[1] && keys[2])
    {
      estado = UR;
    } 
    //ou só para direita mesmo
    else
    {
      estado = DIR;
    }
    
    //movimentação no eixo
    if (posX <= width - 70)
      posX += 5;
  }
  //Se estiver apertando para esquerda 
  if (keys[3] && !keys[2])
  {
    //e também para a baixo
    if (keys[0] && keys[3])
    {
      estado = DL;
    } 
    //ou também para cima
    else if (keys[1] && keys[3])
    {
      estado = UL;
    }
    //ou só para esquerda mesmo
    else
    {
      estado = ESQ;
    }
    
    //movimentação no eixo
    if (posX >= 5)
      posX -= 5;
  }
}
