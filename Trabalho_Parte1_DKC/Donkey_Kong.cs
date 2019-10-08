using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Donkey_Kong : MonoBehaviour
{
    //Variável de erro(vida)
    public int erros = 0;

    //Variáveis de movimentação
    public float rightMove = 3.55f;
    private bool movimentoCoroutine = true; //Habilita ou desabilita a movimentação

    //Variáveis que tem relação com tempo e delay
    public float tempo = 1f;                      //Auxiliar de delay da movimentação dos ABACAXIS
    public float tempoAux = 1f;
    public float tempoFogo = 0.5f;                //Armazena a soma do valor escolhido do vetor com o tempo atual do jogo
    private float[] arrayTempoFogo;                 //Vetor pra poder armazenar os possíveis delays do fogo
    private int index;                              //Auxiliar pra pegar o valor do vetor arrayTempoFogo
    
    //Variáveis que tem a ver com o objeto fogo
    private bool _instFogoCoroutine = true;
    public bool destroiFogo = false;
    public bool fogoMovInicialAux = true;
    public GameObject[] fogoRestante;

    //Acesso a outros scripts
    private GameManager gameManager;
    private UIManager _uiManager;
    public GameObject _prefabPinneappleEsq; 
    public GameObject _prefabPinneappleCen;
    public GameObject _prefabPinneappleDir;
    public GameObject _prefabFire;
    public GameObject _instAbacCen;
    public GameObject _instAbacDir;
    public GameObject _instAbacEsq;

    void Start()
    {
        gameManager = GameObject.Find("GameManager").GetComponent<GameManager>();
        _uiManager = GameObject.Find("Canvas").GetComponent<UIManager>();

        //Zera os escores no começo do jogo
        _uiManager.scoreText.text = "Score: 00";

        transform.position = new Vector3(-2.67f, -2f, 0);

        //Instancia e começa a configurar o spawn do fogo
        Instantiate(_prefabFire, new Vector3(0, 4, 0), Quaternion.identity);
        arrayTempoFogo = new float[] { 1f, 2f, 3f, 4f };       
        index = Random.Range(0, arrayTempoFogo.Length);
        tempoFogo += arrayTempoFogo[index];

        instanciaAbacaxi();
    }

    void Update()
    {
        Movement();

        if(_instFogoCoroutine == true)
        {
            instanciaFogo();

        }

        if (destroiFogo == true)
        {
            fogoRestante = GameObject.FindGameObjectsWithTag("Fogo");
            foreach(GameObject Fire in fogoRestante)
            {
                Destroy(Fire);
            }
        }   //Destrói todos os fogos que sobraram na cena

        
    }



    //Funções

    void instanciaFogo()
    {
        if (tempoFogo < gameManager.tempoRelativo/60)
        {

            Instantiate(_prefabFire, new Vector3(0, 4, 0), Quaternion.identity);

            index = Random.Range(0, arrayTempoFogo.Length);
            tempoFogo += arrayTempoFogo[index]; //Delay semi-aleatório até que se possa spawnar novamente
        }
    }  
    void instanciaAbacaxi()
    {
        tempo = (gameManager.tempoRelativo / 60) + 1f;                    //Traz novamente o delay aos abacaxis
        _instAbacCen = Instantiate(_prefabPinneappleCen, new Vector3(0, 20, 0), Quaternion.identity);  //Instancia os abacaxis
        _instAbacDir = Instantiate(_prefabPinneappleDir, new Vector3(0, 20, 0), Quaternion.identity);
        _instAbacEsq = Instantiate(_prefabPinneappleEsq, new Vector3(0, 20, 0), Quaternion.identity);
    }

    void Movement()
    {
        if(movimentoCoroutine == true)
        {
            if (Input.GetKeyDown("right"))      //Se o usuário apertar a seta para direita
            {
                transform.Translate(new Vector3(rightMove, 0, 0));      //Andar 3.55 unidades para direita
            }
            else if (Input.GetKeyDown("left"))      //Se apertar para a esquerda
            {
                transform.Translate(new Vector3(-rightMove, 0, 0));     //Andar 3.55 unidades para esquerda
            }
            
            //Limites de borda
            if (transform.position.x < -6.22f)
            {
                transform.position = new Vector3(-6.22f, -2f, 0);
            }
            if (transform.position.x > 4.43)
            {
                transform.position = new Vector3(4.43f, -2f, 0);
            }
        }
        
    }

    public IEnumerator restartRound()
    {        
        //Player não se move mais
        movimentoCoroutine = false;
        //Para de instanciar o fogo
        _instFogoCoroutine = false;

        

        yield return new WaitForSeconds(1f);
        
        //Player volta a se mover depois de 1 segundo
        movimentoCoroutine = true;
        //Fogo volta a spawnar
        destroiFogo = false;
        _instFogoCoroutine = true;

        fogoMovInicialAux = true;

        Instantiate(_prefabFire, new Vector3(0, 4, 0), Quaternion.identity);


        index = Random.Range(0, arrayTempoFogo.Length);
        tempoFogo = (gameManager.tempoRelativo / 60) + 0.5f;        //Garante que ele não instancie outro fogo nesse frame
        tempoFogo += arrayTempoFogo[index];
        
        //Abacaxis são intanciados
        instanciaAbacaxi();
    }

}
