% Use this editor as a MiniZinc scratch book
var 1..3: c_fuel; 
var 1..3: c_paper; 
var 1..3: c_fireworks;
var 1..3: c_pcs;
var 1..3: c_computer_games;
var 1..3: c_old_oil;
var 1..3: c_roof_tiles;
var 1..3: c_aluminum;

var 0..1: c1_fuel; 
var 0..1: c1_paper; 
var 0..1: c1_fireworks;
var 0..1: c1_pcs;
var 0..1: c1_computer_games;
var 0..1: c1_old_oil;
var 0..1: c1_roof_tiles;
var 0..1: c1_aluminum;

var 0..1: c2_fuel; 
var 0..1: c2_paper; 
var 0..1: c2_fireworks;
var 0..1: c2_pcs;
var 0..1: c2_computer_games;
var 0..1: c2_old_oil;
var 0..1: c2_roof_tiles;
var 0..1: c2_aluminum;

var 0..1: c3_fuel; 
var 0..1: c3_paper; 
var 0..1: c3_fireworks;
var 0..1: c3_pcs;
var 0..1: c3_computer_games;
var 0..1: c3_old_oil;
var 0..1: c3_roof_tiles;
var 0..1: c3_aluminum;

% c1
constraint c_fuel != c_fireworks; 
constraint c_old_oil != c_fireworks; 

% c2
constraint c_pcs = c_computer_games; 

% c3
constraint c_aluminum = 3; 

% c4 a
constraint if c_fuel == 1 then c1_fuel = 1 else c1_fuel = 0 endif;
constraint if c_fuel == 2 then c2_fuel = 1 else c2_fuel = 0 endif; 
constraint if c_fuel == 3 then c3_fuel = 1 else c3_fuel = 0 endif; 

constraint if c_paper == 1 then c1_paper = 1 else c1_paper = 0 endif;
constraint if c_paper == 2 then c2_paper = 1 else c2_paper = 0 endif; 
constraint if c_paper == 3 then c3_paper = 1 else c3_paper = 0 endif; 

constraint if c_pcs == 1 then c1_pcs = 1 else c1_pcs = 0 endif;
constraint if c_pcs == 2 then c2_pcs = 1 else c2_pcs = 0 endif; 
constraint if c_pcs == 3 then c3_pcs = 1 else c3_pcs = 0 endif; 

constraint if c_computer_games == 1 then c1_computer_games = 1 else c1_computer_games = 0 endif;
constraint if c_computer_games == 2 then c2_computer_games = 1 else c2_computer_games = 0 endif; 
constraint if c_computer_games == 3 then c3_computer_games = 1 else c3_computer_games = 0 endif; 

constraint if c_old_oil == 1 then c1_old_oil = 1 else c1_old_oil = 0 endif;
constraint if c_old_oil == 2 then c2_old_oil = 1 else c2_old_oil = 0 endif; 
constraint if c_old_oil == 3 then c3_old_oil = 1 else c3_old_oil = 0 endif; 

constraint if c_roof_tiles == 1 then c1_roof_tiles = 1 else c1_roof_tiles = 0 endif;
constraint if c_roof_tiles == 2 then c2_roof_tiles = 1 else c2_roof_tiles = 0 endif; 
constraint if c_roof_tiles == 3 then c3_roof_tiles = 1 else c3_roof_tiles = 0 endif; 

constraint if c_aluminum == 1 then c1_aluminum = 1 else c1_aluminum = 0 endif;
constraint if c_aluminum == 2 then c2_aluminum = 1 else c2_aluminum = 0 endif; 
constraint if c_aluminum == 3 then c3_aluminum = 1 else c3_aluminum = 0 endif; 


% c4 b

constraint c1_fuel+ c1_paper+ c1_fireworks+c1_pcs+c1_computer_games+c1_old_oil+c1_roof_tiles+c1_aluminum <= 3;

constraint c2_fuel+ c2_paper+ c2_fireworks+c2_pcs+c2_computer_games+c2_old_oil+c2_roof_tiles+c2_aluminum <= 3;

constraint c3_fuel+ c3_paper+ c3_fireworks+c3_pcs+c3_computer_games+c3_old_oil+c3_roof_tiles+c3_aluminum <= 3;

% c5
constraint c_fuel != 1; 

% c6
constraint not (c_fuel =3) \/ not(c_roof_tiles = 2);
  
solve satisfy; 

output ["fuel=\(c_fuel)\t paper=\(c_paper)\t fireworks=\(c_fireworks)\n",
        "PC=\(c_pcs)\t Games=\(c_computer_games)\t old Oil=\(c_old_oil)\n",
        "ROOF TILES=\(c_roof_tiles)\t ALUMINUM=\(c_aluminum)\n"];