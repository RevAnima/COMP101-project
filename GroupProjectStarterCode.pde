//Global start variables
float energy = 300;
float stress = 0;
float happiness = 0;

//Event Text
String[] eventTxt = {"Class starts at 10AM what do you want to do"};
String event_A_txt = "";
String event_B_txt = "";
String event_C_txt = "";
String event_D_txt = "";

//texts
String[] locations = {"Dorm Room","Home","Libaray","Dining Hall","Club Room" };
String[] choiceA = {"choice 1"};
String choiceB = "";
String choiceC = "";

//choice text selection
String Choice1 = choiceA[0];

//buttons
Button choiceBtn1;
Button commuter;
Button onCampus;

void setup()
{
  fullScreen();
  frameRate(30);
  
  
}
void draw()
{
  background(180);
  player();
  drawEnergyBar();
  drawHappinessBar();
  drawStressBar();
  drawEventTxtBox();
  drawBtns();
  startScrn(3*width/4,width/4,4*height/6,4*height/6);
  
  // if(energy >= 0)
  //{
  //  energy -= 0.04;
  //}
}

void mousePressed()
{
  
  if(choiceBtn1.isMouseOver())
  {
    println("Button clicked");
    Choice1 = "hello";
  }
  if(commuter.isMouseOver())
  {
     startScrn(3*width/4,width/4,4*height/6,4*height/6);
  }
}

void startScrn(float onCampusX,float commuterX,float commuterY,float onCampusY)
{
  
  
  rectMode(CENTER);
  fill(255);
  rect(width/2,height/2,width,height);
  textSize(50);
  fill(0);
  text("Choose your lifestyel", width/2, height/2);
  commuter =  new Button(commuterX,commuterY,200,50,"Comuter");
  commuter.display();
  onCampus =  new Button(onCampusX,onCampusY,200,50,"On Campus");
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
  rect(width/2,3*height/4, 400,200);
  fill(0);
  textSize(25);
  textAlign(CENTER,CENTER);
  text("EVENT TEXT", width/2, 3*height/4);
}

void drawBtns()
{
  choiceBtn1 = new Button(3*width/4,4*height/6,200,50,Choice1);
  choiceBtn1.display();
  //choice1Btn(3*width/4,4*height/6,200,50);
  choice2Btn();
  choice3Btn();
}
//void choice1Btn(int cb1x, int cb1y, int cb1w, int cb1h)
//{
  
//  rectMode(CENTER);
//  fill(255);
//  rect(cb1x,cb1y,cb1w,cb1h);
//  fill(0);
//  textSize(25);
//  textAlign(CENTER,CENTER);
//  text("choice 1", 3*width/4,4*height/6);
//}

void choice2Btn()
{
  rectMode(CENTER);
  fill(255);
  rect(3*width/4,9*height/12, 200,50);
  fill(0);
  textSize(25);
  textAlign(CENTER,CENTER);
  text("choice 2", 3*width/4,9*height/12);
}

void choice3Btn()
{
  rectMode(CENTER);
  fill(255);
  rect(3*width/4,5*height/6, 200,50);
  fill(0);
  textSize(25);
  textAlign(CENTER,CENTER);
  text("choice 3", 3*width/4,5*height/6);
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
