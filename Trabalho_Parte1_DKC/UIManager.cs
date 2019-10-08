using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIManager : MonoBehaviour
{
    //variáveis com relação aos errosUI
    public Sprite noMiss;
    public Sprite oneMiss;
    public Sprite twoMiss;
    public Sprite threeMiss;
    public Sprite[] errosUI = new Sprite[4];
    public Image playerErrosDisplay;

    //variáveis com relação ao escore
    public Text scoreText;
    public int score;

    private void Start()
    {
        errosUI[0] = noMiss;
        errosUI[1] = oneMiss;
        errosUI[2] = twoMiss;
        errosUI[3] = threeMiss;
    }

    public void UpdateMiss(int currentMiss)
    {
        playerErrosDisplay.sprite = errosUI[currentMiss];
    }   //Atualiza o número de erros
    public void UpdateScore()
    {
        if(score < 999)
        {
            if (score >= 300)
            {
                score += 2;
            }
            else
            {
                score += 1;
            }
        }
        else
        {
            score = 999;
        }
        
        scoreText.text = "Score: " + score;
    }   //Atualiza o escore
}
