union(){
rotate([-90,0,0])
cube([40,30,2],center=true);
pest();
mirror([1,0,0])
pest();
}


module pest(){
linear_extrude(15)
polygon([[4.6,1],[4.6,3.5],[2.2,3.5], [2.2,5.2],[6.2,5.2],[6.2,5],[11,1]]);
}