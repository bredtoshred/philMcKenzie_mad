package com.example.philmckenzie.lab_6;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Spinner;

public class FindSkateparkActivity extends AppCompatActivity {

    private ride_info myRide = new ride_info();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_find_skatepark);
        //get button
        final Button button = (Button) findViewById(R.id.go_button);
        //create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                findRide(view);
            }
        };
        //add listener to the button
        button.setOnClickListener(onclick);
    }

    public void findRide(View view){
        //get spinner
        Spinner typeSpinner = (Spinner)findViewById(R.id.ride_type);
        //get spinner item array position
        Integer type = typeSpinner.getSelectedItemPosition();
        //set the ride
        myRide.setRide(type);
        //get suggested ride
        String suggestedRide = myRide.getRide();
        //get URL of suggested ride
        String suggestedRideURL = myRide.getRideURL();
        Log.i("shop", suggestedRide);
        Log.i("url", suggestedRideURL);

        //create an Intent
        Intent intent = new Intent(this, RecieveRideActivity.class);

        //pass data
        intent.putExtra("rideName", suggestedRide);
        intent.putExtra("rideURL", suggestedRideURL);

        //start intent
        startActivity(intent);
    }
}
