/*
 * Copyright 2021 Code and Make (codeandmake.com)
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

/*
 * Pen Holder Fridge Magnet by Code and Make (https://codeandmake.com/)
 *
 * https://codeandmake.com/post/pen-holder-fridge-magnet
 *
 * Pen Holder Fridge Magnet v1.0 (10 April 2021)
 */

/* [General] */

// The minimum thickness of the material
Material_Thickness = 2; // [1:0.1:5]

/* [Pen Hole] */

// Diameter of the pen hole
Pen_Hole_Diameter = 14; // [5:0.1:25]

// Total depth of the pen hole
Pen_Hole_Depth = 70; // [25:1:150]

/* [Magnet Holes] */

// Diameter of the magnet hole
Magnet_Hole_Diameter = 8.5; // [1:0.1:15]

// Depth of the magnet hole
Magnet_Hole_Depth = 2.5; // [1:0.1:5]

module penHolder() {
  $fn = 100;

  penHoleDiameter = max(Pen_Hole_Diameter, Magnet_Hole_Diameter);
  cutOutDepth = penHoleDiameter + Material_Thickness;
  penHoleDepth = max(Pen_Hole_Depth, (cutOutDepth * 2) + penHoleDiameter + (Material_Thickness * 2));
  baseWidth = penHoleDiameter + (Material_Thickness * 2);
  baseHeight = penHoleDepth + Material_Thickness;
  cutOutHeight = penHoleDepth - penHoleDiameter - (Material_Thickness * 2);

  module pen() {
    cylinder(d1 = 0, d2 = penHoleDiameter, h = penHoleDiameter + 0.01);
    translate([0, 0, penHoleDiameter]) {
      cylinder(d = penHoleDiameter, h = penHoleDepth - penHoleDiameter + 1);
    }
  }

  module base() {
    translate([0, 0, -Material_Thickness]) {
      cylinder(d = baseWidth, h = baseHeight);
      translate([-baseWidth / 2, 0, 0]) {
        cube(size=[baseWidth, (penHoleDiameter / 2) + Material_Thickness + Magnet_Hole_Depth, baseHeight]);
      }
    }
  }

  module frontCutOut() {
    translate([0, -(penHoleDiameter / 2) - Material_Thickness, cutOutDepth + penHoleDiameter]) {
      hull() {
        // bottom
        rotate([0, 90, 0]) {
          cylinder(r=cutOutDepth, h = baseWidth + 1, center = true);
        }

        translate([0, 0, cutOutHeight - (cutOutDepth * 2)]) {
          // top
          rotate([0, 90, 0]) {
            cylinder(r=cutOutDepth, h = baseWidth + 1, center = true);
          }
        }
      }
    }
  }

  module magnetHole() {
    rotate([270, 0, 0]) {
      cylinder(d = Magnet_Hole_Diameter, h = Magnet_Hole_Depth + 1);
    }
  }

  module magnetHoles() {
    // bottom
    translate([0, (penHoleDiameter / 2) + Material_Thickness, (baseWidth / 2) - Material_Thickness]) {
      magnetHole();
    }

    // top
    translate([0, (penHoleDiameter / 2) + Material_Thickness, baseHeight - (baseWidth / 2) - Material_Thickness]) {
      magnetHole();
    }
  }

  module ridge() {
    rotate_extrude(convexity = 10) {
      translate([(penHoleDiameter / 2) + (Material_Thickness / 2), 0, 0]) {
        circle(d = Material_Thickness);
      }
    }
  }

  module ridges() {
    translate([0, 0, penHoleDiameter]) {
      ridge();
    }

    translate([0, 0, baseHeight - Material_Thickness]) {
      ridge();
    }
  }

  rotate([-90, 0, 0]) {
    difference() {
      base();
      pen();
      frontCutOut();
      magnetHoles();
    }

    ridges();
  }
}

penHolder();