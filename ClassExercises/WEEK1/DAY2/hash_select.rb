classmates=
{"Javier"=>25,
"Rashed"=>34,
"Adrián"=>89,
"Juan Antonio"=>34,
"J. Lucas"=>56,
"Mario"=>22,
"José María"=>99,
"Christopher"=>43,
"Joaquín"=>88,
"Elisa"=>43,
"Manuel"=>13,
"Pau"=>26, 
"Rubén"=>25,
"Rachel"=>24,
"Juan"=>11}

classmates2=
{:Javier=>25,
:Rashed=>34,
:Adrián=>89,
:Juan_Antonio=>34,
:J_Lucas=>56,
:Mario=>22,
:José_María=>99,
:Christopher=>43,
:Joaquín=>88,
:Elisa=>43,
:Manuel=>13,
:Pau=>26, 
:Rubén=>25,
:Rachel=>24,
:Juan=>11}

new_array=classmates2.select{|key,value| value>25}

puts "HOLA viejuno/a #{new_array}"