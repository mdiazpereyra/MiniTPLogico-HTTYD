%          _______________________________________________________________________
%         |:..                          TP  LOGICO                   ``:::%%%%%%%%|
%         |%%%:::::..             Como Entrenar A Tu Dragon             `:::::%%%%|
%         |%%%%%%%:::::.....________________________________________________::::::|
% 
%                                         ,   ,  
%                                         $,  $,     ,            
%                                         "ss.$ss. .s'     
%                                 ,     .ss$$$$$$$$$$s,              
%                                 $. s$$$$$$$$$$$$$$`$$Ss       
%                                 "$$$$$$$$$$$$$$$$$$o$$$       ,       
%                                s$$$$$$$$$$$$$$$$$$$$$$$$s,  ,s  
%                               s$$$$$$$$$"$$$$$$""""$$$$$$"$$$$$,     
%                               s$$$$$$$$$$s""$$$$ssssss"$$$$$$$$"   
%                              s$$$$$$$$$$'         `"""ss"$"$s""      
%                              s$$$$$$$$$$,              `"""""$  .s$$s
%                              s$$$$$$$$$$$$s,...               `s$$'  `
%                          `ssss$$$$$$$$$$$$$$$$$$$$####s.     .$$"$.   , s-
%                            `""""$$$$$$$$$$$$$$$$$$$$#####$$$$$$"     $.$'
%                                  "$$$$$$$$$$$$$$$$$$$$$####s""     .$$$|
%                                   "$$$$$$$$$$$$$$$$$$$$$$$$##s    .$$" $ 
%                                    $$""$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"   `
%                                   $$"  "$"$$$$$$$$$$$$$$$$$$$$S""""' 
%                              ,   ,"     '  $$$$$$$$$$$$$$$$####s  
%                              $.          .s$$$$$$$$$$$$$$$$$####"
%                  ,           "$s.   ..ssS$$$$$$$$$$$$$$$$$$$####"
%                  $           .$$$S$$$$$$$$$$$$$$$$$$$$$$$$#####"
%                  Ss     ..sS$$$$$$$$$$$$$$$$$$$$$$$$$$$######""
%                   "$$sS$$$$$$$$$$$$$$$$$$$$$$$$$$$########"
%            ,      s$$$$$$$$$$$$$$$$$$$$$$$$#########""'
%            $    s$$$$$$$$$$$$$$$$$$$$$#######""'      s'         ,
%            $$..$$$$$$$$$$$$$$$$$$######"'       ....,$$....    ,$
%             "$$$$$$$$$$$$$$$######"' ,     .sS$$$$$$$$$$$$$$$$s$$
%               $$$$$$$$$$$$#####"     $, .s$$$$$$$$$$$$$$$$$$$$$$$$s.
%    )          $$$$$$$$$$$#####'      `$$$$$$$$$###########$$$$$$$$$$$.
%   ((          $$$$$$$$$$$#####       $$$$$$$$###"       "####$$$$$$$$$$ 
%   ) \         $$$$$$$$$$$$####.     $$$$$$###"             "###$$$$$$$$$   s'
%  (   )        $$$$$$$$$$$$$####.   $$$$$###"                ####$$$$$$$$s$$'
%  )  ( (       $$"$$$$$$$$$$$#####.$$$$$###'                .###$$$$$$$$$$"
%  (  )  )   _,$"   $$$$$$$$$$$$######.$$##'                .###$$$$$$$$$$
%  ) (  ( \.         "$$$$$$$$$$$$$#######,,,.          ..####$$$$$$$$$$$"
% (   )$ )  )        ,$$$$$$$$$$$$$$$$$$####################$$$$$$$$$$$"        
% (   ($$  ( \     _sS"  `"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$S$$,       
%  )  )$$$s ) )  .      .   `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"'  `$$   
%   (   $$$Ss/  .$,    .$,,s$$$$$$##S$$$$$$$$$$$$$$$$$$$$$$$$S""        ' 
%     \)_$$$$$$$$$$$$$$$$$$$$$$$##"  $$        `$$.        `$$.
%         `"S$$$$$$$$$$$$$$$$$#"      $          `$          `$
%             `"""""""""""""'         '           '           '
% 
%
%                      --------------------------------
%                       "MOORTAAAAALL KOOOMBAAAAAAATT"
%                      --------------------------------


%-----BASE DE CONOCIMIENTO-----
entrenador(hipo).
entrenador(gobber).
entrenador(astrid).
entrenador(brutilda).
entrenador(brutacio).
entrenador(dragoManoDura).

dragon(nadderMortifero).
dragon(gronckle).
dragon(chimuelo).
dragon(salvajiBestia).

obedeceA(chimuelo, hipo).
obedeceA(gronckle, brutilda).
obedeceA(gronckle, brutacio).
obedeceA(nadderMortifero, astrid).
obedeceA(chimuelo, salvajiBestia).

lugar(islaDeBerk).
lugar(islaDragon).

viveEn(islaDragon, dragoManoDura).
viveEn(islaDeBerk, hipo).
viveEn(islaDeBerk, gobber).
viveEn(islaDeBerk, astrid).
viveEn(islaDeBerk, brutilda).
viveEn(islaDeBerk, brutacio).

habilidad(chimuelo, explosion(grande, 5)).
habilidad(salvajiBestia, hielo(-10)).
habilidad(gronckle, fuego(300)).
habilidad(nadderMortifero, fuego(500)).

%salvajibestia domina a todos los dragones menos a chimuelo.
%chimuelo domina a todos los dragones.

%----------PUNTO 1----------

puedeEntrenar(hipo, Dragon):-
	dragon(Dragon).
puedeEntrenar(brutilda, gronckle).
puedeEntrenar(brutacio, gronckle).
puedeEntrenar(astrid, Dragon):-
	dragon(Dragon),
	not(puedeEntrenar(brutilda, Dragon)),
	not(puedeEntrenar(brutacio, Dragon)).
puedeEntrenar(dragoManoDura, salvajiBestia).

%----------PUNTO 2----------
	
esMonopolioDeDragones(Lugar):-
	lugar(Lugar),
	forall((dragon(Dragon),obedeceA(Dragon, entrenador(Entrenador))), viveEn(Lugar, Entrenador)).

%----------PUNTO 3----------

%-a-
esDominadoPor(Dragon, chimuelo):-
	dragon(Dragon).
esDominadoPor(Dragon, salvajiBestia):-
	dragon(Dragon),
	Dragon \= chimuelo.
	
esDragonAlfa(DragonAlfa):-
	dragon(DragonAlfa),
	forall(dragon(Dragon), esDominadoPor(Dragon, DragonAlfa)).
	
%-b-
%Ver base de conocimiento.
	
%----------PUNTO 4----------	

esDragonSalvaje(Dragon):-
	not(obedeceA(Dragon, _)).

%----------PUNTO 5----------

esDragonSumiso(Dragon):-
	obedeceA(Dragon, Dominador),
	esDragonAlfa(Dominador).
	
%----------PUNTO 6----------

esDragonPeligroso(Dragon):-
	habilidad(Dragon, fuego(MetrosDeLlamarada)),
	MetrosDeLlamarada > 400.
esDragonPeligroso(Dragon):-
	habilidad(Dragon, explosion(_, NumeroDeExplosiones)),
	NumeroDeExplosiones > 3.
esDragonPeligroso(Dragon):-
	habilidad(Dragon, hielo(Grados)),
	Grados < 0.
