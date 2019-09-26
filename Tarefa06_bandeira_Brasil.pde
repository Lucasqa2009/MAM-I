void setup()
{
  size(800, 800);
  background(230, 200, 50);
}

void draw()
{
  background(230, 200, 50);
  bandeiraBrasil(300);
}



//Funções e procedimentos


//Desenha a bandeira do Brasil
void bandeiraBrasil(float l) //parâmetro "l" é a largura
{
  float Mod = l/14;                             //Módulo descrito na lei
  float Comp = Mod * 20;                        //Comprimento da bandeira
  float xRectExterno = mouseX;                 //Posição X do retângulo externo 
  float yRectExterno = mouseY;                //Posição Y do retângulo externo 
  float quadMod = 1.7;                          //valor do Módulo usado no losango
  
  //Retângulo externo
  rectMode(CENTER);
  noStroke();
  fill(0, 156, 59);
  rect(xRectExterno, yRectExterno, Comp, l);

  //Losango interno
  fill(255, 223, 0);
  quad((xRectExterno - Comp/2) + quadMod * Mod, yRectExterno, 
    xRectExterno, (yRectExterno - l/2) + quadMod * Mod, 
    (xRectExterno + Comp/2) - quadMod * Mod, yRectExterno, 
    xRectExterno, (yRectExterno + l/2) - quadMod * Mod);

  //Círculo central
  ellipseMode(RADIUS);
  fill(0, 39, 118);
  ellipse(mouseX, mouseY, 3.5*Mod, 3.5*Mod);

  //Faixa branca
  bandeiraFaixa(Mod, yRectExterno + l/2);
}


//Desenha a faixa branca
void bandeiraFaixa(float Modulo, float yFinalBandeira)
{
  //Desenha um arco de circunferência da expessura da faixa
  ellipseMode(CENTER);
  noFill();
  strokeWeight(0.5*Modulo);
  stroke(255);
  arc((mouseX) - (2*Modulo), yFinalBandeira, 
    16.5 * Modulo, 16.50 * Modulo, 
    PI * 1.44, PI * 1.73);

  //Desenha uma circunferencia da mesma cor do losango para cortar as "sobras" da faixa
  stroke(255, 223, 0);
  ellipse(mouseX, mouseY, 7.53 * Modulo, 7.53 * Modulo);
}
