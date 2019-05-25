
  /*
  *  Alligation Calculator
  *  All code writeen by : Derek Cresswell
  */
  
  import controlP5.*;
  import java.lang.Math.*;
  
  ControlP5 cp5;
  
  void setup(){
    size(300, 300);
    
    cp5 = new ControlP5(this);
    cp5.addTextfield("First_Percent").setPosition(20, 20).setSize(45, 25);
    cp5.addTextfield("Second_Percent").setPosition(20, 70).setSize(45, 25);
    cp5.addTextfield("Desired_Percent").setPosition(95, 45).setSize(45, 25);
    cp5.addTextfield("Desired_Weight").setPosition(180, 45).setSize(45, 25);
    cp5.addBang("Calculate").setPosition(20, 120).setSize(45, 25);
    cp5.addTextarea("Result").setPosition(20, 165).setSize(260, 120).setColorBackground(0).setColor(255)
    .setBorderColor(255).setFont(createFont("Arial", 15));
    
    alternate(10, 100, 15, 60);
    
  }
  
  void draw(){
    background(0);
  }
  
  public void Calculate(){
    
    if(true /* add checks */){
      
      float pOne = Float.parseFloat(cp5.get(Textfield.class, "First_Percent").getText());
      float pTwo = Float.parseFloat(cp5.get(Textfield.class, "Second_Percent").getText());
      float dP = Float.parseFloat(cp5.get(Textfield.class, "Desired_Percent").getText());
      float dW = Float.parseFloat(cp5.get(Textfield.class, "Desired_Weight").getText());
      
      
      float[] hold = alternate(pOne, pTwo, dP, dW);
      String str = dW + "units of " + dP + "% is made with : \n" + 
                   hold[0] + " parts of " + pOne + "% and\n" + hold[1] + " parts of " +
                   pTwo + "%\n\nTo mix this use :\n" + 
                   hold[2] + "units of " + pOne + " and\n" + hold[3] + "units of " + pTwo;
      cp5.get(Textarea.class, "Result").setText(str);
    }
    
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
    
    return toRet;
  }
