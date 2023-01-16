$fn=50;

//rotate([90,0,0])holder();
//translate([130,0,0])rotate([90,0,0])mirror()holder();
 
distance = 73.5;
edge = 40;
thick = 10;
groove_pos = 47;
difference () {
    part(distance);
    translate([groove_pos,thick,0])cylinder(thick,r1=0.5,r2=0.5);
}
rotate(90,0,0)part(edge);
translate([distance+thick,0,0])rotate(90,0,0)part(edge);

module part(l) {
  cube([l,thick,thick]);
}
module holder(){
h=7;
x=40;
y=100;

rn=3.5;

difference(){
hull(){
cube([x,y,h+3+3]);
translate([rn,rn,h+6])sphere(6);
translate([rn,rn,h+6])sphere(6);
translate([x-rn,rn,h+6])sphere(6);

translate([rn,y-rn,h+6])sphere(6);
translate([x-rn,y-rn,h+6])sphere(6);

}


translate([5,y+5,h+9])
rotate([180,0,0])
hull(){
cube([x,y,h]);
translate([rn,rn,h])sphere(6);
translate([rn,rn,h])sphere(6);
translate([x-rn,rn,h])sphere(6);
translate([rn,y-rn,h])sphere(6);
translate([x-rn,y-rn,h])sphere(6);

}

translate([20,25,h])cube([x,y,h+10]);

translate([x/2,y-16,0])cylinder(h=5,r1=1,r2=7);
translate([x/2,y-70,0])cylinder(h=5,r1=1,r2=7);

translate([45,40,-0.1])cube([x,y,h]);

translate([x-2,21,h+5])sg();
translate([x-44,y-2,h+5])sg();

translate([x-19,y-4,-0.1])sg();
translate([x-3,y-64,-0.1])sg();

translate([5,y,0])rotate([45,0,0])cube([x,4,4]);
}
}


module sg(){
	difference(){
	cube([10,10,10]);
	cylinder(h=10,r=4);
}
}