class Orbiter {

  float radius;
  float theta=0;
  float thetaSpeed;
  float depth=0;
  int depthSun=5;
  int depthBPM=100;
  int depthHz=200;

  int generation=0;

  //Array Lists
  ArrayList<Orbiter> childrenSun= new ArrayList();
  ArrayList<Orbiter> childrenHz= new ArrayList();
  ArrayList<Orbiter> childrenBPM= new ArrayList();


  //Orbiter Constructor
  Orbiter(float r, float t) {
    radius= r;
    thetaSpeed=t*.00001;
    println(thetaSpeed);
  }

  void update() {
    theta += thetaSpeed*flatness;
  }

  void render() {


    pushMatrix();
    rotate(theta*flatness);
    
    line(0, 0, 0, radius, 0, depth*(1-flatness));

    translate(radius, 0, depth*(1-flatness));

    ellipse(0, 0, 10, 10);
    //array list childrenSun 
    for (Orbiter kid:childrenSun) {
      kid.update();
      kid.render();
    }
    //array list childrenBPM
    for (Orbiter kid:childrenBPM) {
      kid.update();
      kid.render();
    }
    //array list childrenHz
    for (Orbiter kid:childrenHz) {
      kid.update();
      kid.render();
    }
    popMatrix();
  }



  //spawnMethods
  ///Sun spawns
  void spawnSun1() {



    Orbiter kid= new Orbiter(kidsSunR, extremeGeoF);

    childrenSun.add(kid);


    kid.depth=depthSun;
    kid.generation= generation+1;
  }

  void spawnSun2() {

    Orbiter kid= new Orbiter(kidsSunR, severeGeoF);

    childrenSun.add(kid);

    //depth in X-dimension
    kid.depth=depthSun;
    kid.generation=generation;
  }

  void spawnSun3() {

    Orbiter kid= new Orbiter(kidsSunR, sunSpotF);

    childrenSun.add(kid);

    //depth in X-dimension
    kid.depth=depthSun;
    kid.generation=generation;
  }

  void spawnSun4() {

    Orbiter kid= new Orbiter(kidsSunR, strongGeoF);

    childrenSun.add(kid);

    //depth in X-dimension
    kid.depth=depthSun;
    kid.generation=generation;
  }

  void spawnSun5() {
    Orbiter kid= new Orbiter(kidsSunR, moderateGeoF);
    childrenSun.add(kid);
    kid.depth=depthSun;
    kid.generation= generation+1;
  }

  //BPM SPAWNS
  void spawnBPM1() {

    Orbiter kid= new Orbiter(kidsBPMR, respBPM);
    childrenBPM.add(kid);
    //depth determina la profundidad en el Z dimension.
    kid.depth=depthBPM;
    kid.generation= generation+1;
  }

  void spawnBPM2() {

    Orbiter kid= new Orbiter(kidsBPMR, michaelBPM);
    childrenBPM.add(kid);
    kid.depth=depthBPM;
    kid.generation= generation+1;
  }

  void spawnBPM3() {

    Orbiter kid= new Orbiter(kidsBPMR, heartBPM);
    childrenBPM.add(kid);
    //depth in X-dimension
    kid.depth=depthBPM;
    kid.generation=generation;
  }  

  //HERTZ SPAWNS
  void spawnHz1() {

    Orbiter kid= new Orbiter(kidsRadius, schFq);
    thetaSpeed=thetaSpeed/1000;
    childrenHz.add(kid);
    //depth determina la profundidad en el Z dimension.
    kid.depth=depthHz;
    kid.generation= generation;
  }

  void spawnHz2() {

    Orbiter kid= new Orbiter(kidsRadius, alphaFq);
    childrenHz.add(kid);
    //depth determina la profundidad en el Z dimension.
    kid.depth=depthHz;
    kid.generation= generation;
  }

  void spawnHz3() {

    Orbiter kid= new Orbiter(kidsRadius, lightningFq);
    childrenHz.add(kid);
    //depth determina la profundidad en el Z dimension.
    kid.depth=depthHz;
    kid.generation= generation;
  }
}

