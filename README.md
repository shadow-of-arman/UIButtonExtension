# UIButtonExtension

This package includes three components: 

1. UIRadioButton
2. UICheckboxModern
3. UICheckboxClassic

# UIRadioButton( )

The UIRadioButton instance will have some attributes by default. you can customize these as you wish. to change the size of the button you only need to change the Height of the instance.
The UIRadioButton is made of two parts, the outer circle and the inner circle for when it's actively selected. to costumize aspects of the button you can use:

1. .color                // change the color of the outer circle
2. selectedColor  // change the color of the inner circle
3. borderWidth    // change the width of the outer circle 
4. selectedSize   // change the size of the inner circle, value must be between 0 and 1 

The UIRadioButton can take in string to show in 4 corners: 

1. leftText(text: String)            // adds a label to the left of the button and adds the inserted String as it's text
2. rightText(text: String)          // adds a label to the right of the button and adds the inserted String as it's text
3. topText(text: String)            // adds a label to the top of the button and adds the inserted String as it's text
4. bottomText(text: String)      // adds a label to the bottom of the button and adds the inserted String as it's text

by default the text will have a dynamic font size which addapts to the height of the button and the default system font and color. to change these you may use these:

1. fontSize      // change the size of the font
2. font             // change the font of the text 
3. textColor     // change the color of the text 

Each instance of the UIRadioButton will have a randomly generated id (NSUUID) which you can change. each instance is also animated by default.

1. id                   // access the id and or change it at will
2. animate         // decide wether the default selecting animation is turned on or off

to understand the current status of the button to see wether it's selected or not you can use "isSelected"
"isSelected" is a read only property and only changes when the button is pressed.

# UICheckboxModern( )

The UICheckboxModern instance will have some attributes by default. you can customize these as you wish. to change the size of the button you only need to change the Height of the instance.
The UICheckboxModern is made of two parts, the containing box and the checkmark for when it's actively selected. to costumize aspects of the button you can use:

1. .color                    // change the color of the containing box
2. selectedColor       // change the color of the checkmark background
3. borderWidth         // change the width of the outer circle (note that the width will dynamically change based on the height of the button by default)
4. checkedImage     // change the background of the checkmark (the checkmark itself)
5. cornerRadius       // change the corner radius, can even become a circle

The UICheckboxModern can take in string to show in 4 corners: 

1. leftText(text: String)            // adds a label to the left of the button and adds the inserted String as it's text
2. rightText(text: String)          // adds a label to the right of the button and adds the inserted String as it's text
3. topText(text: String)            // adds a label to the top of the button and adds the inserted String as it's text
4. bottomText(text: String)      // adds a label to the bottom of the button and adds the inserted String as it's text

by default the text will have a dynamic font size which addapts to the height of the button and the default system font and color. to change these you may use these:

1. fontSize      // change the size of the font
2. font             // change the font of the text 
3. textColor     // change the color of the text 

Each instance of the UICheckboxModern will have a randomly generated id (NSUUID) which you can change. each instance is also animated by default.

1. id                   // access the id and or change it at will
2. animate         // decide wether the default selecting animation is turned on or off

to understand the current status of the button to see wether it's selected or not you can use "isSelected"
"isSelected" is a read only property and only changes when the button is pressed.

when clicked in type 1, the box gets filled by color and the checkmark resides inside the container box.

# UICheckboxClassic( )

The UICheckboxClassic instance will have some attributes by default. you can customize these as you wish. to change the size of the button you only need to change the Height of the instance.
The UICheckboxClassic is made of two parts, the containing box and the checkmark for when it's actively selected. to costumize aspects of the button you can use:

1. .color                // change the color of the containing box
2. borderWidth    // change the width of the outer circle (note that the width will dynamically change based on the height of the button by default)
3. cornerRadius  // change the corner radius, can even become a circle

The UICheckBoxClassic can take in string to show in 4 corners: 

1. leftText(text: String)            // adds a label to the left of the button and adds the inserted String as it's text
2. rightText(text: String)          // adds a label to the right of the button and adds the inserted String as it's text
3. topText(text: String)            // adds a label to the top of the button and adds the inserted String as it's text
4. bottomText(text: String)      // adds a label to the bottom of the button and adds the inserted String as it's text

by default the text will have a dynamic font size which addapts to the height of the button and the default system font and color. to change these you may use these:

1. fontSize      // change the size of the font
2. font             // change the font of the text 
3. textColor     // change the color of the text 

Each instance of the UICheckboxClassic will have a randomly generated id (NSUUID) which you can change. each instance is also animated by default.

1. id                   // access the id and or change it at will
2. animate         // decide wether the default selecting animation is turned on or off

to understand the current status of the button to see wether it's selected or not you can use "isSelected"
"isSelected" is a read only property and only changes when the button is pressed.

when clicked in type 2, the check mark pops out of the frame a little to create it's unique visual style. keep in mind, if the width of the button is not the same as the height then the location of the checkmark will change based on the X axis.


