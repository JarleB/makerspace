//$fn=30;
hole_length=190;
hole_width=70;
padding=5;
hull_thickness=6;
fn_sector=50;
fn_extrude=100;

module sector(radius, angles, fn = 24) {
    r = radius / cos(180 / fn);
    step = -360 / fn;

    points = concat([[0, 0]],
        [for(a = [angles[0] : step : angles[1] - 360]) 
            [r * cos(a), r * sin(a)]
        ],
        [[r * cos(angles[1]), r * sin(angles[1])]]
    );

    difference() {
        circle(radius, $fn = fn);
        polygon(points);
    }
}

module solid_shape(l,w,h) {
 cube([l-w,w,h],center=true);
 translate([(l-w)/2,0,-h/2]) {
     cylinder(h=h,d=w);
 }
  translate([-(l-w)/2,0,-h/2]) {
     cylinder(h=h,d=w);
 }
}

module rounded_edge(l,w,p,fn_extrude,fn_sector) {
  side_length = l-w;
  r=p;
  translate([-w/2,side_length/2,0]) rotate([90,0,0]) linear_extrude(height=side_length)  sector(r,[0,180],fn_sector);
  translate([w/2,side_length/2,0,]) rotate([90,0,0]) linear_extrude(height=side_length)  sector(r,[0,180],fn_sector);
  translate([0,side_length/2,0]) rotate_extrude(convexity=10,angle=180, $fn=fn_extrude) translate([w/2,0,0]) sector(r,[0,180],fn_sector);
  translate([0,-side_length/2,0]) rotate([0,0,180]) rotate_extrude(convexity=10,angle=180, $fn=fn_extrude) translate([w/2,0,0]) sector(r,[0,180],fn_sector);
}

module edge(l,w,d,p,f) {
  side_length = l-w;
  translate([p/2-w/2,side_length/2,0]) rotate([90,0,0]) linear_extrude(height=side_length)  square([p,d],center=true);
  translate([-p/2+w/2,l/2-w/2,0]) rotate([90,0,0]) linear_extrude(height=side_length)  square([p,d],center=true);
  translate([0,side_length/2,0]) rotate_extrude(convexity=10,angle=180,$fn=fn_extrude) translate([w/2-p/2,0,0]) square([p,d],center=true);
  translate([0,-side_length/2,0]) rotate([0,0,180]) rotate_extrude(convexity=10,angle=180,$fn=fn_extrude) translate([w/2-p/2,0,0]) square([p,d],center=true);
}

//translate([0,0,0]) rotate([0,0,90]) solid_shape(hole_length,hole_width,3);
module half_one() {
  translate([0,0,hull_thickness/4]) rounded_edge(hole_length,hole_width,padding,fn_extrude,fn_sector);
  edge(hole_length,hole_width,hull_thickness/2,padding,fn_extrude);
  translate([0,0,-hull_thickness/2])edge(hole_length,hole_width,hull_thickness/2,padding/2,fn_extrude);
}

module half_two() {
  translate([0,0,hull_thickness/4]) rounded_edge(hole_length,hole_width,padding,fn_extrude,fn_sector);
  edge(hole_length,hole_width,hull_thickness/2,padding,fn_extrude);
  translate([0,0,-hull_thickness/2])edge(hole_length-padding,hole_width-padding,hull_thickness/2,padding/2,fn_extrude);
}

half_one();
//translate([-hole_width - padding*2-5,0,0]) half_two();
