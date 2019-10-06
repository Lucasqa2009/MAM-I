class Animacao
{
  int index = 0;
  int delay = 10;
  int tempo = 0;
  int keyPressionada;
  PImage [] sprites;
  String nomeSprites;

  Animacao(String nome, int keyP)
  {
    nomeSprites = nome;  //Nome principal dos sprites na pasta
    keyPressionada = keyP;
  }

  void carregaSprite()
  {
    sprites = new PImage [4];  //número de sprites da animacao
    for (int i = 0; i < sprites.length; i++)
    {
      //Esse 3 aí é porque nos meus arquivos tem 3 números, "charDown001", ou 002, ou 003...
      sprites[i] = loadImage(nomeSprites + nf(i, 3, 0) + ".png");
    }
  }
  
  //mostra a Animação na tela
  void display()
  { 
    if (keys[keyPressionada])     //checa se o player está andando ou parado
    {
      image(sprites[index], posX, posY, 64, 64);
      if (tempo >= delay)
      {
        index++;
        if (index >= 4)
        {
          index = 0;
        }

        tempo = 0;
      }
      tempo++;
    } else {
      image(sprites[0], posX, posY, 64, 64);
      index = 0;
    }
  }
}
