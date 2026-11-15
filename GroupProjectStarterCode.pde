/*
  Group Number: 3102
  Group Name: Retriver Dawgs
  Group Members: MARLEY, MCKAYLA, AMINA, ASHIRA, EDWARD
  
  Discription: This is a text based game where the player will be given a prompt and 3 choices
  each choice will result in a change to the following resouces; Grade, energy, and happiness
  
  Features: This game will have small mini games for the player to go through depending on their choices 
            though none of them have been implemented yet.
  
  The numbers next to the texts just help identify what the index value is for quicker usage
*/

//Global variables

//Global start variables
float energy = 300;
float stress = 20;
float happiness = 300;
int i = 0; //indexing number for array access
int curWeek = 1; //Current Week
int questionCnt = 1; //number questions answered for week change

//Event Text
String[] event = {"Good morning! Class starts at 10AM. Pick one!"/*event1*/,"at lecture what do you do now?"/*event2*/, 
                  "Class is over and you haven't eaten what now?"/*event3*/,"event4"/*3*/, "event5"};
String eventTxt = event[0];//holds the current event text for usage


//texts for location and choices
String[] locations = {"Dorm Room"/*0*/,"Home"/*1*/,"lecture hall"/*2*/,"Libaray"/*3*/,"Dining Hall"/*4*/,"Campus"/*5*/};
String locationLabel = locations[0];//holds the current location text for usage

String[] choiceA = {"go to class"/*0*/,"Talk to friends"/*1*/,"Get lunch"/*2*/,"eat alone"/*3*/,"event5choice1"/*4*/};                                                 
String[] choiceB = {"sleep in"/*0*/,"Take notes"/*1*/,"do homework"/*2*/,"eat with friends"/*3*/,"event5choice2"/*4*/};
String[] choiceC = {"skip class"/*0*/,"Watch Tiktok"/*1*/,"watch Tiktoks"/*2*/,"event4choice3"/*3*/,"event5choice3"/*4*/};


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
  
  //creating the buttons for start screen
  commuter =  new Button(width/4,4*height/6,200,50,"Comuter");
  onCampus =  new Button(3*width/4,4*height/6,200,50,"On Campus");
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
    
    if(eventTxt.equals(event[0]))
    {
      questionCnt++;
      println(questionCnt);
      event1();  
    }
    else if(eventTxt.equals(event[1]))
    {
      questionCnt++;
       event2();  
    }
    else if(eventTxt.equals(event[2]))
    {
      questionCnt++;
       event3();  
    }else if(eventTxt.equals(event[3]))
    {
      questionCnt++;
       event4();  
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
  weekIncease();
  rectMode(CENTER);
  fill(255);
  rect(9*width/10,1*height/10,200,50,15);
  textAlign(CENTER,CENTER);//ensures that when text is writen text is generated at the center of the text box
  textSize(35);
  fill(0);
  text("week: " + curWeek , 9*width/10, 1*height/10);
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
  rect(25,80,happiness,50,50);
}

void drawStressBar() //draws the Stress Resource bar
{
  rectMode(CORNER);
  fill(255);
  rect(25,135,400,50,50);
  fill(255,0,0);
  rect(25,135,stress,50,50);
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
  //these button creations are in the brawBtn function and not setup is so that it updats continuously for easier label changing
  choiceBtn1 = new Button(3*width/4,4*height/6,200,50,choiceA[i]);
  choiceBtn2 = new Button(3*width/4,9*height/12,200,50,choiceB[i]);
  choiceBtn3 = new Button(3*width/4,5*height/6,200,50,choiceC[i]);
  
  //makes the button appear
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

void weekIncease()
{
  if(questionCnt>=3)
  {
    curWeek++;
    questionCnt  = 1;
  }
  
}

//WORK ON THIS event1 IS ALREADY DONE WORK ON THE OTHER EVENTS
void event1()//Dorm
{
  //go to class
  if(choiceBtn1.isMouseOver())//if choice 1 is picked, event 1 and choices changes to new event and choices
      {
          println("Button clicked");
           i = 1;
          eventTxt = event[1];
          locationLabel = locations[2];
      }
      //sleep in
        else if(choiceBtn2.isMouseOver())//if choice 2 is picked, event 1 and choices changes to new event and choices
      {
          println("Button clicked");
           i = 2;
          eventTxt = event[2];
          locationLabel = locations[5];
      }
      //skip class
        else if(choiceBtn3.isMouseOver())//if choice 3 is picked, event 1 and choices changes to new event and choices
      {
          println("Button clicked");
           i = 2;
          eventTxt = event[2];
          locationLabel = locations[5];
      }
}

//event 2 choice effects
void event2()//lecture or class
{
  //talk to friends
  if(choiceBtn1.isMouseOver())//if choice 1 is picked, event 1 and choices changes to new event and choices
      {
          println("Button clicked"); 
           i = 2;
          eventTxt = event[2];
          locationLabel = locations[5];
      }
      //take notes
        else if(choiceBtn2.isMouseOver())//if choice 1 is picked, event 1 and choices changes to new event and choices
      {
          println("Button clicked");
           i = 2;
          eventTxt = event[2];
          locationLabel = locations[5];
      }
      //watch tiktoks
        else if(choiceBtn3.isMouseOver())//if choice 1 is picked, event 1 and choices changes to new event and choices
      {
          println("Button clicked");
           i = 2;
          eventTxt = event[2];
          locationLabel = locations[5];
      }
}

//event 3 choice effects
void event3()//campus
{
  if(choiceBtn1.isMouseOver())//if choice 1 is picked, event 1 and choices changes to new event and choices
      {
        //lunch btn
          println("Button clicked");
           i = 3;
          eventTxt = event[3];
          locationLabel = locations[4];
      }
      //do homework
        else if(choiceBtn2.isMouseOver())//if choice 1 is picked, event 1 and choices changes to new event and choices
      {
          println("Button clicked");
           i = 3;
          eventTxt = event[1];
          locationLabel = locations[2];
      }
      //watch tiktoks
        else if(choiceBtn3.isMouseOver())//if choice 1 is picked, event 1 and choices changes to new event and choices
      {
          println("Button clicked");
           i = 3;
          eventTxt = event[1];
          locationLabel = locations[2];
      }
}

//event 4 choice effects
void event4()//lunch
{
  //eat alone
  if(choiceBtn1.isMouseOver())//if choice 1 is picked, event 4 and choices changes to new event and choices
      {
          println("Button clicked");
           i = 4;
          eventTxt = event[4];
          locationLabel = locations[3];
      }
      //eat with friends
        else if(choiceBtn2.isMouseOver())//if choice 1 is picked, event 4 and choices changes to new event and choices
      {
          println("Button clicked");
           i = 4;
          eventTxt = event[4];
          locationLabel = locations[3];
      }
      //undecided
        else if(choiceBtn3.isMouseOver())//if choice 1 is picked, event 4 and choices changes to new event and choices
      {
          println("Button clicked");
           i = 4;
          eventTxt = event[4];
          locationLabel = locations[3];
      }
}


//event 5 choice effects
void event5()//work or dorm night
{
  if(choiceBtn1.isMouseOver())//if choice 1 is picked, event 5 and choices changes to new event and choices
      {
          println("Button clicked");
           i = 5;
          eventTxt = event[1];
          locationLabel = locations[2];
      }
        else if(choiceBtn2.isMouseOver())//if choice 1 is picked, event 5 and choices changes to new event and choices
      {
          println("Button clicked");
           i = 5;
          eventTxt = event[1];
          locationLabel = locations[2];
      }
        else if(choiceBtn3.isMouseOver())//if choice 1 is picked, event 5 and choices changes to new event and choices
      {
          println("Button clicked");
           i = 5;
          eventTxt = event[1];
          locationLabel = locations[2];
      }
}
