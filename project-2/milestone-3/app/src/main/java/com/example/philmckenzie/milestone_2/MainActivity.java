package com.example.philmckenzie.milestone_2;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

        int userChoice;
        int userScore;
        int cpuChoice;
        int cpuScore;
        String result;
        String finalResult;
        MediaPlayer mp;

        ImageButton rockButton;
        ImageButton paperButton;
        ImageButton scissorsButton;
        ImageView cpuImage;

        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_main);
            rockButton = (ImageButton) findViewById(R.id.rockButton);
            paperButton = (ImageButton) findViewById(R.id.paperButton);
            scissorsButton = (ImageButton) findViewById(R.id.scissorsButton);
            cpuImage = (ImageView) findViewById(R.id.imageViewCPU);
            mp = MediaPlayer.create(getApplicationContext(), R.raw.rock_win);
        }

        public void playRps(View view) {
            //check which button was pressed.
            ImageButton rockButton = (ImageButton) findViewById(R.id.rockButton);
            ImageButton paperButton = (ImageButton) findViewById(R.id.paperButton);
            ImageButton scissorsButton = (ImageButton) findViewById(R.id.scissorsButton);
            View.OnClickListener onclick = new View.OnClickListener(){
                public void onClick(View view){
                    setUserRock();
                }
            };
            rockButton.setOnClickListener(onclick);


            onclick = new View.OnClickListener() {
                public void onClick(View view) {
                    setUserPaper();
                }
            };
            paperButton.setOnClickListener(onclick);


            onclick = new View.OnClickListener() {
                public void onClick(View view) {
                    setUserScissors();
                }
            };
            scissorsButton.setOnClickListener(onclick);
        }

        public void setUserRock() {
            userChoice = 1;
            playCPU();
        }
        public void setUserPaper() {
            userChoice = 2;
            playCPU();
        }
        public void setUserScissors() {
            userChoice = 3;
            playCPU();
        }

        public void playCPU() {
            cpuChoice = (int )(Math.random() * 3 + 1);
            whoWon();
        }

        public void whoWon(){
            if(userChoice == 1 && cpuChoice == 1 || userChoice == 2 && cpuChoice == 2 || userChoice == 3 && cpuChoice == 3){
                result = "You tied";
                mp = MediaPlayer.create(getApplicationContext(), R.raw.tie);
                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        animateUser();
                    }
                }, 1000);
            }
            if(userChoice == 1 && cpuChoice == 2){
                result = "You lose, paper beats rock";
                mp = MediaPlayer.create(getApplicationContext(), R.raw.paper_win);
                cpuScore +=1;
                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        animateUser();
                    }
                }, 1000);
            }
            if(userChoice == 1 && cpuChoice == 3){
                result = "You win, rock beats scissors";
                mp = MediaPlayer.create(getApplicationContext(), R.raw.rock_win);
                userScore+=1;
                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        animateUser();
                    }
                }, 1000);
            }
            if(userChoice == 2 && cpuChoice == 1){
                result = "You win, paper beats rock";
                mp = MediaPlayer.create(getApplicationContext(), R.raw.paper_win);
                userScore+=1;
                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        animateUser();
                    }
                }, 1000);
            }
            if(userChoice == 2 && cpuChoice == 3){
                result = "You lose, scissors beat paper";
                mp = MediaPlayer.create(getApplicationContext(), R.raw.scissors_win);
                cpuScore +=1;
                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        animateUser();
                    }
                }, 1000);
            }
            if(userChoice == 3 && cpuChoice == 1){
                result = "You lose, rock beats scissors";
                mp = MediaPlayer.create(getApplicationContext(), R.raw.rock_win);
                cpuScore +=1;
                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        animateUser();
                    }
                }, 1000);
            }
            if(userChoice == 3 && cpuChoice == 2){
                result = "You win, scissors beat paper";
                mp = MediaPlayer.create(getApplicationContext(), R.raw.scissors_win);
                userScore+=1;
                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        animateUser();
                    }
                }, 1000);
            }

        }
        public void showWhoWon(){
            //final winner
            updateScore();
            if(userScore > 2|| cpuScore > 2){
                if(userScore > cpuScore){
                    finalResult = "You beat the computer, congrats!";
                    mp = MediaPlayer.create(getApplicationContext(), R.raw.win);
                    alertFinalResult();
                }
                else if(userScore < cpuScore){
                    finalResult = "The computer beat you.";
                    mp = MediaPlayer.create(getApplicationContext(), R.raw.lose);
                    alertFinalResult();
                }
            }
            else{
                alertResult();
            }
        }
        public void updateScore(){
            TextView userScoreText = findViewById(R.id.userScoreText);
            userScoreText.setText("you: " + userScore);
            TextView cpuScoreText  = findViewById(R.id.cpuScoreText);
            cpuScoreText.setText("CPU: " + cpuScore);
        }

        public void resetGame(){
            userScore = 0;
            cpuScore = 0;
            resetImages();
            updateScore();
        }

        public void resetImages(){
            rockButton.setImageResource(R.drawable.rock);
            paperButton.setImageResource(R.drawable.paper);
            scissorsButton.setImageResource(R.drawable.scissors);
            cpuImage.setImageResource(R.drawable.question_mark);
        }

    public void alertResult() {
            AlertDialog alertDialog = new AlertDialog.Builder(MainActivity.this).create();
            alertDialog.setTitle("Alert");
            mp.start();
            alertDialog.setMessage(result);
            alertDialog.setButton(AlertDialog.BUTTON_NEUTRAL, "OK",
                    new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int which) {
                            dialog.dismiss();
                            resetImages();
                        }
                    });
            alertDialog.show();
        }

        public void alertFinalResult() {
            AlertDialog alertDialog = new AlertDialog.Builder(MainActivity.this).create();
            alertDialog.setTitle("Alert");
            mp.start();
            alertDialog.setMessage(finalResult);
            alertDialog.setButton(AlertDialog.BUTTON_NEUTRAL, "Play Again?",
                    new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int which) {
                            dialog.dismiss();
                            resetGame();
                        }
                    });
            alertDialog.show();
        }

        public void animateUser(){
            if (userChoice == 1){
                paperButton.setImageResource(R.drawable.paper_dark);
                scissorsButton.setImageResource(R.drawable.scissors_dark);
            }
            if (userChoice == 2){
                rockButton.setImageResource(R.drawable.rock_dark);
                scissorsButton.setImageResource(R.drawable.scissors_dark);
            }
            if (userChoice == 3){
                rockButton.setImageResource(R.drawable.rock_dark);
                paperButton.setImageResource(R.drawable.paper_dark);
            }
            new Handler().postDelayed(new Runnable() {
                @Override
                public void run() {
                    animateCPU();
                }
            }, 1000);
        }

        public void animateCPU(){
            if(cpuChoice == 1){
                cpuImage.setImageResource(R.drawable.rock);
            }
            if(cpuChoice == 2){
                cpuImage.setImageResource(R.drawable.paper);
            }
            if(cpuChoice == 3){
                cpuImage.setImageResource(R.drawable.scissors);
            }
            new Handler().postDelayed(new Runnable() {
                @Override
                public void run() {
                    showWhoWon();
                }
            }, 1000);
        }
    }
