import 'dart:math';

class Temp {

  double value = 0.00;
  double ce = 5/9;
  double fa = 9/5;

  cTof(double num){
    value = (fa*(num))+32;
    return value;
  }

  cTok(double num){
    value = num+273;
    return value;
  }

  fToc(double num){
    value = (ce)*(num-32);
    return value;
  }

  fTok(double num){
    value = (ce)*(num-32)+273.15;
    return value;
  }

  kToc(double num){
    value = num-273;
    return value;
  }

  kTof(double num){
    value = (fa*(num-273))+32;
    return value;
  }

}