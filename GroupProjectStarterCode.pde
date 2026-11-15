//Global start variables
float energy = 300;
float stress = 20;
float happiness = 300;

//Event Text
String[] event = {"Class starts at 10AM what do you want to do","you're at your lecture what do you do now"};
String eventTxt = event[0];//holds the current event text for usage


//texts for location and choices
String[] locations = {"Dorm Room","Home","lecture hall","Libaray","Dining Hall","Club Room" };
String locationLabel = locations[0];//holds the current location text for usage
String[] choiceA = {"go to class","scroll on phone"};
String[] choiceB = {"sleep in","take notes"};
String[] choiceC = {"skip class","sleep"};


//booleans
boolean startScreen = true;

//buttons
Button choiceBtn1;
Button choiceBtn2;
Button choiceBtn3;
Button commuter;
Button onCampus;



void setup()
{
  
  fullScreen(); //sets the game screen width and height to take up the full screen of whatever device it is being used on
  frameRate(30);//sets frameRate to 30 so that animation changes are more visible
  
  //creating the buttons
  commuter =  new Button(width/4,4*height/6,200,50,"Comuter");
  onCampus =  new Button(3*width/4,4*height/6,200,50,"On Campus");
  choiceBtn1 = new Button(3*width/4,4*height/6,200,50,choiceA[0]);
  choiceBtn2 = new Button(3*width/4,9*height/12,200,50,choiceB[0]);
  choiceBtn3 = new Button(3*width/4,5*height/6,200,50,choiceB[0]);
  startScrn();
   
}
void draw()
{
  //only show game screen when start screen is false/gone after picking what type of student you are
  if(startScreen)
  {
    startScrn();
  }
  else{
    background(180);
    player();
    drawEnergyBar();
    drawHappinessBar();
    drawStressBar();
    drawTime();
    drawEventTxtBox();
    location();
    drawBtns();
  }
}

void mousePressed()
{
    //checks if either commuter or on Campus was pick and removes the start screen
    if(startScreen)
    {
      if(commuter.isMouseOver() || onCampus.isMouseOver())
      {
         startScreen = false;
      }
    return;//ensures that actions taken on the start don't overlap with the game screen 
    } 
     if(choiceBtn1.isMouseOver())//if choice 1 is picked, event 1 and choices changes to new event and choices
    {
      println("Button clicked");
      choiceBtn1.label = choiceA[1];
      choiceBtn2.label = choiceB[1];
      choiceBtn3.label = choiceC[1];
      eventTxt = event[1];
      locationLabel = locations[2];
    }

}


void startScrn() //creates the start screen along with buttons deciding whether the player is a commuter or resident on campus
{
  
  rectMode(CENTER);
  fill(255); //background color for start screen
  rect(width/2,height/2,width,height);
  
  textAlign(CENTER,CENTER);//ensures that when text is writen text is generated at the center of the screen
  textSize(50);
  fill(0);
  text("Choose your lifestyle", width/2, height/2);
  commuter.display();
  onCampus.display();
}

//location text box, this tells the players where they are at currently
void location()
{
  rectMode(CENTER);
  fill(255);
  rect(width/2,5*height/8,350,50,15);
  textAlign(CENTER,CENTER);//ensures that when text is writen text is generated at the center of the text box
  textSize(35);
  fill(0);
  text(locationLabel , width/2, 5*height/8);
}

void drawTime()
{
  rectMode(CENTER);
  fill(255);
  rect(9*width/10,1*height/10,200,50,15);
  textAlign(CENTER,CENTER);//ensures that when text is writen text is generated at the center of the text box
  textSize(35);
  fill(0);
  text("week: 1" , 9*width/10, 1*height/10);
}

void drawEnergyBar() //draws the Energy Resource bar, and has it decrease by a set amount over time
{
  rectMode(CORNER);
  fill(255);
  rect(25,25,400,50,50);
  fill(255,255,10);
  rect(25,25,energy,50,50);
    if(energy >= 0)
  {
    energy -= 0.04;
  }
}

void drawHappinessBar() //draws the Happiness Resource bar 
{
  rectMode(CORNER);
  fill(255);
  rect(25,80,400,50,50);
  fill(0,255,0);
  rect(25,80,energy,50,50);
}

void drawStressBar() //draws the Stress Resource bar
{
  rectMode(CORNER);
  fill(255);
  rect(25,135,400,50,50);
  fill(255,0,0);
  rect(25,135,energy,50,50);
}

void player() //Player png
{
  fill(255);
  
  rect(1*width/4, height/2, 150,200);
  fill(0);
  textSize(25);
  textAlign(CENTER,CENTER);
  text("player", 1*width/4, height/2);
}

void drawEventTxtBox() // Main event text box
{
  rectMode(CENTER);
  fill(255);
  strokeWeight(2);
  rect(width/2,3*height/4, 475,200,35);
  fill(0);
  textSize(25);
  textAlign(CENTER,CENTER);
  text(eventTxt, width/2, 3*height/4);
}

void drawBtns()
{
  choiceBtn1.display();
  choiceBtn2.display();
  choiceBtn3.display();
}

void drawGrades() // code for the grade value of students
{

}

//draws the curreny amount of money a student has
void drawMoney()
{

}

void energyIncrease()//function for choices made that'll incresae energy
{

}

void energyDecrease()
{

}

void hapinessIncrease()
{
  
}
