void linhaTracejada()
{
  float comp = width/19;
  float larg = 10;
  float posXlinha = 0;
  for(int i = 0; i < width/comp; i++)
  {
    fill(255);
    rect(posXlinha, 200, comp, larg);
    posXlinha += 1.5*comp;
  }
}

void mostraScore()
{
  fill(255);
  textSize(120);
  text(scoreP1, 2*width/3, 100 + 96/3);
  text(scoreP2, width/3 - 120/1.5, 100 + 96/3);
  text(':', width/2 - 20, 100 + 96/3);
}
