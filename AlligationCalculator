
  /*
  *  Alligation Calculator
  *  All code writeen by : Derek Cresswell
  */
  
  import controlP5.*;
  import java.lang.Math.*;
  
  ControlP5 cp5;
  
  void setup(){
    
    cp5 = new ControlP5(this);
    
    alternate(10, 100, 15, 60);
    
  }
  
  void draw(){
  
  }
  
  public float[] alternate(float per1, float per2, float desP, float desW){
    
    float[] toRet = new float[4];
    //[0] = Parts of One, [1] = Parts of Two, [2] = Weight of One, [3] = Weight of Two
    
    float pOne = Math.abs(per2 - desP);
    float pTwo = Math.abs(per1 - desP);
    
    //sqrt?
    for(int i = 1; i <= pOne && i <= pTwo; i++){
      if(pOne % i == 0 && pTwo % i == 0){
        pOne /= i;
        pTwo /= i;
      }
    }
    
    float pTot = pOne + pTwo;
    
    toRet[0] = pOne; toRet[1] = pTwo;
    toRet[2] = (pOne / pTot) * desW;
    toRet[3] = (pTwo / pTot) * desW;
    
    //TEMP
    for(int i = 0; i < toRet.length; i++){
      System.out.print(toRet[i] + " ");
    }
    
    return toRet;
  }
