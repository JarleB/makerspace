inner_width=21;
inner_length=34;

outer_length=inner_length+2;
outer_width=inner_width+2;
support_length=inner_length-2;
support_width=inner_width-2;
under=2;
over=4;
height=under+over;
magnet_dia=8;
kappe=4;
edge=3;

translate([0,0,(height)/2]){
  difference() { 
    cube([outer_length,outer_width,height],center=true);
    cube([support_length,support_width,height],center=true);
//          cube([inner_length,inner_width,height],center=true);
    translate([0,0,under]) {
      cube([inner_length,inner_width,height],center=true);

    }
    translate([inner_length/2,0,1.8]) {
      cube([5,8,5],center=true);

    }
    translate([-inner_length/2,0,1.8]) {
      cube([5,8,5],center=true);

    }
    translate([inner_length/2-8,inner_width/2,2.5]) {
      cube([5,4,4],center=true);

    }
     translate([inner_length/2-8,-inner_width/2,2.5]) {
      cube([5,4,4],center=true);

    }
     translate([-inner_length/2+8,-inner_width/2,2.5]) {
      cube([5,4,4],center=true);

    }
     translate([-inner_length/2+8,inner_width/2,2.5]) {
      cube([5,4,4],center=true);

    }
 }
 }