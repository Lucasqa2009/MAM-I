using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Pineapple_C : MonoBehaviour
{

    //Acesso à scripts
    public GameObject gameObject_player;
    private GameManager gameManager;
    private UIManager _uiManager;
    private Donkey_Kong player;
    private GameObject[] fogoRestante;

    //Variáveis e afins que determinam posição
    float [] pineapple = new float[5];
    private int indiceVetorPosY = 0;                        //Índice para colocar as posições do vetor
    private int indiceUpdatePosY = 4;                       //Índice para a posição do abacaxi
    public int auxPos_Y = -1;                               //Auxiliar para definir o sentido que se desloca

    //Variáveis que tem relação com o tempo do jogo, delays
    private float tempo;                                    //Auxiliar de delay da movimentação
    private float tempoAux;

    void Start()
    {
        gameManager = GameObject.Find("GameManager").GetComponent<GameManager>();
        _uiManager = GameObject.Find("Canvas").GetComponent<UIManager>();
        player = GameObject.FindWithTag("Player").GetComponent<Donkey_Kong>();

        //Setando a referência delay
        tempo = player.tempo;
        tempoAux = player.tempoAux;

        for (int i = 0; i < pineapple.Length; i++) 
        {
            pineapple[i] = indiceVetorPosY -1;
            indiceVetorPosY++;            
        }   //Definindo as posições em cada um dos vetores
       
        //Definindo uma posição e um sentido semi-aleatório para o abacaxi spawnar
        indiceUpdatePosY = Random.Range(2, 4);
        auxPos_Y = Random.Range(0, 2);
        if(auxPos_Y == 0 || indiceUpdatePosY == 4)
        {
            auxPos_Y = -1;
        }
        transform.position = new Vector3(-0.88f, pineapple[indiceUpdatePosY], 0);  //posição inicial do abacaxi ao spawnar
        
    }

    void Update()
    {
        Movement();
        if (_uiManager.score == 300)
        {
            player.erros = 0;
            _uiManager.UpdateMiss(player.erros);
        }
    }





    private void OnTriggerEnter2D(Collider2D player)
    {
        if (player != null)
        {
            auxPos_Y *= -1;
            transform.position = new Vector3(-0.88f, pineapple[indiceUpdatePosY + 1], 0);
            indiceUpdatePosY += 1;
            _uiManager.UpdateScore();
        }
    }         //Muda o sentido do movimento e sobe ele uma posição ao colidir com o player


    private void Movement()
    {
        if (tempo < (gameManager.tempoRelativo / 60))
        {
            indiceUpdatePosY += auxPos_Y;

            if (indiceUpdatePosY <= -1)                     //Declara derrota (round ou jogo) se chegar a posição abaixo do player
            {
                player.destroiFogo = true;
                Destroy(player._instAbacEsq);
                Destroy(player._instAbacDir);

                player.erros += 1;
                if (player.erros == 3)
                {
                    fogoRestante = GameObject.FindGameObjectsWithTag("Fogo");
                    foreach (GameObject Fire in fogoRestante)
                    {
                        Destroy(Fire);
                    }

                    Destroy(GameObject.FindGameObjectWithTag("Player"));

                    _uiManager.UpdateMiss(player.erros);
                    gameManager.gameStarted = false;
                    gameManager.tempoRelativo = 0;
                }
                else if (_uiManager.score >= 300)
                {
                    fogoRestante = GameObject.FindGameObjectsWithTag("Fogo");
                    foreach (GameObject Fire in fogoRestante)
                    {
                        Destroy(Fire);
                    }

                    Destroy(GameObject.FindGameObjectWithTag("Player"));

                    _uiManager.UpdateMiss(player.erros);
                    gameManager.gameStarted = false;
                    gameManager.tempoRelativo = 0;
                }
                else
                {
                    _uiManager.UpdateMiss(player.erros);

                    player.StartCoroutine(player.restartRound());

                    Debug.Log("Abacaxi Central caiu");
                    tempo = (gameManager.tempoRelativo / 60) + tempoAux;
                }


                Destroy(this.gameObject);

            }


            else if (auxPos_Y == 1 && indiceUpdatePosY == 4)        //Checa se vai subir para 4º posição ou não
            {
                int z = Random.Range(1, 3);
                if (z == 1)      //só vai até a terceira
                {
                    indiceUpdatePosY = 3;
                    auxPos_Y = auxPos_Y * -1;
                    transform.position = new Vector3(-0.88f, pineapple[indiceUpdatePosY], 0);
                    tempo = (gameManager.tempoRelativo / 60) + tempoAux;
                }
                else               //vai até a quarta
                {
                    indiceUpdatePosY = 5;
                    transform.position = new Vector3(-0.88f, pineapple[indiceUpdatePosY - 1], 0);
                    tempo = (gameManager.tempoRelativo / 60) + tempoAux;
                    auxPos_Y = auxPos_Y * -1;
                }
            }
            
            else
            {

                transform.position = new Vector3(-0.88f, pineapple[indiceUpdatePosY], 0);
                tempo = (gameManager.tempoRelativo / 60) + tempoAux;
            }
        }
    }
}
