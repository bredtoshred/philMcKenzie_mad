package com.example.philmckenzie.milestone_2;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;

import java.util.Random;

public class MainActivity extends AppCompatActivity {

    int cpuChoice;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void playRps(View view) {
        //check which button was pressed.

        //randomize cpu choice

        //animate cpu choice and user choice

        //determine winner based upon random cpu choice and user choice

        //alert user who won with pop up and a sound

        //update winner's score

        //restart game
    }

    public void playCPU(View view) {
        Random r = new Random();
        cpuChoice = r.nextInt(0 - 3 + 1) + 0;
        Log.i("myApp", cpuChoice);
    }
    }
}
