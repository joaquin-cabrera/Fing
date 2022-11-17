/* 53205740 */
#include "../include/listaInfo.h"
#include "../include/utils.h"
#include "../include/colaInfo.h"
#include <assert.h>
#include <stdlib.h>


struct repCola
{
  TLista lst;
};


TCola crearCola()
{  
  TCola p = new repCola;
  (*p).lst = crearLista();
  return(p);
}


bool esVaciaCola(TCola cola)
{
   return longitud((*cola).lst) == 0 ;
}


TCola encolar(info_t nuevo, TCola cola)
{
 if (longitud((*cola).lst) < MAX)
  {
    (*cola).lst = insertar(longitud((*cola).lst) + 1, nuevo, (*cola).lst);
    return cola;
  }

  else
{
   return cola;
}
}
     
  
info_t frente(TCola cola)
{
  return infoLista(1, (*cola).lst);
}


TCola desencolar(TCola c)
{

  if (longitud((*c).lst) != 0)
  {
     (*c).lst = remover(1, (*c).lst);
     
  }
     return (c);
}










  




