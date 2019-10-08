using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Fire : MonoBehaviour
{

    //Acesso à scripts
    private GameManager gameManager;
    public GameObject gameObject_player;
    private Donkey_Kong player;
    private UIManager _uiManager;

    //Variáveis e afins que determinam posição
    float [] fogo = new float [5];
    private int indiceVetorPosY = 0;                            //Índice para colocar as posições do vetor
    private int indiceUpdatePosY = 4;                           //Índice para a posição do fogo
    private float posXFogo;                                       //Determina a posição em X que o fogo vai se manter
    private int randomINT;

    //Variáveis que tem relação com o tempo do jogo, delays
    public float tempo;                                         //Auxiliar de delay da movimentação
    private float tempoAux;




    void Start()
    {
        for (int i = 0; i < fogo.Length; i++) 
        {
            fogo[i]= indiceVetorPosY -1;
            indiceVetorPosY++;            
        }   //Definindo as posições em cada um dos vetores

        //Setando a referência delay
        gameManager = GameObject.Find("GameManager").GetComponent<GameManager>();
        player = GameObject.FindWithTag("Player").GetComponent<Donkey_Kong>();
        _uiManager = GameObject.Find("Canvas").GetComponent<UIManager>();

        tempo = (gameManager.tempoRelativo / 60) + 1f;
        tempoAux = player.tempoAux;
        if (player.fogoMovInicialAux == true)
        {
            tempo = (gameManager.tempoRelativo / 60) + 0.5f;
            player.fogoMovInicialAux = false;
        }      //Lógica do delay FOGO: se a condição for true, que só será na primeira Instancia e quando reiniciar o round, o delay é reduzido para a movimentação do fogo ficar entre os frames de mov dos abacaxis

        //Escolhe uma posição aleatória, 4 ou -4, para o fogo instanciado
        randomINT = Random.Range(1, 3);
        if (randomINT == 1)
        {
            posXFogo = -4.44f;
        }
        else
        {
            posXFogo = 2.66f;
        }
        gameObject.transform.position = new Vector3(posXFogo, 3, 0);
    }

    void Update()
    {
        Movement();                
    }



    private void Movement()
    {
        if (tempo < (gameManager.tempoRelativo / 60))
        {

            indiceUpdatePosY += -1;

            if (indiceUpdatePosY <= -1)                   //Se o fogo estiver abaixo da mão do player
            {
                if (player.transform.position.x > posXFogo - 2 && player.transform.position.x < posXFogo + 2)
                {
                    player.destroiFogo = true;
                    Destroy(player._instAbacCen);         //Destrói todos os abacaxis
                    Destroy(player._instAbacDir);
                    Destroy(player._instAbacEsq);
                    player.erros += 1;

                    if (player.erros == 3)
                    {

                        //Destrói os fogos restantes na cena
                        player.fogoRestante = GameObject.FindGameObjectsWithTag("Fogo");
                        foreach (GameObject Fire in player.fogoRestante)
                        {
                            Destroy(Fire);
                        }

                        //reseta o game, mas ainda mostrando na tela a contagem de erros e escores
                        _uiManager.UpdateMiss(player.erros);
                        gameManager.gameStarted = false;
                        gameManager.tempoRelativo = 0;
                        Destroy(GameObject.FindGameObjectWithTag("Player"));
                    }                    
                    //caso o player erre (entrou nesse if) e tenha mais de 300 pontos, perde o jogo
                    else if (_uiManager.score >= 300)
                    {
                        player.fogoRestante = GameObject.FindGameObjectsWithTag("Fogo");
                        foreach (GameObject Fire in player.fogoRestante)
                        {
                            Destroy(Fire);
                        }

                        //reseta o game, mas ainda mostrando na tela a contagem de erros e escores
                        _uiManager.UpdateMiss(player.erros);
                        gameManager.gameStarted = false;
                        gameManager.tempoRelativo = 0;
                        Destroy(GameObject.FindGameObjectWithTag("Player"));
                    }
                    else
                    {
                        //reinicia o round e atualiza o número de erros na tela
                        player.StartCoroutine(player.restartRound());
                        _uiManager.UpdateMiss(player.erros);
                    }

                }
                transform.position = new Vector3(posXFogo, -1, 0);
                tempo = (gameManager.tempoRelativo / 60) + tempoAux;
                Destroy(this.gameObject);

            }

            else
            {
                transform.position = new Vector3(posXFogo, fogo[indiceUpdatePosY], 0);
                tempo = (gameManager.tempoRelativo / 60) + tempoAux;
            }
        }
    }
}
