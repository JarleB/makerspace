$fn=100; 
width=15;
inner=19.6;
outer=22;

 difference() {
     cylinder(h=width, d=outer);
     cylinder(h=width, d=inner);
}
        translate([outer/2-1,-1,0]) {
           cube([15,2,width]);
        }
 
        translate([outer/2,-1,0]) {
           cylinder(h=width,d=1);
        }     
        translate([outer/2,1,0]) {
           cylinder(h=width,d=1);
        }
                translate([outer/2+width-1,-1.5,0]) {
                               cube([1,3,width]);

        }     