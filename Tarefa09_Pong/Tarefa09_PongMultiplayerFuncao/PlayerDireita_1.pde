void movementP1()
{

  //Limites da movimentação
  if (posP1Y < 210)
  {
    posP1Y = 210;
  }
  if (posP1Y > height - 100)
  {
    posP1Y = height - 100;
  }
}

void colisaoP1()
{
  //Collider
  if (bolaX >= (posP1X - diametro/2) && bolaX <= posP1X + 20 && bolaY >= posP1Y && bolaY <= posP1Y + 100)
  {
    //se a bola colidir e a auxiliar X pro positiva, ela virará negativa
    if(bolaXAux > 0)
    {
      bolaXAux *= -1;
    }
    
    
    //Diferentes angulações para bola
    
    //Se tocar somente na parte superior da barra
    if (bolaY == posP1Y && bolaX > posP1X - diametro/2 && bolaX < posP1X + 20)
    {
      bolaYAux = -8;
    } 
    //Se tocar somente na parte inferior da barra
    else if (bolaY == posP1Y + 100 && bolaX > posP1X - diametro/2 && bolaX < posP1X + 20)
    {
      bolaYAux = 9;
    }
    //Demais angulações
    else if (bolaY >= posP1Y && bolaY <= posP1Y + 12)
    {
      bolaYAux = -8;
    } 
    else if (bolaY > posP1Y + 12 && bolaY < posP1Y + 37)
    {
      bolaYAux = -5;
    } 
    else if (bolaY >= posP1Y + 37 && bolaY <= posP1Y + 47)
    {
      bolaYAux = -2;
    } 
    else if (bolaY > posP1Y + 47 && bolaY < posP1Y + 53)
    {
      bolaYAux = 0;
    } 
    else if (bolaY >= posP1Y + 53 && bolaY <= posP1Y + 63)
    {
      bolaYAux = 2;
    } 
    else if (bolaY > posP1Y + 63 && bolaY < posP1Y + 88)
    {
      bolaYAux = 5;
    } 
    else if (bolaY >= posP1Y + 88 && bolaY <= posP1Y + 100)
    {
      bolaYAux = 8;
    }
  }
}
