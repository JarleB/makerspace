$fn=100;
outer=20;
inner=12;
height=3;

difference() {
  cylinder(h=height,d=outer);
  cylinder(h=height,d=inner);
}