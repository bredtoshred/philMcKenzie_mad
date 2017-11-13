package com.example.philmckenzie.lab_5;

import android.content.Context;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void calcPark(View view) {
        //skatepark type
        ToggleButton toggle = (ToggleButton) findViewById(R.id.toggleButton);
        boolean parkType = toggle.isChecked();

        //location
        //radio buttons
        RadioGroup location = (RadioGroup) findViewById(R.id.radioGroup);
        int location_id = location.getCheckedRadioButtonId();

        String parkVal = "";
        TextView skateparkText = (TextView)findViewById(R.id.message);
        ImageView park = (ImageView) findViewById(R.id.imageView);
//        TextView userName = (TextView)findViewById(R.id.name);
        EditText name = (EditText)findViewById(R.id.name);
        String nameValue = name.getText().toString();

        //check radio buttons
        if (location_id == -1) {
            //toast
            Context context = getApplicationContext();
            CharSequence text = "Please select a location";
            int duration = Toast.LENGTH_SHORT;

            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
        }
        else{
            if (parkType) { //transition
                if (location_id == R.id.radioButton1) { //denver
                    park.setImageResource(R.drawable.denver);
                    parkVal = "Denver Skatepark";
                }
                if (location_id == R.id.radioButton2) { //boulder
                    park.setImageResource(R.drawable.erie);
                    parkVal = "Erie Skatepark";
                }

            } else { //street
                if (location_id == R.id.radioButton1) { //denver
                    park.setImageResource(R.drawable.arvada);
                    parkVal = "Arvada Skatepark";
                }
                if (location_id == R.id.radioButton2) { //boulder
                    park.setImageResource(R.drawable.arvada);
                    parkVal = "Arvada Skatepark";
                }
            }
            skateparkText.setText("Hey " + nameValue + " you should chck out " + parkVal);
        }
//        TextView userName = (TextView)findViewById(R.id.name);
//        EditText name = (EditText)findViewById(R.id.editText);
//        String nameValue = name.getText().toString();
//        booText.setText("Happy Halloween " + nameValue + " !");
//        ImageView ghost = (ImageView) findViewById(R.id.imageView);
//        ghost.setImageResource(R.drawable.ghost);
    }
}
