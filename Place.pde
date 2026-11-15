//this class is unfinished but its main purpose will be for storing the locations images, and displaying them
class location
{
  PImage loc_png;//the image of the location
  String loc_name;//the name of the location
  
  location(PImage png, String locName)
  {
    imageMode(CENTER);
    loc_png = png;
    loc_name = locName;
  }
  
  void display()
  {
      image(loc_png, width/2, height/2);
  }
}
