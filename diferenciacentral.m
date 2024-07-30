function  diferenciacentral
 dx = 0.25;%paso
 dt=0.001; %tiempo
 M=(12/dx^2)*[2, -1, 0
            -1, 2,-1
            0, -1, 2];
  K=[0.25^2, 0, 0
     0, 0.5^2, 0
     0, 0, 0.75^2]; %discretizacion del espacio, son las x del medio
  uA=[sin(pi*0.25); sin(pi*0.5); sin(pi*0.75)]; %vector con x usando condicion
  duA=[3; 3; 3];
  uV=uA-dt*duA+(1/2)*dt^2*inv(K)*(-M)*uA; %ecuacion de recurrencia
  it=0;
  for i=0:dt:1
    uN=dt^2*inv(K)*((-M)*uA)-uV+2*uA; %ecuacion de recurrencia segun EDO
    it=it + 1;
    %armo los vectores y matrices
    mu(:,it)=uA; %de esta manera armamos matrices
    vt(it)=i;
    %actualización de variables
    uV = uA;
    uA = uN;
  endfor
  plot(vt, mu(2,:)) %solo grafico la columna 2
endfunction
