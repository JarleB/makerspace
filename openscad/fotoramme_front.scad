$fn=50;
//include  <./lib/fotoramme_back.scad>;

back_thickness=0.5;
inner_height=90;
inner_length=156;
thickness=2;
hole_offset_height_difference=10;
hole_offset_height=8;
hole_offset_length=3;
frame_width=18;
corner_radius=6;
corner_height=37;

corner_adjust=corner_radius*0.7;
outer_height=inner_height+(3*frame_width);
outer_length=inner_length+(2*frame_width);

foot_width=8;



module left_foot() {
  translate([outer_length/2+foot_width/2-corner_adjust,-outer_height/2,-thickness/2]) {
    foot();
  }
}
module right_foot() {
  translate([-outer_length/2+foot_width/2+corner_adjust,-outer_height/2,-thickness/2]) {
    foot();
  }
}
module foot() {
  rotate(a=270,v=[0,0,1]) {
    rotate(a=90,v=[1,0,0]) {
      linear_extrude(height=foot_width) {
        polygon(points=[[0,0],[corner_height/5,0],[3,corner_height],[0,corner_height]]);
      }
    }
  }
}


module frame_front() { 
  difference() { 
    cube([outer_length,outer_height,thickness],center=true);
    inner_hole();
  }
  difference() { 
    translate([0,0,thickness/2+1]) {
        cube([inner_length+2,inner_height+2,2],center=true);
    }
    inner_hole();
  }
  screw_fixing();
 corners();
  sides();
  right_foot();
  left_foot();
//  bottom_plate();
  top_plate();
//  back_plate();
}

 
module inner_hole() {
    cube([inner_length,inner_height,thickness+20],center=true);
}

module bottom() {
    translate([outer_length/2-thickness/2,0,corner_height/2-thickness/2]) {
      cube([thickness,outer_height,corner_height],center=true);
    }
    translate([-outer_length/2+thickness/2,0,corner_height/2-thickness/2]) {
      cube([thickness,outer_height,corner_height],center=true);
    }
}

module sides() {
    translate([outer_length/2-thickness/2,0,corner_height/2-thickness/2]) {
      cube([thickness,outer_height,corner_height],center=true);
    }
    translate([-outer_length/2+thickness/2,0,corner_height/2-thickness/2]) {
      difference() {   
        cube([thickness,outer_height,corner_height],center=true);
          translate([0,0,-11.5+8]) {
            cube([thickness,outer_height-3*corner_radius,10],center=true);
          }
        }
    }
}


module corners() {
  frame_corner(outer_length/2-corner_adjust,outer_height/2-corner_adjust,-thickness/2,corner_height);
  frame_corner(-outer_length/2+corner_adjust,outer_height/2-corner_adjust,-thickness/2,corner_height);
  frame_corner(-outer_length/2+corner_adjust,-outer_height/2+corner_adjust,-thickness/2,corner_height);
  frame_corner(outer_length/2-corner_adjust,-outer_height/2+corner_adjust,-thickness/2,corner_height);
}
module screw_fixing() {
  lcd_screw_attachment(inner_length/2-2,inner_height/2+hole_offset_height,thickness/2);
  lcd_screw_attachment(-inner_length/2-hole_offset_length,inner_height/2+hole_offset_height,thickness/2);
  lcd_screw_attachment(-inner_length/2-hole_offset_length,-inner_height/2-(hole_offset_height+hole_offset_height_difference),thickness/2);
  lcd_screw_attachment(inner_length/2-2,-inner_height/2-(hole_offset_height+hole_offset_height_difference),thickness/2);
}
module frame_corner(x,y,z,height) {
  translate([x,y,z+height/2]) {
    cylinder(h=height,r=corner_radius,center=true);
  }
}

module lcd_screw_attachment(x,y,z) {
  cylinder_height = 8;
  translate([x,y,z+cylinder_height/2]) {
      difference() {
        cylinder(h=cylinder_height,d=10,center=true);
        translate([0,0,0]) {
            cylinder($fn=6,h=cylinder_height+1,d=5.5,center=true);
        }
      }
  }
}
module bottom_plate() {
  translate([0,-outer_height/2+thickness/2,corner_height/2-thickness/2]) {
    rotate(a=90,v=[1,0,0]) {
      perforated_plate(outer_length,corner_height,thickness);
    }
  }
}

module top_plate() {
  translate([0,outer_height/2-thickness/2,corner_height/2-thickness/2]) {
    rotate(a=90,v=[1,0,0]) {
      perforated_plate(outer_length,corner_height,thickness);
    }
  }
}

module perforated_plate(l,b,h) {
    hole_size=5;
    hole_distance=1.3*hole_size;
    margin=hole_distance;
    corner_margin=10;
    difference() {
        cube([l,b,h],center=true);
        for (j=[-b/2+margin:hole_distance:b/2-margin]) {
          for (i=[-l/2+margin+corner_margin:hole_distance:l/2-(margin+corner_margin)]) {
            translate([i,j,0]) {
              cylinder(h=h,d=hole_size,center=true);
            }
          }
       }
   }
}
module back_corner_cut() {
  frame_corner(outer_length/2-corner_adjust,outer_height/2-corner_adjust,-back_thickness/2,back_thickness);
  frame_corner(-outer_length/2+corner_adjust,outer_height/2-corner_adjust,-back_thickness/2,back_thickness);
  frame_corner(-outer_length/2+corner_adjust,-outer_height/2+corner_adjust,-back_thickness/2,back_thickness);
  frame_corner(outer_length/2-corner_adjust,-outer_height/2+corner_adjust,-back_thickness/2,back_thickness);
}
module outer() {  
od=6;
odt=2.4;
tupp=1;
h=3;
  translate([3.5, 3.5, back_thickness/2])
	cylinder(d=od, h=h);
  translate([3.5, 3.5+49, back_thickness/2])
	cylinder(d=od, h=h);
  translate([3.5+58, 3.5, back_thickness/2])
	cylinder(d=od, h=h);
  translate([3.5+58, 3.5+49, back_thickness/2])
	cylinder(d=od, h=h);
  translate([3.5, 3.5, back_thickness/2 + tupp])
	cylinder(d=odt, h=h);
  translate([3.5, 3.5+49, back_thickness/2 + tupp])
	cylinder(d=odt, h=h);
  translate([3.5+58, 3.5, back_thickness/2 + tupp])
	cylinder(d=odt, h=h);
  translate([3.5+58, 3.5+49,back_thickness/2 +  tupp])
	cylinder(d=odt, h=h);

}
module inner() {
id=1.5;
odt=2.4;
tupp=1;
h=7;
translate([3.5, 3.5, 1])
	cylinder(d=id, h=back_thickness/2 + h+tupp);
translate([3.5, 3.5+49, 1])
	cylinder(d=id, h=back_thickness/2 + h+tupp);
translate([3.5+58, 3.5, 1])
	cylinder(d=id, h=back_thickness/2 + h+tupp);
translate([3.5+58, 3.5+49, 1])
	cylinder(d=id, h=back_thickness/2 + h+tupp);

}

module standoffs() {
translate([-24.5,0,0]) {
  rotate(a=270,v=[0,0,1]) {
    difference() {
      outer();
      inner();
    }
  }
  }
}

module back_plate() {
  difference() {
    cube([outer_length,outer_height,back_thickness],center=true);
    back_corner_cut();
  }
  standoffs();
}
    
module back_plate_proto() {
     translate ([3,-32,0]) {
 difference() {
    cube([60,70,back_thickness],center=true);
    cube([40,50,back_thickness],center=true);
    }
//    back_corner_cut();
  }
  standoffs();
}

//frame_front();
back_plate();

