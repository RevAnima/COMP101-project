class Button { //button class for making the buttons
  float x, y, w, h;          // setting the values need for the button
  String label;              // text shown on the button
  color baseColor, hoverColor; //base color of the button and the color when mouse is hovering over it

  Button(float x, float y, float w, float h, String label) {
    //this.__ specifys the gloabl var for the class Button since both the global var and object var share the same name
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.baseColor = color(200);   // the base color of the buttons
    this.hoverColor = color(135);  // the color of the buttons when hovering over them
  }

  // Draw the buttons and change color of button when mouse is hovering over them
  void display() {
    pushStyle();       /*saves the current drawing style, like fill(), stroke(), strokeWeight, 
                       etc so that the style wont change and any changes made wont affect how the button looks*/
    rectMode(CENTER);            

    if (isMouseOver()) {
      fill(hoverColor);
    } else {
      fill(baseColor);
    }

    stroke(0);
    rect(x, y, w, h, 8);          

    fill(0);
    textAlign(CENTER,CENTER);
    textSize(18);
    text(label, x, y);

    popStyle();                   
  }

  // Checks if the mouse cursor is inside the boundarys of the button.
  boolean isMouseOver() {
    return mouseX >= x - w / 2 && mouseX <= x + w / 2 &&
           mouseY >= y - h / 2 && mouseY <= y + h / 2;
  }
}
