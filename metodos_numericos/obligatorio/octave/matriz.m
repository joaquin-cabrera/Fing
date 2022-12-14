A = zeros(56,97);
b = zeros(56,1);

A(1,1) = 1;
A(1,49) = -1;
b(1,1) = 690;
A(2,1) = 1;
b(2,1) = 960;
A(3,3) = 1;
A(3,63) = -1;
b(3,1) = 350;
A(4,3) = 1;
A(4,4) = -1;
b(4,1) = 700;
A(5,4) = 1;
A(5,77) = 1;
b(5,1) = 1690;
A(6,6) = 1;
A(6,84) = 1;
b(6,1) = 1410;
A(7,6) = 1;
b(7,1) = 750;
A(8,7) = 1;
A(8,49) = -1;
A(8,50) = 1;
b(8,1) = 830;
A(9,7) = 1;
b(9,1) = 550;
A(10,9) = 1;
A(10,63) = -1;
A(10,64) = 1;
b(10,1) = 440;
A(11,9) = 1;
A(11,71) = 1;
b(11,1) = 1410;
A(12,11) = 1;
A(12,77) = -1;
b(12,1) = 110;
A(13,11) = -1;
A(13,12) = 1;
A(13,84) = 1;
b(13,1) = 240;
A(14,12) = 1;
A(14,92) = -1;
b(14,1) = 30;
A(15,51) = 1;
A(15,50) = -1;
b(15,1) = 260;
A(16,58) = 1;
b(16,1) = 1420;
A(17,65) = 1;
A(17,64) = -1;
b(17,1) = 370;
A(18,71) = -1;
A(18,16) = 1;
b(18,1) = 260;
A(19,79) = 1;
A(19,16) = 1;
b(19,1) = 1100;
A(20,86) = 1;
b(20,1) = 450;
A(21,92) = 1;
b(21,1) = 250;
A(22,51) = 1;
A(22,19) = -1;
A(22,52) = -1;
b(22,1) = -640;
A(23,58) = 1;
A(23,19) = -1;
A(23,59) = -1;
A(23, 20)=1;
b(23,1) = 0;
A(24,21) = 1;
A(24,66) = 1;
A(24,20) = -1;
A(24,65) = -1;
b(24,1) = 0;
A(25,21) = 1;
b(25,1) = 490;
A(26,23) = 1;
A(26,80) = 1;
A(26,79) = -1;
b(26,1) = 360;
A(27,86) = 1;
A(27,24) = 1;
A(27,87) = -1;
A(27,23) = -1;
b(27,1) = 0 ;
A(28,24) = 1;
b(28,1) = 750;
A(29,52) = 1;
b(29,1) = 640;
A(30,59)=1;
b(30,1)=830;
A(31, 66)=-1;
A(31,67)=1;
b(31,1)=70;
A(32,28)=1;
b(32,1)=1000;
A(33,28)=1;
A(33,81)=1;
A(33, 80)= -1;
b(33,1)=570;
A(34,30)=1;
A(34,88)=1;
A(34,87)=-1;
b(34,1)=570;
A(35,30)=1;
b(35,1)=710;
A(36,54)=1;
b(36,1)=40;
A(37,32)=-1;
A(37,61)=1;
b(37,1)=20;
A(38,67)=1;
A(38, 32)=1;
b(38,1)=1100;
A(39, 34) = 1;
A(39,75) = -1;
b(39, 1) = 570;
A(40, 81) = 1;
A(40, 34) = 1;
b(40,1) = 710 ;
A(41, 88)= 1;
A(41,36)=1;
b(41, 1)=830;
A(42, 36)=1;
b(42, 1)=480;
A(43,54)=1;
A(43,37)=1;
b(43,1)=1360;
A(44, 37)=1;
A(44,38)=-1;
A(44,61)=1;
A(44,62)=-1;
b(44,1)=0;
A(45,38)=-1;
A(45,39)=1;
b(45,1)=560;
A(46,75)=1 ;
A(46,39)=1;
A(46,40)=-1;
A(46,76)=-1;
b(46,1)=0;
A(47, 40)=-1 ;
A(47,41)=1;
b(47, 1)= 570;
A(48, 42)=-1;
A(48,41)=1;
b(48, 1)=770;
A(49,42)=1 ;
A(49,97)=1;
b(49, 1)=510;
A(50,43)=1;
b(50,1)=230;
A(51,43)=-1;
A(51,62)=1;
b(51,1)=90;
A(52,45)=-1;
b(52,1)=1050;
A(53,76)=1;
A(53,45)=-1;
A(53,46) = 1;
b(53, 1)=130;
A(54, 46)=1 ;
b(54, 1)=110;
A(55, 48)=1 ;
b(55, 1)=350;
A(56, 48)=1 ;
A(56,97)=1;
b(56, 1)=620;


function M = eliminarColumnasNulas(M)
  [n,m] = size(M);
  normas = zeros(1,m);
  for j = 1: m
    normas(1,j) = norm(M(:,j));
  endfor

  pos = 1;
  for j = 1:m
    if (normas(1,j) == 0)
      M(:,pos) = [];
      pos--;
    endif
    pos++;
  endfor

endfunction

[A] = eliminarColumnasNulas(A);


sol = A\b;

function M = escalerizar(M)
  [n,m] = size(M);
  for i = 1 : n - 1
    pivot = M(i,i);
    # escalerizar valores de abajo #
    for j = i + 1 : n
      l = (M(j,i)/pivot);
      # restar el valor a la fila #
      for h = i : m
        if(pivot ~= 0)
           M(j,h) = M(j,h) - l*M(i,h);
        endif
      endfor
    endfor
  endfor
endfunction


E = escalerizar(A);




