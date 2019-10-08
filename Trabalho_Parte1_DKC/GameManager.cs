using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    public bool gameStarted = false;
    public float tempoRelativo = 0;

    public GameObject playerStart;
    public Donkey_Kong player;
    private UIManager _uiManager;


    void Update()
    {
        Application.targetFrameRate = 60;

        if(gameStarted == false)
        {
            if(Input.GetKeyDown("space"))
            {
                Instantiate(playerStart, new Vector3(0, 0, 0), Quaternion.identity);
                _uiManager = GameObject.Find("Canvas").GetComponent<UIManager>();
                player = GameObject.FindWithTag("Player").GetComponent<Donkey_Kong>();
                gameStarted = true;
                player.erros = 0;
                _uiManager.score = 0;
                _uiManager.UpdateMiss(player.erros);
            }
        }
        else
        {
            tempoRelativo++;
        }
    }
}
