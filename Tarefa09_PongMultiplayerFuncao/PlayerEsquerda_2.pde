void movementP2()
{

  //Limites da movimentação
  if (posP2Y < 210)
  {
    posP2Y = 210;
  }
  if (posP2Y > height - 100)
  {
    posP2Y = height - 100;
  }
}

void colisaoP2()
{
  //Collider
  if (bolaX >= posP2X && bolaX <= (posP2X + 20 + diametro/2) && bolaY >= posP2Y && bolaY <= posP2Y + 100)
  {
    //se a bola colidir e a auxiliar X pro positiva, ela virará negativa
    if(bolaXAux < 0)
    {
      bolaXAux *= -1;
    }
    
    //Diferentes angulações para bola
    
    //Se tocar somente na parte superior da barra
    if (bolaY == posP2Y && bolaX > posP2X && bolaX < posP2X + 20 + diametro/2)
    {
      bolaYAux = -8;
    } 
    //Se tocar somente na parte inferior da barra
    else if (bolaY == posP2Y + 100 && bolaX > posP2X && bolaX < posP2X + 20 + diametro/2)
    {
      bolaYAux = 9;
    }
    //Demais angulações
    else if (bolaY >= posP2Y && bolaY <= posP2Y + 12)
    {
      bolaYAux = -8;
    } 
    else if (bolaY > posP2Y + 12 && bolaY < posP2Y + 37)
    {
      bolaYAux = -5;
    } 
    else if (bolaY >= posP2Y + 37 && bolaY <= posP2Y + 47)
    {
      bolaYAux = -2;
    } 
    else if (bolaY > posP2Y + 47 && bolaY < posP2Y + 53)
    {
      bolaYAux = 0;
    } 
    else if (bolaY >= posP2Y + 53 && bolaY <= posP2Y + 63)
    {
      bolaYAux = 2;
    } 
    else if (bolaY > posP2Y + 63 && bolaY < posP2Y + 88)
    {
      bolaYAux = 5;
    } 
    else if (bolaY >= posP2Y + 88 && bolaY <= posP2Y + 100)
    {
      bolaYAux = 8;
    }
  }
}
