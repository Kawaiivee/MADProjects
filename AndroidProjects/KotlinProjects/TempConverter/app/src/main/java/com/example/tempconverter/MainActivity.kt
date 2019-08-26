package com.example.tempconverter

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.*

class MainActivity : AppCompatActivity() {

    //Views being null-declared/inited
    private var input_label : TextView ?= null
    private var output_label : TextView ?= null
    private var input : EditText ?= null
    private var output : TextView ?= null
    private var history : TextView ?= null

    //Buttons to set onClick listeners since onClick in the layout isn't working
    private var convert_button : Button ?= null
    private var clear_button : Button ?= null

    //Radio button group and buttons setup
    private var button_group : RadioGroup ?= null

    //Helpful Variables
    var mode : String = "f2c"
    var history_data : String = ""

    //onCreate to link and configure views
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        input_label = findViewById<TextView>(R.id.input_label)
        output_label = findViewById<TextView>(R.id.output_label)
        input = findViewById<EditText>(R.id.input)
        output = findViewById<TextView>(R.id.output)
        history = findViewById<TextView>(R.id.history)
        //history.setscrollmethod or something

        //Convert and Clear Button
        convert_button = findViewById<Button>(R.id.convert_button)
        clear_button = findViewById<Button>(R.id.clear_button)

        convert_button?.setOnClickListener{
            convertButtonClicked()
        }

        clear_button?.setOnClickListener{
            clearButtonClicked()
        }

        //Radio Button Group Stuff
        button_group = findViewById<RadioGroup>(R.id.button_group)
        button_group?.setOnCheckedChangeListener{group, checkedId ->
            if(R.id.f2c_button == checkedId){
                input_label?.text = "Fahrenheit Degrees:"
                output_label?.text = "Celsius Degrees:"
                mode = "f2c"
            }
            else if(R.id.c2f_button == checkedId){
                input_label?.text = "Celsius Degrees:"
                output_label?.text = "Fahrenheit Degrees:"
                mode = "c2f"
            }
            else{
                input_label?.text = "Fahrenheit Degrees:"
                output_label?.text = "Celsius Degrees:"
                mode = "f2c"
            }
        }
    }

    //Save when state changes via orientation
    override fun onSaveInstanceState(outState: Bundle) {
        Toast.makeText(applicationContext, "Orientation Changed", Toast.LENGTH_SHORT).show()
        if(input?.text.toString() != ""){
            outState.putFloat("inputKey", input?.text.toString().toFloat())
        }
        else{
            outState.putFloat("inputKey", 0.0f)
        }
        if(output?.text.toString() != ""){
            outState.putFloat("outputKey", output?.text.toString().toFloat())
        }
        else{
            outState.putFloat("outputKey", 0.0f)
        }
        outState.putString("historyKey", history_data)
        super.onSaveInstanceState(outState)
    }

    //Re-load when state changes via orientation
    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        input?.setText(savedInstanceState.getFloat("inputKey").toString())   //EditText doesn't have 'text' property
        output?.text = savedInstanceState.getFloat("outputKey").toString()   //On the other hand, TextView's do!
        history_data = savedInstanceState.getString("historyKey").toString() //history gets placed into TextView anyway
    }

    //Conversion function
    fun convert(temp: Float){
        if(mode == "f2c"){
            var result = (temp - 32.0) / 1.8
            result.toFloat()
            output?.text = "%.1f".format(result)
            history_data = "%.1f".format(temp) + "°F >>> " + "%.1f".format(result) + "°C" + "\n" + history_data
            history?.setText(history_data)
        }
        else if(mode == "c2f"){
            var result = temp * 1.8 + 32.0
            result.toFloat()
            output?.text = "%.1f".format(result)
            history_data = "%.1f".format(temp) + "°C >>> " + "%.1f".format(result) + "°F" + "\n" + history_data
            history?.setText(history_data)
        }
        else{
            output?.setText("ERROR")
            history_data = "An error occurred\n$history_data"
            history?.text = history_data
        }
    }

    //Helper functions for onClickListeners...radio buttons were a b**** so I did it in the onCreate
    fun convertButtonClicked(){
        if(input?.text.toString() == "" || input?.text.toString() == "."){
            Toast.makeText(applicationContext, "Enter a valid number", Toast.LENGTH_SHORT).show()
            return
        }
        val input_value : Float = input?.text.toString().toFloat()        //I almost typed this input?.getText().toString().toFloat()
        convert(input_value)
        Toast.makeText(applicationContext, "Converting...", Toast.LENGTH_SHORT).show()
    }

    fun clearButtonClicked(){
        history_data = ""
        history?.text = history_data
        Toast.makeText(applicationContext, "Clearing...", Toast.LENGTH_SHORT).show()
    }
}