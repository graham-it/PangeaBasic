10 fast:vol8:trap1990:goto140
20 ou=(us-ui)/n
30 ov=(vs-vi)/m:v=vs-ov/2:r=0
40 fork=mto1step-1:u=us-ou/2
50 forj=nto1step-1
60 xx=u                                      :
70 yy=v                                      :
80 zz=sin(u)*sin(v)                              :
90 kk=sqr(xx^2+yy^2+zz^2)
100 a(1,j,k)=xx:a(2,j,k)=yy:a(3,j,k)=zz
110 ifkk>rthenr=kk
120 u=u-ou:nextj:v=v-ov:nextk
130 goto1330
140 n=8:m=8:sx=639:sy=199:d1=1:d2=1:d3=1
145 restore2220:forz=2816to2915:reada:pokez,a:next
150 graphic5:graphic8:scnclr
160 restore2050:forz=1to17:reada$:char,3,z,a$:next
170 poke208,0:getkeya$:a=val(a$):ifa>7ora=0then170
180 printchr$(7)
190 ifa=1thengosub910:graphic8:goto170
200 ifa=2thengosub290:goto170
210 ifa=4thengosub660:goto150
220 ifa=5thengosub540:goto150
230 ifa=3thenscnclr:char,37,1,"attendere":goto20
240 ifa=6thengraphic6:gshape,0,0,0,639,200:copy"hardcopy",d4:graphic7:print"{clear screen}":goto160
250 ifa=7thengraphic6:gshape,0,0,0,639,200:char4,584,192,"return",0,0,14,53248:getkeya$:graphic7:goto150
260 :
270 rem            input limiti e scomposizione
280 :
290 graphic9:scnclr:char,0,1,"immetti limite inferiore di u":char,0,3,"ui=":char,0,20,"attuale valore:":printui
300 ui$="":ln=len(ui$):gosub440:ui$=xx$:ifsp=0then310:elseui=val(ui$)
310 scnclr:char,0,1,"immetti limite superiore di u":char,0,3,"us=":char,0,20,"attuale valore:":printus
320 us$="":ln=len(us$):gosub440:us$=xx$:ifsp=0then330:elseus=val(us$)
330 scnclr:char,0,1,"immetti limite inferiore di v":char,0,3,"vi=":char,0,20,"attuale valore:":printvi
340 vi$="":ln=len(vi$):gosub440:vi$=xx$:ifsp=0then350:elsevi=val(vi$)
350 scnclr:char,0,1,"immetti limite superiore di v":char,0,3,"vs=":char,0,20,"attuale valore:":printvs
360 vs$="":ln=len(vs$):gosub440:vs$=xx$:ifsp=0then370:elsevs=val(vs$)
370 scnclr:char,0,1,"immetti n":char,0,3,"n =":char,0,20,"attuale valore:":printn
380 n$="":ln=len(n$):gosub440:n$=xx$:ifsp=0then390:elsen=val(n$)
390 ifn<2thengoto370
400 scnclr:char,0,1,"immetti m":char,0,3,"m =":char,0,20,"attuale valore:":printm
410 m$="":ln=len(m$):gosub440:m$=xx$:ifsp=0then420:elsem=val(m$)
420 ifm<2thengoto400
430 poke51,peek(49):poke52,peek(50):dima(3,n,m):dimb(2,n,m):dimc%(2,n,m):graphic8:return
440 xx$="":sp=0:window3,3,79,24:x=0
450 ln=len(xx$):getkeyx$
460 ifpeek(212)>0then480
470 ifpeek(212)=0andx>0then500:else450
480 ifpeek(212)=1orpeek(212)=76orx=36thenwindow0,0,79,24:return
490 char,x,0,x$:xx$=xx$+x$:x=x+1:sp=1:goto450
500 char,x,0,x$:ln=ln-1andln>0:x=x-1:xx$=left$(xx$,ln):char,x,0," ":goto450
510 :
520 rem               memoria  r a m
530 :
540 scnclr:print"1 carica grafico":print:print"2 salva grafico"
550 getkeya$:a=val(a$):ifa=0ora>2thenreturn
560 input"{crsr down}grafico n. (1/2)";b:ifb<1orb>2then560
570 ifa=1thengraphic6:gosub620:sshape,0,0,0,639,200:graphic7:return
580 ifa=2thenc=b:gshape,0,0,0,639,200:b=c:gosub600:graphic7:return
590 rem    salva in ram
600 poke2865,96:poke2822,b*64:poke2848,(b+1)*64:sys2816:return
610 rem    carica da ram
620 poke2872,b*64:poke2909,(b+1)*64:sys2866:return
630 :
640 rem              memoria  di  massa
650 :
660 graphic9:scnclr:directory"{crsr right}*"
670 print:print"{crsr down}1 load":print:print"2 save":print:print"3 scratch"
680 getkeya$:ifval(a$)>3thenreturn
690 onval(a$)goto700,740,790:return
700 gosub800:graphic8:graphic6:dclear:nm$="{crsr down}"+nm$:bload(nm$),b0
710 nm$="{crsr right}"+nm$:loadnm$,256,0:sshape,0,0,0,639,200:printchr$(7):getkeya$
720 graphic7:ifds>0thengosub2040
730 return
740 input"{crsr down}salvo tutto il grafico (s/n)";a$:ifa$="s"thendn=0:tp=200:goto760
750 input"{crsr down}input estremi del grafico (da 0 a 199)";dn,tp:ifdn>tportp>200then750
760 gosub800:dclear:nm$="{crsr down}"+nm$:gshape,0,0,0,639,200:bsave(nm$),b0,p7168top7418
770 nm$="{crsr right}"+nm$:savenm$,256,dn,tp:printchr$(7):graphic7:ifds>0thengosub2040
780 return
790 gosub800:scratch("{crsr down}"+nm$):scratch("{crsr right}{crsr down}"+nm$):return
800 scnclr:char,6,1,"immetti il nome del grafico":x=0:nm$=""
810 ln=len(nm$):getkeya$
820 ifpeek(212)>0then840
830 ifpeek(212)=0andx>0then870:else810
840 ifpeek(212)=1orpeek(212)=76thenreturn
850 ifx=14thenprintchr$(7):goto810
860 char,x,3,a$:nm$=nm$+a$:x=x+1:goto810
870 x=x-1:nm$=left$(nm$,ln-1):char,x,3," ":goto810
880 :
890 rem                 input  funzione
900 :
910 graphic9:scnclr:char,0,0,"funzione xx":pk=7283:kp=0
920 char,0,19,"attuale funzione:":print:list60:char,0,2,"xx=":a$="":getkeya$
930 ifpeek(212)=1orpeek(212)=76then950:elsegosub1250:gosub1030
940 gosub1140:ifsp=0thennn$="":goto910
950 scnclr:char,0,0,"funzione yy":pk=7331:kp=0
960 char,0,19,"attuale funzione:":print:list70:char,0,2,"yy=":getkeya$
970 ifpeek(212)=1orpeek(212)=76then990:elsegosub1250:gosub1030
980 gosub1140:ifsp=0then950
990 scnclr:char,0,0,"funzione zz":pk=7379:kp=0
1000 char,0,19,"attuale funzione:":print:list80:char,0,2,"zz=":getkeya$
1010 ifpeek(212)=1orpeek(212)=76thenreturn:elsegosub1250:gosub1030
1020 gosub1140:ifsp=0then990:elsereturn
1030 window3,2,79,15:char,0,0,nm$:y=0
1040 ln=len(nm$):poke208,0:getkeya$:ifpeek(212)=1orpeek(212)=76thenwindow0,0,79,24:return
1050 ifpeek(212)<>0then1080:elsex=x-1andx>-1:ifx>-1then1070:elsey=y-1andy>0:x=15
1060 ifln=0thenx=0:y=0
1070 nm$=left$(nm$,abs(ln-1)):char,x,y," ":goto1100
1080 ifx=77theny=y+1:x=0
1090 iflen(nm$)=120thenprintchr$(7):goto1040:elsenm$=nm$+a$:char,x,y,a$:x=x+1
1100 forz=1to30:next:goto1040
1110 :
1120 rem               trasforma funzione in  token
1130 :
1140 scnclr:print"attendere."
1150 a=0:ii=0:restore1260:do:a=a+1:reada$:ln=len(nm$)
1160 it=instr(nm$,a$):ifit=1thenexit
1170 loopuntila=30
1180 ifln=0thenreturn
1190 ifit=0thenprint"{crsr down} funzione non valida":sp=0:poke208,0:getkeya$:return
1200 nm$=right$(nm$,abs(ln-len(a$)))
1210 sp=1:gosub1220:goto1150
1220 ifkp=39thenreturn
1230 restore1270:forz=1toa:readx:next
1240 pokepk,x:pk=pk+1:kp=kp+1:return
1250 nm$=a$:forz=0to38:pokepk+z,32:next:x=1:return
1260 data@,(,),+,-,*,/,^,.,sin,cos,tan,atn,abs,exp,int,log,sqr,u,v,0,1,2,3,4,5,6,7,8,9
1270 data255,40,41,170,171,172,173,174,46,191
1280 data190,192,193,182,189,181,188,186,85,86
1290 data48,49,50,51,52,53,54,55,56,57,58
1300 :
1310 rem               input angoli e ingrandimento
1320 :
1330 printchr$(7):scnclr:char,0,1,"immetti sx":char,0,3,"sx=":char,0,20,"attuale valore:":printsx
1340 sx$="":ln=len(sx$):gosub440:sx$=xx$:ifsp=0then1350:elsesx=val(sx$)
1350 ifsx<10thengoto1330
1360 scnclr:char,0,1,"immetti sy":char,0,3,"sy=":char,0,20,"attuale valore:":printsy
1370 sy$="":ln=len(sy$):gosub440:sy$=xx$:ifsp=0then1380:elsesy=val(sy$)
1380 ifsy<10thengoto1360
1390 scnclr:char,1,1,"immetti coordinata a1":char,0,3,"a1=":char,0,20,"attuale valore:":printd1
1400 d1$="":x=3:ln=len(d1$):gosub440:d1$=xx$:ifsp=0then1410:elsed1=val(d1$)
1410 scnclr:char,1,1,"immetti coordinata a2":char,0,3,"a2=":char,0,20,"attuale valore:":printd2
1420 d2$="":x=3:ln=len(d2$):gosub440:d2$=xx$:ifsp=0then1430:elsed2=val(d2$)
1430 scnclr:char,1,1,"immetti coordinata a3":char,0,3,"a3=":char,0,20,"attuale valore:":printd3
1440 d3$="":x=3:ln=len(d3$):gosub440:d3$=xx$:ifsp=0then1480:elsed3=val(d3$)
1450 :
1460 rem                  elaborazione grafico
1470 :
1480 scnclr:ifd1^2+d2^2<=10e-4ord1^2+d2^2+d3^2>=1000thenprint"angolazione non valida":getkeya$:goto1330
1490 printchr$(7):char,37,1,"attendere":kk=r/sqr(d1^2+d2^2+d3^2)
1500 p(1)=d1*kk:p(2)=d2*kk:p(3)=d3*kk
1510 rr=sqr(p(1)^2+p(2)^2)
1520 k1=-p(2)/rr
1530 k2=p(1)/rr
1540 k3=-p(1)*p(3)/(r*rr)
1550 k4=-p(2)*p(3)/(r*rr)
1560 k5=sqr(1-p(3)^2/(r*r))
1570 j=1:k=1:gosub1920
1580 hx=b(1,1,1):hn=hx:vx=b(2,1,1):vn=vx
1590 fork=mto1step-1:forj=nto1step-1
1600 gosub1920
1610 ifb(1,j,k)<hnthenhn=b(1,j,k):goto1630
1620 ifb(1,j,k)>hxthenhx=b(1,j,k)
1630 ifb(2,j,k)<vnthenvn=b(2,j,k):goto1650
1640 ifb(2,j,k)>vxthenvx=b(2,j,k)
1650 next:next
1660 hr=(hx-hn)/sx:vr=(vx-vn)/sy
1670 forj=1ton:fork=1tom:c%(1,j,k)=int((b(1,j,k)-hn)/hr):c%(2,j,k)=int((b(2,j,k)-vn)/vr):next:next
1680 h(1)=n:h(2)=m
1690 graphic5:graphic9:scnclr:printchr$(7)
1700 print"{crsr down} 1 reticolato":print:print" 2 quadrati"
1710 poke208,0:getkeya$:ifval(a$)<1orval(a$)>2then1710:elsew=val(a$)
1720 graphic8:graphic6:color7,8
1730 :
1740 rem                visualizza il grafico
1750 :
1760 fork=1toh(2):forj=1toh(1)-1stepw
1770 x1=c%(1,j,k):y1=c%(2,j,k)
1780 x2=c%(1,j+1,k)-c%(1,j,k):y2=c%(2,j+1,k)-c%(2,j,k)
1790 x3=x1+x2:y3=y1+y2:y2=y3:x2=x3
1800 draw5,x1,y1tox2,y2
1810 next:next
1820 forj=1toh(1):fork=1toh(2)-1stepw
1830 x1=c%(1,j,k):y1=c%(2,j,k)
1840 x2=c%(1,j,k+1)-c%(1,j,k):y2=c%(2,j,k+1)-c%(2,j,k)
1850 x3=x1+x2:y3=y1+y2
1860 draw5,x1,y1tox3,y3
1870 next:next:printchr$(7):sshape,0,0,0,640,200:char4,584,192,"return",0,0,14,53248
1875 poke208,0:getkeya$:graphic7
1880 char,1,1,"1 cambia angolazione":char,1,3,"2 ripete disegno"
1890 char,1,5,"3 menu principale"
1900 getkeya$:a=val(a$):ifa>2ora=0then150
1910 onagoto1330,1690
1920 kk=-(a(1,j,k)*p(1)+a(2,j,k)*p(2)+a(3,j,k)*p(3))
1930 b(1,j,k)=(a(1,j,k)+p(1)*kk)*k1+(a(2,j,k)+p(2)*kk)*k2
1940 b(2,j,k)=(a(1,j,k)+p(1)*kk)*k3+(a(2,j,k)+p(2)*kk)*k4+(a(3,j,k)+p(3)*kk)*k5
1950 return
1960 :
1970 rem                     gestione  errori
1980 :
1990 graphic5:graphic7:printchr$(7):fast:graphic9:window0,0,79,24,1:print:printerr$(er)
2000 ifer=16thenprint:print"valori di l e m troppo grandi"
2010 ifer=11thenprint:print"funzione con sintassi errata"
2020 ifer=14orer=20thenprint:print" forse a causa di limiti o funzioni non accettabili":print:print"controlla!"
2030 char,35,23,"press return":getkeya$:resume150
2040 scnclr:print"disk error!":getkeya$:dclear:return
2050 data"         UCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCI"
2060 data"  UCCCCCC{cbm+w}    ** {rvs on}     graphic  3d     {rvs off} **   {cbm+q}CCCCCCCCCCI"
2070 data"  B      JCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCK          B"
2080 data"UC{cbm+e}CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCI    B"
2090 data"B                                                 B    B"
2100 data"B   1  input funzione                             B    B"
2110 data"B   2  input parametri                            B    B"
2120 data"B   3  elaborazione grafico                       B    B"
2130 data"B   4  memoria di massa                           B    B"
2140 data"B   5  memoria ram                                B    B"
2150 data"B   6  hard copy                                  B    B"
2160 data"B   7  visione grafico                            B    B"
2170 data"B                                                 B    B"
2180 data"JC{cbm+r}CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCK    B"
2190 data"  B                                                    B"
2200 data"  B             by    francesco berardi                B"
2210 data"  JCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCK"
2220 data 169,0,141,0,255,169,124,133,252,169,0,133,251,162,18,168
2230 data 32,65,22,32,216,205,162,63,142,0,255,145,251,165,252,201
2240 data 188,240,14,162,0,142,0,255,230,251,208,2,230,252,76,19
2250 data 11,96,169,0,141,0,255,169,60,133,252,169,0,133,251,162
2260 data 18,168,32,65,22,169,63,141,0,255,177,251,162,0,142,0
2270 data 255,32,202,205,230,251,208,2,230,252,165,252,201,124,240,3
2280 data 76,69,11,96
