//+KFF18 



// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 75      // front view
                            location  <0.0 , 1.0 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <2.0 , 2.5 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90 // right side view
                            location  <3.0 , 1.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0.0 , 3.0 ,-0.001>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
//camera{Camera_0}
// sun ---------------------------------------------------------------------
//light_source{<-1500,2000,-2500> color White}
/*
// sky -------------------------------------------------------------- 
plane{<0,1,0>,1 hollow  
       texture{ pigment{ bozo turbulence 0.92
                         color_map { [0.00 rgb <0.20, 0.20, 1.0>*0.9]
                                     [0.50 rgb <0.20, 0.20, 1.0>*0.9]
                                     [0.70 rgb <1,1,1>]
                                     [0.85 rgb <0.25,0.25,0.25>]
                                     [1.0 rgb <0.5,0.5,0.5>]}
                        scale<1,1,1.5>*2.5  translate< 0,0,0>
                       }
                finish {ambient 1 diffuse 0} }      
       scale 10000}
*/

// fog on the ground -------------------------------------------------
fog { fog_type   2
      distance   50
      color      White  
      fog_offset 0.1
      fog_alt    1.5
      turbulence 1.8
    }

// ground ------------------------------------------------------------
plane { <0,1,0>, 0 
        texture{ pigment{ color rgb<0.35,0.65,0.0>*0.72 }
	         normal { bumps 0.75 scale 0.015 }
                 finish { phong 0.1 }
               } // end of texture
      } // end of plane
//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------

height_field{ png "plasma3.png" smooth double_illuminate
      // file types: 
      // gif | tga | pot | png | pgm | ppm | jpeg | tiff | sys
      // [water_level N] // truncate/clip below N (0.0 ... 1.0)
      translate<-0.5, -1,0>
      scale<200,-30, 60> 
      texture{ pigment { color rgb <0.85,0.6,0.4>}
               normal  { bumps 0.75 scale 0.025  }
             } // end of texture
      rotate<0,0,0>
      translate<0,-10,100>
} // end of height_field ----------------------------------
    

cylinder { <0,0,2>,<0,1.9,0>, 0.15 

             texture { T_Grnt9
                   //normal { agate 0.15 scale 0.15}
                   finish { phong 0.5 } 
                   scale 1 


                   //normal  { bumps 0.5 scale <0.005,0.25,0.005>}
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } // end of texture

           scale <1,1,1> rotate<0,0,0> translate<0,0,0>
} // end of cylinder -------------------------------------

  
  
light_source{<0+(clock*2-1)*20,27-abs(clock*2-1)*3,40> color <1, 0.6,  0.2>
	spotlight
	looks_like{
        sphere {<0+(clock*2-1)*20,27-abs(clock*2-1)*3,40>, 3
           texture {finish {ambient 1} pigment{color <1, 0.6,  0.2>}}
        } 
    }
}


box{
	<-4, 0.1 , 4>  < 4,0,-4>
	       texture{ T_Wood29    
                normal { wood 0.5 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture 


}

camera{ location <0,3,-17>
        look_at <0,4,0>}
        

#declare stone = union { 
	sphere{0 .7 scale z*.2 translate <0,-.1,0.2>}
	sphere{0 .2 scale z*.15 translate <-.2,.1,0.2>}
	sphere{0 .3 scale z*.1 translate <0,-.3,0.15>}
	       texture{ T_Stone15    
                normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture 
}

object{
	stone 
	translate  <3,0,0>
	scale 1.1
	rotate  y*-15
}

object{
	stone 
	translate  <-3.1,0,0>
	scale 1.2
	rotate  y*30
}

object{
	stone 
	translate  <0,0,-5.8>
	scale .6
}
