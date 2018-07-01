%   _______________________________________________________________________
%  |:..                          TP  LOGICO                   ``:::%%%%%%%%|
%  |%%%:::::..             Como Entrenar A Tu Dragon             `:::::%%%%|
%  |%%%%%%%:::::.....________________________________________________::::::|


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

obedeceA(chimuelo,hipo).
obedeceA(gronckle,brutilda).
obedeceA(gronckle,brutacio).
obedeceA(nadderMortifero,astrid).
obedeceA(chimuelo,salvajiBestia).

lugar(islaDeBerk).
lugar(islaDragon).

viveEn(islaDragon, dragoManoDura).
viveEn(islaDeBerk,hipo).
viveEn(islaDeBerk,gobber).
viveEn(islaDeBerk,astrid).
viveEn(islaDeBerk,brutilda).
viveEn(islaDeBerk,brutacio).

habilidad(chimuelo, explosion(grande, 5)).
habilidad(salvajiBestia, hielo(-10)).
habilidad(gronckle, fuego(300)).
habilidad(nadderMortifero, fuego(500)).
