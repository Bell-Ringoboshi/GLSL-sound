#define BPM bpm

#define PI 3.14159265359
#define TAU 6.28318530718
  
//基音freq

float f = 880.0;

float baion(float bi){
  return f * bi;
}


//operater_1

float ope1( float t , float vol , float md ) {
  if ( t < 0.0 ) { return 0.0; }
  
  //frequency
  
  float f = 880.0;
  
  //envelope
  
  float attackTime  = 0.0;
  float dicayTime   = 0.1;
  float rereaseTime = 0.9;
  
  if( t < attackTime ) 
  {
    return ( t / attackTime) * sin ( TAU * f * t + md ) * vol;
  }
  else if( t - attackTime < dicayTime )
  {
    return  sin ( TAU * f * t + md ) * vol;
  }
  else
  {
    return (1.0 - t / rereaseTime ) * sin ( TAU * f * t + md ) * vol;
  }
            
}

float ope2( float t , float vol , float md) {
  if ( t < 0.0 ) { return 0.0; }
  
  //frequency
  
  float ff = baion(3.0);
  
  //envelope
  
  float attackTime  = 0.0;
  float dicayTime   = 1.0;
  float rereaseTime = 0.0;
  
  if( t < attackTime ) 
  {
    return ( t / attackTime) * sin ( TAU * ff * t + md) * vol;
  }
  else if( t - attackTime < dicayTime )
  {
    return  sin ( TAU * ff * t + md ) * vol;
  }
  else
  {
    return (1.0 - t / rereaseTime ) * sin ( TAU * ff * t + md ) * vol;
  }
            
}

float ope3( float t , float vol) {
  if ( t < 0.0 ) { return 0.0; }
  
  //frequency
  
  float fff = baion(4.5);
  
  //envelope
  
  float attackTime  = 0.0;
  float dicayTime   = 1.0;
  float rereaseTime = 0.0;
  
  if( t < attackTime ) 
  {
    return ( t / attackTime) * sin ( TAU * fff * t ) * vol;
  }
  else if( t - attackTime < dicayTime )
  {
    return  sin ( TAU * fff * t ) * vol;
  }
  else
  {
    return (1.0 - t / rereaseTime ) * sin ( TAU * fff * t ) * vol;
  }
            
}




vec2 mainAudio( vec4 time ) {
  vec2 dest = vec2( 0.0 );

  float t = time.x; // time.x = a beat
  
  //波形合成部
  
  float tope2 = time.x;
  float aope3 = ope3( t , 0.3 );
  float aope2 = ope2( t , 0.5 , aope3);
  float aope1 = ope1( t , 0.5 , aope2);
  
  dest += aope1;
  

  return dest;
}
