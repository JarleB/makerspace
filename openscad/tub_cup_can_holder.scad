width=50;
thickness=5;
angle=10;
a=35;
b=45;
c=70;
d=70;

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


module glue(x,z) {
  translate([x+thickness/2,0,z+thickness/2]) rotate(a=-90,v=[1,0,0]) cylinder(h=width,d=thickness*1.5);
}