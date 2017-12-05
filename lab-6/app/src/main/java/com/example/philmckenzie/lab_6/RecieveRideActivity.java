package com.example.philmckenzie.lab_6;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;

public class RecieveRideActivity extends AppCompatActivity {

    private String ride;
    private String rideURL;
    private String rideDescription;
//    private String rideImage;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recieve_ride);

        //get intent
        Intent intent = getIntent();
        ride = intent.getStringExtra("rideName");
        rideURL = intent.getStringExtra("rideURL");
        rideDescription = intent.getStringExtra("rideDescription");
        Log.i("ride received", ride);
        Log.i("url received", rideURL);
        Log.i("url received", rideDescription);

        //update text view
        TextView messageView = (TextView) findViewById(R.id.rideTextView);
        messageView.setText("You should check out " + ride);

        TextView descriptionView = (TextView) findViewById(R.id.description);
        descriptionView.setText(rideDescription);

        //get image button
        final ImageButton imageButton = (ImageButton) findViewById(R.id.webButton);
        //create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                loadWebSite(view);
            }
        };

        //add listener to the button
        imageButton.setOnClickListener(onclick);
    }

    public void loadWebSite(View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(rideURL));
        startActivity(intent);
    }
}
