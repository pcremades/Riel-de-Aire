$fn=100;
tuborect=50;
espesor=20;
ancho=2*tuborect*cos(45)+2*15;
alto=50;

Set_Screw_Diameter=5; //[2:10]
//Set Screw Nut Diameter
Set_Screw_Nut_Diameter=9; //[4:20]
//Set Screw Nut Thickness
Set_Screw_Nut_Thickness=4; //[2:10]
Set_Screw_Largo=28; //[2:10]
//-------------------------------
a=Set_Screw_Diameter; //[2:10]
//Set Screw Nut Diameter
b=Set_Screw_Nut_Diameter; //[4:20]
//Set Screw Nut Thickness
c=Set_Screw_Nut_Thickness; //[2:10]
d=Set_Screw_Largo;

pie();
//apoyo_inf();
//apoyo_sup();
module pie(){
difference(){
cube([ancho,espesor,alto],center=true);
translate([0,0,50*cos(45)])
rotate([0,45,0])
cube(50,center=true);

translate([-tuborect*cos(45)-15/2,0,-alto/2-d/8])
cylinder(d,a/2+0.2,a/2+0.2);
translate([-tuborect*cos(45)-15/2,0,-alto/3-c/2])
rotate([-90,0,90])
#nuttrap();

translate([tuborect*cos(45)+15/2,0,-alto/2-d/8])
cylinder(d,a/2+0.2,a/2+0.2);
translate([tuborect*cos(45)+15/2,0,-alto/3-c/2])
rotate([90,0,90])
#nuttrap();}
}
module apoyo_inf(){
difference(){
cylinder(c,b,b,center=true);
hexagon(c,b/2+0.2);
}}
module apoyo_sup(){
difference (){
cylinder(c,b,b,center=true);
translate([0,0,-c])
hexagon(c,b/2+0.2);
cylinder(c,a/2+0.2,a/2+0.2);
}}

module nuttrap(){
translate([0,(c+1)/2,0])rotate([90,0,0])hexagon(c+1,(b+1)/2);
translate([0,0,(b*3)/2])cube([b+1,c+1,b*3],center = true);
}
module hexagon(height,radius) 
{
  linear_extrude(height=height) hexagonf(radius);
}

module hexagonf(radius)
{
  reg_polygon(6,radius);
}
module reg_polygon(sides,radius)
{
  function dia(r) = sqrt(pow(r*2,2)/2);  //sqrt((r*2^2)/2) if only we had an exponention op
  if(sides<2) square([radius,0]);
  if(sides==3) triangle(radius);
  if(sides==4) square([dia(radius),dia(radius)],center=true);
  if(sides>4) circle(r=radius,$fn=sides);
}