// Torus module

module torus (radius, width) {
    rotate_extrude (convexity = 10, $fn = 100)
        translate (v = [radius, 0, 0])
            circle (r = width, $gn = 100);
}

// Main can
// Total height is 100mm, with 2.5mm lip at top and 2mm cone at bottom

cylinder (h = 96.5, r = 33.25, center = true);

// Lip at top

translate (v = [0, 0, 48.25])
    difference () {
        cylinder (h = 2.5, r = 33.75, center = true);
        cylinder (h = 3.5, r = 32.75, center = true);
    }

// Rings on top

translate (v = [0, 0, 47]) {
    torus (27.5, 2.5);
    torus (22, 2);
}

// Bump at can bottom edge

translate (v = [0, 0, -46])
    torus (31, 3);

// Cone at outside of base

translate (v = [0, 0, -49.25])
    difference () {
        cylinder (h = 2.0, r = 33.25, r1 = 31, center = true);
        cylinder (h = 10, r = 31, center = true);
    }

// Curve inside cone

translate (v = [0, 0, -46])
    intersection () {
        torus(31, 4);
        cylinder (h = 10, r = 31, center = true);
    }

// Ring on base

translate (v = [0, 0, -47])
    torus (22, 3);
