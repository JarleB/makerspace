$fn=100; 
 difference() {
     cylinder(h=6, d=30);
     cylinder(h=6, d=26);
 }
translate([0,0,6]) {
    difference() {
     cylinder(h=2, d=30);
     cylinder(h=2, d=10);
     translate([2,0,0]) cylinder(h=2, d=10);
     translate([-2,0,0]) cylinder(h=2, d=10);
    } 
}