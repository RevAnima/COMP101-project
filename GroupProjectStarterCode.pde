//Global start variables
float energy = 300;
float stress = 0;
float happiness = 0;

//startScrn var to remove it after picking whether you are a commuter or on campus student
float startScrnbgY;
float commuteBtnY;
float onCampusBtnY;
float startScrntxt;

//Event Text
String[] event = {"Class starts at 10AM what do you want to do","you're at your lecture what do you do now"};
String eventTxt = event[0];
String event_B_txt = "";
String event_C_txt = "";
String event_D_txt = "";

//texts
String[] locations = {"Dorm Room","Home","Libaray","Dining Hall","Club Room" };
String[] choiceA = {"go to class","scroll on phone"};
String[] choiceB = {"sleep in","take notes"};
String[] choiceC = {"skip class","sleep"};

//choice text selection
String Choice1 = choiceA[0];
String Choice3 = choiceB[0];
String Choice2 = choiceC[0];

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
  fullScreen();
  frameRate(30);
  startScrnbgY = height/2;
  commuteBtnY = 4*height/6;
  onCampusBtnY = 4*height/6;
  startScrntxt = height/2;
  startScrn();
   
}
void draw()
{
  if(!startScreen)
  {
    background(180);
    player();
    drawEnergyBar();
    drawHappinessBar();
    drawStressBar();
    drawEventTxtBox();
    drawBtns();
  }

  
  
  // if(energy >= 0)
  //{
  //  energy -= 0.04;
  //}
}

void mousePressed()
{
  if(!startScreen)
  {
     if(choiceBtn1.isMouseOver())
    {
      println("Button clicked");
      Choice1 = choiceA[1];
      Choice2 = choiceB[1];
      Choice3 = choiceC[1];
      eventTxt = event[1];
    }
  }
  
  if(commuter.isMouseOver() || onCampus.isMouseOver())
  {
     commuteBtnY = 10000;
     onCampusBtnY = 10000;
     startScrnbgY = 10000;
     startScrntxt = 10000;
     startScreen = false;
  }
  
}

void startScrn()
{
  
  rectMode(CENTER);
  fill(255); //background color for start screen
  rect(width/2,startScrnbgY,width,height);
  
  textAlign(CENTER);
  textSize(50);
  fill(0);
  text("Choose your lifestyle", width/2, startScrntxt);
  commuter =  new Button(width/4,commuteBtnY,200,50,"Comuter");
  commuter.display();
  onCampus =  new Button(3*width/4,onCampusBtnY,200,50,"On Campus");
  onCampus.display();
}

void drawEnergyBar() //Energy Resource bar
{
  rectMode(CORNER);
  fill(255);
  rect(25,25,400,50,50);
  fill(255,255,10);
  rect(25,25,energy,50,50);
}

void drawHappinessBar() //Happiness Resource bar 
{
  rectMode(CORNER);
  fill(255);
  rect(25,80,400,50,50);
  fill(0,255,0);
  rect(25,80,energy,50,50);
}

void drawStressBar() //Stress Resource bar
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

void drawGrades() // code for the grade value of students
{

}

void drawMoney()
{

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
  choiceBtn1 = new Button(3*width/4,4*height/6,200,50,Choice1);
  choiceBtn1.display();
  choiceBtn2 = new Button(3*width/4,9*height/12,200,50,Choice2);
  choiceBtn2.display();
  choiceBtn3 = new Button(3*width/4,5*height/6,200,50,Choice3);
  choiceBtn3.display();
}


void energyIncrease()
{

}

void energyDecrease()
{

}

void hapinessIncrease()
{
  
}

void eventA()//morning
{

}

void eventB()//lunch
{

}

void eventC()//afternoon
{

}

void eventD()//night
{

}


void forcedRestEvent()//may not be implemented
{

}

void forcedEatEvent()//may not be implemented
{

}
