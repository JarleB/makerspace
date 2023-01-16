$fn=30;
//$thickness = 1;
//sphere(3);

module ushape (length,width,angle,sidelength,thickness,hooklength,hookangle) {
  cube([length,width,thickness],center=true);
  // Sidewall 1
  translate([-(length/2),(width/2),0]) {
    rotate(a=angle , v = [1,0,0]) {
      translate ([0,0,-thickness/2]) { 
        cube([length,sidelength,thickness]);
      }
    }
  }
  // Edge smooth1
  translate ([0,(width/2),0]) { 
    rotate (a=90,v=[0,1,0]) {
      cylinder(h=length,center=true,d=thickness);
    }
  }
  // Hook 1
  translate([-(length/2),width/2+sidelength*(cos(angle)),sidelength*sin(angle)]) {
    rotate(a=angle+hookangle, v = [1,0,0]) {
      translate ([0,0,-thickness/2]) { 
        cube([length,hooklength,thickness]);
      }
    }
  }
  // Hook 1 smooth 
  translate ([0,(width/2)+sidelength*(cos(angle)),sidelength*sin(angle)]) { 
    rotate (a=90,v=[0,1,0]) {
      cylinder(h=length,center=true,d=thickness);
    }
  }
  // Sidewall 2 
  translate([-(length/2),-(width/2),0]) {
    rotate(a=180-angle , v = [1,0,0]) {
      translate ([0,0,-thickness/2]) { 
        cube([length,sidelength,thickness]);
      }
    }
  }
  // Edge smooth 2 
  translate ([0,-(width/2),0]) { 
    rotate (a=90,v=[0,1,0]) {
      cylinder(h=length,center=true,d=thickness);
    }
  }
  // Hook 2
  translate([-(length/2),-width/2-sidelength*(cos(angle)),sidelength*sin(angle)]) {
    rotate(a=180-(angle+hookangle), v = [1,0,0]) {
      translate ([0,0,-thickness/2]) { 
        cube([length,hooklength,thickness]);
      }
    }
  }
  // Hook 2 smooth 
  translate ([0,-(width/2)-sidelength*(cos(angle)),sidelength*sin(angle)]) { 
    rotate (a=90,v=[0,1,0]) {
      cylinder(h=length,center=true,d=thickness);
    }
  }
}

// Params
// length = length of base plate along x axis
// width  = width of base plate along y axis
// angle  = angle of sidewalls from y axis and left 
// sidelength = length of the two sides of the U-profile
// hooklength = length of the hook at the end of the sides
// hookangle = angle of hook relative to sidewalls 

// Prøveprint 1 
// Ramma
//ushape(10,51,80,49,1,2,90);

//translate([5,0,0,]) {
//rotate (a=20, v=[0,1,0]) { 
//  translate ([5,0,0]) { 
    // Motorskjold
//    ushape(10,58,64,40,1,0,90);
//  }
//}
//}

base_length=80;
front_length=80;
base_sidewall_angle=66;
front_sidewall_angle=64;
up_angle=50;
base_width=49;
front_width=53.5;
base_wall_height=32;
front_wall_height=27;
thickness=1.5;

  difference() {
      translate ([0,0,thickness/2]) {  
      ushape(base_length,base_width,base_sidewall_angle,base_wall_height,thickness,5,5);
    }

    translate ([front_length/2+thickness,0,thickness/2]) {  
       rotate(a=-up_angle, v=[0,1,0]) {
         translate([front_length/2,0,0]) {
           ushape(front_length,front_width+(4*thickness),front_sidewall_angle,front_wall_height,thickness*3.5,0,0);
         } 
       }
     }
     
  }

  difference() { 
    translate ([base_length/2,0,thickness/2]) {  
      rotate(a=-up_angle, v=[0,1,0]) {
        translate([front_length/2,0,0]) {
          ushape(front_length,front_width,front_sidewall_angle,front_wall_height,thickness,10,25);
        } 
      }
    }
    translate ([0,0,thickness/2-thickness]) {  
      ushape(base_length,base_width+(4*thickness),base_sidewall_angle,base_wall_height,thickness*7.5,0,90);
     }
  }
  
  translate ([base_length/2,0,thickness/2]) { 
    rotate (a=90,v=[1,0,0]) {
      cylinder(h=front_width+2,center=true,d=thickness*1.2);
    }
  }
  
  // Filling holes 
    translate ([base_length/2-7,0,thickness/2]) {  
      ushape(15,base_width+5,72,base_wall_height-13,thickness,0,50);
    }
    translate ([base_length/2-17,0,thickness/2]) {  
      ushape(15,base_width+2.5,72,base_wall_height-22,thickness,0,50);
    }
//    translate ([base_length/2-2,0,thickness/2]) {  
//      ushape(5,base_width,64,base_wall_height-25,thickness,0,50);
//    }

//uknekk(sidewall_angle,up_angle,baselength,frontlength,base_width,32,1.5);
difference() {
  translate([-60,-25,97]) {
  rotate(a=-65,v=[0,1,0]) {
    rotate(a=90,v=[1,0,0]) {    
      rotate_extrude(angle=-126.5,$fn=100) {
        translate([105,0,0]) {
          square([5,55]);
        }
      }
    }
  }
  }
  translate ([0,0,8]) {
    ushape(base_length,base_width-10,base_sidewall_angle,base_wall_height+5,16,0,90);
  }
}

 translate([-60,-75,97]) {
  rotate(a=-65,v=[0,1,0]) {
    rotate(a=90,v=[1,0,0]) {    
      rotate_extrude(angle=-126.5,$fn=100) {
        translate([95,0,0]) {
          square([10,5]);
        }
      }
    }
  }
  }
