void keyPressed() {
  if (key=='h') {


    showHz= !showHz;
    if (!showHz) {

      //  showAll=false;
      showBPM=true;

      showSun=true;

      //      tflatness= (tflatness == 1) ? -0.5:1;


 

      //
      //    showSun= !showSun;
      //    if (!showSun) {
      //
      //      showAll=false;
      //      showBPM=false;
      //
      //      showHz=true;
      //
      //      tflatness= (tflatness == 1) ? -0.5:1;


    }
  }
  else if (key=='s') {
 

    //    tflatness= (tflatness == 0.8) ? -0.5:0.8;

    showSun = !showSun;
    if (!showSun) {

      showHz=true;
      showBPM=true;
    }
  }
  else if (key=='b') {

    showBPM = !showBPM;
    if (!showBPM) {


      showSun=true;
      showHz=true;
    }
  

  }
//  else if (key =='a') {
//
//    showAll=true;
//  }
}

