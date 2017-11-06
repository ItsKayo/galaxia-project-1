import sprites.utils.*;
import sprites.maths.*;
import sprites.*;
import org.gamecontrolplus.*;
import ddf.minim.*;

Sprite ship, monster, monster1;
StopWatch stopWatch = new StopWatch();

ControlIO controllIO;
ControlDevice keyboard;
ControlButton spaceBtn, leftArrow, rightArrow, downArrow;

Minim minimplay;
AudioSample popPlayer;

public void setup()
{
  size(700, 600);
  frameRate(60);

  ship = new Sprite(this, "ship.png", 1, 1, 50);
  ship.setXY(width/2, height - 30);
  ship.setVelXY(0.0f, 0);
  ship.setScale(.045);
  ship.setDomain(0, height-ship.getHeight(), width, height, Sprite.HALT);
  
  // Row 1
  for (int x=125, i=0; x<700 && i<10; x = x+50, i++)
  {
    monster = new Sprite(this, "monster.png", 1, 1, 40);
    monster.setXY(width - x, height - 350);
    monster.setScale(0.2);
    monster.setDomain(width - 630, height-monster.getHeight(), width - 100, height, Sprite.REBOUND);
    monster.setSpeed(100.0);
  }
  //Row 2
    for (int x=125, i=0; x<700 && i<10; x = x+50, i++)
  {
    monster = new Sprite(this, "monster.png", 1, 1, 40);
    monster.setXY(width - x, height - 400);
    monster.setScale(0.2);
    monster.setDomain(width - 630, height-monster.getHeight(), width - 100, height, Sprite.REBOUND);
    monster.setSpeed(100.0);
  }
    //Row 3
    for (int x=125, i=0; x<700 && i<10; x = x+50, i++)
  {
    monster = new Sprite(this, "monster.png", 1, 1, 40);
    monster.setXY(width - x, height - 450);
    monster.setScale(0.2);
    monster.setDomain(width - 630, height-monster.getHeight(), width - 100, height, Sprite.REBOUND);
    monster.setSpeed(100.0);
  }
    //Row 4
    for (int x=125, i=0; x<700 && i<10; x = x+50, i++)
  {
    monster = new Sprite(this, "monster.png", 1, 1, 40);
    monster.setXY(width - x, height - 500);
    monster.setScale(0.2);
    monster.setDomain(width - 630, height-monster.getHeight(), width - 100, height, Sprite.REBOUND);
    monster.setSpeed(100.0);
  }
    //Row 5
    for (int x=125, i=0; x<700 && i<10; x = x+50, i++)
  {
    monster = new Sprite(this, "monster.png", 1, 1, 40);
    monster.setXY(width - x, height - 550);
    monster.setScale(0.2);
    monster.setDomain(width - 630, height-monster.getHeight(), width - 100, height, Sprite.REBOUND);
    monster.setSpeed(100.0);
  }
  
  controllIO = ControlIO.getInstance(this);
  keyboard = controllIO.getDevice("Keyboard");
  spaceBtn = keyboard.getButton("Space");   
  leftArrow = keyboard.getButton("Left");   
  rightArrow = keyboard.getButton("Right");
  
  minimplay = new Minim(this); 
  popPlayer = minimplay.loadSample("pop.wav", 1024);

  registerMethod("pre", this);
}

void pre()
{
    if (focused) {
      if (leftArrow.pressed()) {
        ship.setX(ship.getX()-5);
      }
      if (rightArrow.pressed()) {
        ship.setX(ship.getX()+5);
      }
      if (spaceBtn.pressed()) {
        popPlayer.trigger();
      }
  }

  S4P.updateSprites(stopWatch.getElapsedTime());
}

void draw() {
  background(0);
  S4P.drawSprites();
}

