//Dimensiones de la tapa + porta polea
//Dimension del 
tubo=50;//dimensiones del caño
espesor_t=2;//espesor de la pared de la tapa
ancho_t=10;//ancho de la tapa
d_soplador=32;//diámetro del soplador
tapasoplador();
module tapasoplador(){
difference(){
cube(size=[tubo+2*espesor_t,tubo+2*espesor_t,ancho_t+espesor_t]);
    translate([espesor_t,espesor_t,0])
    cube(size=[tubo,tubo,ancho_t]);
    #translate([tubo/2,tubo/2,ancho_t/2]) cylinder(ancho_t*2,d_soplador/2,d_soplador/2,center=true);
    }}



//tapaypolea();
module tapaypolea(){
difference(){
cube(size=[tubo+2*espesor_t,tubo+2*espesor_t,ancho_t+espesor_t]);
    translate([espesor_t,espesor_t,0])
    cube(size=[tubo,tubo,ancho_t]);
    }

d_polea=30;
d_ruleman=3;
    translate([0,0,22])
    translate([30
    ,20,0])
    rotate([-90,-90,45])
difference(){
linear_extrude(height =ancho_t+2*espesor_t,  convexity = 10){
polygon([[-10,0],[-10,30],[10,35],[15,35],[15,30],[12.5,30]]);}
color("red")
translate([10,30,3])
cube(size=[5,5,8]);
translate([12.5,32.5,0])
cylinder(2*ancho_t,d_ruleman/2,$fn=50);
color("red")
translate([12.5,32.5,espesor_t+espesor_t/2])
cylinder(ancho_t-espesor_t,15+espesor_t,15+espesor_t,$fn=50);
}}