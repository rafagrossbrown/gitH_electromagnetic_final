/*
Data Rep Fall 2013 final project
 Rafael Gross-Brown
 rafagrossbrown@gmail.com
 
 Cada tipo de cicle/time unit sera un ArrayList distinto.
 Comenzar con cycles per year.
 

 
 
 ** minutes in 11 years=5,785,439
 10E6= 1,000,000
 
 days in 11 years= 4015
 
 //1/11 years= .090909091
 
 */

PFont f;

Orbiter seedSun;

//...SUN CYCLE VARS
///seedSun (seed thetaspeed)
int sunTFactor= 1;
float seedSunF= 0.9 ;
///Seed Radius
float seedSunR= 10;
///Kids Radius
float kidsSunR=random(90, 180);
color sunColor= color(255, 82, 13); 
//Sun 1 Geomagnetic Storm(Extreme)   4 per cycle 
float extremeGeoF =  4/sunTFactor;
//sun 2:Geomagnetic Storm(Severe)    100 per cycle
float severeGeoF = 100/sunTFactor ;
//sun 3: sun spot cycle (1/11 years)
float sunSpotF = 1/sunTFactor ;
//sun 4: Strong Geomagnetic Storms
float strongGeoF= 200/sunTFactor;
//sun 5: Moderate Geomagnetic Storms
float moderateGeoF= 600/sunTFactor;

Orbiter seedBPM;


//...RPM VARS
color bpmColor= color(34, 149, 0);
int bpmTFactor=1;
////seedBPM
float seedBPMF= 0.9 ;
//Seed Radius
float seedBPMR= 10;
//Kids Radius
float kidsBPMR=50;

//spawn1 BPM  
float respBPM = 12/bpmTFactor;
//spawn2 BPM
float michaelBPM = 117/bpmTFactor;
//spawn3 BPM
float heartBPM= 70/bpmTFactor;

Orbiter seed;

//...HERTZ CYCLE VARS
int hzTFactor=1;
color hertzColor= color(255);
float seedRadius= 10;
float kidsRadius=100;
//default framerate is 60 per second, i.e., 60 hz
float seedFq= 0.9;
//Sp 1 SchumFq
float schFq= 7.83/hzTFactor;
//Spawn2
float alphaFq= 9/hzTFactor ;
//Spawn3 Highest Frequency
float lightningFq= 50/hzTFactor;

//flatness se refiere al grado de rotacion del Matrix. 
 

float flatness=1;
float tflatness=1;


Orbiter blueSpot;

boolean showSun=true;
boolean showHz= true;
boolean showBPM=true;
boolean showAll=false;



void setup() {
  size(1280, 720, P3D);
  //  cam = new PeasyCam(this, 10);
  //  cam.setMinimumDistance(10);
  //  cam.setMaximumDistance(100);
  f= createFont("Futura", 16, true);
  smooth(2);

  blueSpot= new Orbiter(seedSunR, seedSunF);

  //init seeds
  seedSun = new Orbiter(seedSunR, seedSunF);
  ///Hertz Seed
  seed= new Orbiter(seedRadius, seedFq);  
  //bpm seed
  seedBPM= new Orbiter(seedBPMR, seedBPMF);
  //spawn seeds
  spawnSunCycle();
  spawnBPM();
  spawnKidsHz();
}






void draw() {
  background(38, 37, 80);
 textFont(f);
  fill(sunColor);
  text("11 year cycles:Sunspot Cycle once every 11 years; Geomagnetic Storm(Extreme) =4 per cycle; Geomagnetic Storm(Severe)= 100 per cycle;", 50, 50);
  text("Geomagnetic Storm(Strong)=200 per cycle ;and Moderate storms occur 600 times every 11 years.", 50, 80);
  fill(bpmColor);
  text("BPM: Human Heart = 60;Breathing = 15; Billie Jean = 117", 50, 110);
  fill(hertzColor);
  text("Hertz: Schumann Resonance = 7.83; Lightning Recurrence in the ionosphere = 50; Alpha Waves (Neural Oscillation) = 8 - 13", 50, 140);

   fill(255);
  textFont(f);
  text("TOGGLE(show/hide): Press 's' for 11 year cycles; 'h' for hertz; 'b' for BPM", 50, height-50);
  
  
  pushMatrix();
  flatness= lerp(flatness, tflatness, 0.05);
  translate(width/2, height/2 +(50 *(1-flatness)));
  //este rotateX gira el matrix en el x axis.
  rotateX(PI/2* (1-flatness));




  //  rotateY(radians(20)+flatness);
  //  zRot=radians(10);
  //  rotateZ(zRot);
  //displayBlueSpot();
  ////display oscillations




    if (showHz) {

    displayHertz();
  }

  if (showSun) {

    displaySunCycle();
  }

  if (showBPM) {
    displayBPM();
  }

  //  if (showAll) {
  //    showBPM=true;
  //    showHz=true;
  //    showSun=true;
  //  }

  displayBlueSpot();

  popMatrix();
}


void displaySunCycle() {
  //RED
  stroke(sunColor);
  fill(sunColor, 40);
  seedSun.update();
  seedSun.render();
}

void displayBPM() {

  stroke(bpmColor);
  fill(bpmColor, 40);
  seedBPM.update();
  seedBPM.render();
}

void displayBlueSpot() {

  pushMatrix();
  rotate(blueSpot.theta*flatness);
  // line(0, 0, 0, radius, 0, depth*(1-flatness));

  translate(blueSpot.radius, 0, blueSpot.depth*(1-flatness));

  stroke(38, 37, 80);
  fill(38, 37, 80);
  ellipse(0, 0, 40, 40);
  //array list childrenSun 
  popMatrix();

  blueSpot.update();
  blueSpot.render();
}

void displayHertz() {
  //BLUE
  stroke(hertzColor);
  fill(hertzColor, 40);
  seed.update();
  seed.render();
}

void spawnSunCycle () {
  seedSun.spawnSun1();
  seedSun.spawnSun2();
  seedSun.spawnSun3();
  seedSun.spawnSun4();
  seedSun.spawnSun5();
}

void spawnBPM() {
  seedBPM.spawnBPM1();
  seedBPM.spawnBPM2();
  seedBPM.spawnBPM3();
}

void spawnKidsHz() {
  seed.spawnHz1();
  seed.spawnHz2();
  seed.spawnHz3();
}

