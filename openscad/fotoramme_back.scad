back_thickness=3;
inner_height=90;
inner_length=156;
thickness=2;
hole_offset_height_difference=10;
hole_offset_height=8;
hole_offset_length=3;
frame_width=18;
corner_radius=6;
corner_height=34;

corner_adjust=corner_radius*0.7;
outer_height=inner_height+(3*frame_width);
outer_length=inner_length+(2*frame_width);


module outer() {  
od=6;
odt=2.4;
tupp=1;
h=7;
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
  translate([0,0,corner_height]) {
    cube([outer_length,outer_height,back_thickness],center=true);
    standoffs();
  }
}
    
