package com.example.philmckenzie.final_app;

import android.content.Context;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {

    //extra credit items added.

    //two extra ui elements, toast for radio buttons.

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final Button button = (Button) findViewById(R.id.button);
        //create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                makeBurrito(view);
            }
        };
        //add listener to the button
        button.setOnClickListener(onclick);
    }

    public void makeBurrito(View view) {
        //vars
        String typeText = "";
        String meatText = "";
        String glutenText = "";
        String locationText = "";
        TextView message = (TextView)findViewById(R.id.message);


        //meat?
        ToggleButton meat_toggle = (ToggleButton) findViewById(R.id.meat);
        boolean meat = meat_toggle.isChecked();

        //gluten?
        Switch gluten_switch = (Switch) findViewById(R.id.gluten);
        Boolean gluten = gluten_switch.isChecked();

        //food type
        RadioGroup food_type_group = (RadioGroup) findViewById(R.id.radioGroup);
        int food_type = food_type_group.getCheckedRadioButtonId();

        //location spinner
        Spinner locationSpinner = (Spinner)findViewById(R.id.location);
        Integer location = locationSpinner.getSelectedItemPosition();

        TextView food_message = (TextView)findViewById(R.id.message);
        ImageView food_image = (ImageView) findViewById(R.id.food_image);
        EditText food_name = (EditText)findViewById(R.id.food_name);
        String food_name_output = food_name.getText().toString();

        //check radio buttons
        if (food_type == -1) {
            //toast
            Context context = getApplicationContext();
            CharSequence text = "Please select a burrito or a taco";
            int duration = Toast.LENGTH_SHORT;

            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
        }
        else{
                switch (location){
                    case 0: //hill
                        locationText = "Illegal Petes";
                        break;
                    case 1: //29th
                        locationText = "Chipotle";
                        break;
                    case 2: //pearl
                        locationText = "Bartaco";
                        break;
                    default:
                        locationText = "McDevitt Taco Supply";
                }
                if (meat) { //burrito
                    meatText = "veggies";
                }
                if(!meat){
                    meatText = "meat";
                }
                if (food_type == R.id.burrito_option) { //denver
                    typeText = "burrito";
                    food_image.setImageResource(R.drawable.burrito);
                }
                if (food_type == R.id.taco_option) { //boulder
                    typeText = "taco";
                    food_image.setImageResource(R.drawable.taco);
                }
                if (!gluten) { //burrito
                    glutenText = "flour tortilla";
                }
                if(gluten){
                    glutenText = "corn tortilla";
                }
            message.setText("Hello " + food_name_output + " you should try a " + typeText + " with " + meatText +" on a " +glutenText + " at " + locationText +".");
            }


        }
    }

