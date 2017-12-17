package com.example.philmckenzie.milestone_2;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;

import java.util.Random;

    public class MainActivity extends AppCompatActivity {

        int userChoice;
        int cpuChoice;

        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_main);
        }

        public void playRps(View view) {
            //check which button was pressed.
            ImageButton rockButton = (Button) findViewById(R.id.rockButton);
            View.OnClickListener onclick = new View.OnClickListener(){
                public void onClick(View view){
                    setUserRock(view);
                }
            };
            rockButton.setOnClickListener(onclick);

            ImageButton paperButton = (Button) findViewById(R.id.paperButton);
            View.OnClickListener onclick = new View.OnClickListener(){
                public void onClick(View view){
                    setUserPaper(view);
                }
            };
            ImageButton scissorButton = (Button) findViewById(R.id.scissorsButton);
            View.OnClickListener onclick = new View.OnClickListener(){
                public void onClick(View view){
                    setUserScissors(view);
                }
            };





            //randomize cpu choice

            //animate cpu choice and user choice

            //determine winner based upon random cpu choice and user choice

            //alert user who won with pop up and a sound

            //update winner's score

            //restart game
        }

        public void setUserRock(View view) {
            userChoice = 1;
            playCPU();
        }
        public void setUserPaper(View view) {
            userChoice = 2;
            playCPU();
        }
        public void setUserScissors(View view) {
            userChoice = 4;
            playCPU();
        }

        public void playCPU() {
            Random r = new Random();
            cpuChoice = r.nextInt((0 - 3) + 1);
        }
    }
}
