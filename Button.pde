class Button { //button class for making the buttons
  float x, y, w, h;          // setting the values need for the button
  String label;              // text shown on the button
  color baseColor, hoverColor;

  Button(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.baseColor = color(200);   // Normal fill: light gray
    this.hoverColor = color(150);  // Hover fill: darker gray
  }

  // Draw the button and change color on hover
  void display() {
    pushStyle();                   // Save the sketch's current drawing settings
    rectMode(CENTER);              // rect(x, y, ...) now treats x, y as the center

    if (isMouseOver()) {
      fill(hoverColor);
    } else {
      fill(baseColor);
    }

    stroke(0);
    rect(x, y, w, h, 8);          

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text(label, x, y);

    popStyle();                   
  }

  // Check if the mouse cursor is inside the button bounds.
  // Since x, y is the center, the edges are half the width/height away.
  boolean isMouseOver() {
    return mouseX >= x - w / 2 && mouseX <= x + w / 2 &&
           mouseY >= y - h / 2 && mouseY <= y + h / 2;
  }
}
