$fn=500;
thickness=5;
angle=5;
a=34;
b=55;
c=70;
d=35;
cup_wall_thickness=5;
cup_diameter=75;
cup_height=60;
width=cup_diameter+2*thickness;

cube([thickness,width,a]);

translate([thickness,0,a]) { 
  cube([b,width,thickness]);
};
    

translate([b+thickness,0,a]) { 
    rotate(a=180-angle,v=[0,1,0]) { 
    translate([-thickness,0,0]) cube([thickness,width,c]); 
  };
};

translate([b+2*thickness+c*sin(angle),0,a-(c*cos(angle)+thickness/2)]) { 
  cube([d+2*thickness,width,thickness]);
};


glue(0,a);
glue(b+thickness,a);
glue(b+sin(angle)*c+thickness,a-(c*cos(angle)+thickness/2));


translate([b+c*sin(angle)+d+15,width/2,a-(c*cos(angle)+thickness/2)]) {
  difference()  { 
    cylinder(h=cup_height,d=width); 
    translate([0,0,thickness]) cylinder(h=cup_height,d=width-2*thickness);
   }
}

module glue(x,z) {
  translate([x+thickness/2,0,z+thickness/2]) rotate(a=-90,v=[1,0,0]) cylinder(h=width,d=thickness*1.5);
}