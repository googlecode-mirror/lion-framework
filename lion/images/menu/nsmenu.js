var nTCode=new Array;var AnimStep=0;var AnimHnd=0;var NSDelay=0;var MenusReady=false;var smHnd=0;var mhdHnd=0;var lsc=null;var imgObj=null;var IsContext=false;var IsFrames=false;var dxFilter=null;var AnimSpeed=25;var TimerHideDelay=10;var smDelay=200;var rmDelay=15;var scDelay=0;var cntxMenu='';var DoFormsTweak=true;var mibc=0;var mibm;var mibs=440;var nsOWH;var mFrame;var cFrame=self;var om=new Array;var nOM=0;var mX;var mY;var BV=parseFloat(navigator.appVersion.indexOf("MSIE")>0?navigator.appVersion.split(";")[1].substr(6):navigator.appVersion);var BN=navigator.appName;var nua=navigator.userAgent;var IsWin=(nua.indexOf('Win')!=-1);var IsMac=(nua.indexOf('Mac')!=-1);var KQ=(BN.indexOf('Konqueror')!=-1&&(BV>=5))||(nua.indexOf('Safari')!=-1);var OP=(nua.indexOf('Opera')!=-1&&BV>=4);var NS=(BN.indexOf('Netscape')!=-1&&(BV>=4&&BV<5)&&!OP);var SM=(BN.indexOf('Netscape')!=-1&&(BV>=5)||OP);var IE=(BN.indexOf('Explorer')!=-1&&(BV>=4)||SM||KQ);var IX=(IE&&IsWin&&!SM&&!OP&&(BV>=5.5)&&(dxFilter!=null)&&(nua.indexOf('CE')==-1));if(!eval(frames['self'])){frames.self=window;frames.top=top;}var tbO=new Array;var tbS=new Array;var tbBorder=new Array;var tbSpacing=new Array;var tbStyle=new Array;var tbAlignment=new Array;var tbMargins=new Array;var tbAttachTo=new Array;var tbSpanning=new Array;var tbFollowHScroll=new Array;var tbFollowVScroll=new Array;var tbFPos=new Array;var lmcHS=null;var tbWidth=new Array;var tbHeight=new Array;var tbVisC=new Array;var sbHnd;var smfHnd;var tpl;var tbt;tbBorder[1]=0;tbSpacing[1]=0;tbStyle[1]=0;tbAlignment[1]=9;tbSpanning[1]=0;tbFollowHScroll[1]=false;tbFollowVScroll[1]=false;tbMargins[1]=[0,0];tbFollowVScroll[1]=false;tbFPos[1]=[0,57];tbVisC[1]=new Function('return true;');tbAttachTo[1]='menu_left|9';tbWidth[1]=0;tbHeight[1]=20;tbBorder[2]=0;tbSpacing[2]=0;tbStyle[2]=0;tbAlignment[2]=9;tbSpanning[2]=0;tbFollowHScroll[2]=false;tbFollowVScroll[2]=false;tbMargins[2]=[0,0];tbFollowVScroll[2]=false;tbFPos[2]=[0,57];tbVisC[2]=new Function('return false;');tbAttachTo[2]='menu_left|9';tbWidth[2]=125;tbHeight[2]=19;var tbNum=2;var fx=0;nTCode[1]="cFrame.execURL('%%REP%%%%URL%%','_self');";function SetupToolbar(fr){if(!MenusReady){window.setTimeout("SetupToolbar()",10);return false;}var mimg=false;var SMb;var lt=GetLeftTop(cFrame);var wh=GetWidthHeight(cFrame);var er=(wh[0]==0);ClearTimer("sbHnd");for(var t=1;t<=tbNum;t++){SMb=(SM?tbBorder[t]:0);if(fr!=true){if(!tbO[t]){olt=lt;tbO[t]=GetObj("dmbTBBack"+t,cFrame);if(!tbO[t]) mimg=true;else{if(NS){tbO[t].st=GetObj("dmbTB"+t,tbO[t]);tbS[t]=tbO[t];tbS[t].width=tbS[t].clip.width;tbS[t].height=tbS[t].clip.height;}else{tbO[t].st=GetObj("dmbTB"+t,cFrame).style;tbS[t]=tbO[t].style;if(SM&&!OP){tbS[t].width=unic(tbS[t].width,wh[0])-2*SMb+"px";tbS[t].height=unic(tbS[t].height,wh[1])-2*SMb+"px";}FixCommands("dmbTB"+t,cFrame,t);}}}}if(tbO[t]&&!er){tbl=0;tbt=0;switch(tbAlignment[t]){case 0:break;case 1:tbl=tbStyle[t]==0?(wh[0]-tbWidth[t])/2:(wh[0]-pri(tbS[t].width))/2-SMb;break;case 2:tbl=tbStyle[t]==0?wh[0]-tbWidth[t]:(wh[0]-pri(tbS[t].width))-SMb;break;case 3:tbt=tbStyle[t]==0?(wh[1]-tbHeight[t])/2:(wh[1]-pri(tbS[t].height))/2-SMb;break;case 4:tbl=tbStyle[t]==0?(wh[0]-tbWidth[t])/2:(wh[0]-pri(tbS[t].width))/2-SMb;tbt=tbStyle[t]==0?(wh[1]-tbHeight[t])/2:(wh[1]-pri(tbS[t].height))/2-SMb;break;case 5:tbl=tbStyle[t]==0?wh[0]-tbWidth[t]:(wh[0]-pri(tbS[t].width))-2*SMb;tbt=tbStyle[t]==0?(wh[1]-tbHeight[t])/2:(wh[1]-pri(tbS[t].height))/2-SMb;break;case 6:tbt=(tbStyle[t]==0?wh[1]-pri(tbS[t].height):wh[1]-pri(tbS[t].height))-2*SMb;break;case 7:tbl=tbStyle[t]==0?(wh[0]-tbWidth[t])/2:(wh[0]-pri(tbS[t].width))/2-SMb;tbt=(tbStyle[t]==0?wh[1]-pri(tbS[t].height):wh[1]-pri(tbS[t].height))-2*SMb;break;case 8:tbl=tbStyle[t]==0?wh[0]-tbWidth[t]:(wh[0]-pri(tbS[t].width))-2*SMb;tbt=(tbStyle[t]==0?wh[1]-pri(tbS[t].height):wh[1]-pri(tbS[t].height))-2*SMb;break;case 9:tbl=tbFPos[t][0];tbt=tbFPos[t][1];break;case 10:var imgObj=NS?FindImage(cFrame.document,tbAttachTo[t].split("|")[0]):cFrame.document.images[tbAttachTo[t].split("|")[0]];if(!imgObj){imgObj=GetObj(tbAttachTo[t].split("|")[0],cFrame);if(imgObj&&!NS) if(imgObj.style.left) imgObj=imgObj.style;}if(imgObj){tbl=AutoPos(tbO[t],imgObj,pri(tbAttachTo[t].split("|")[1]))[0]+MacOffset(cFrame)[0];tbt =AutoPos(tbO[t],imgObj,pri(tbAttachTo[t].split("|")[1]))[1]+MacOffset(cFrame)[1];}else mimg=true;break;}tbS[t].left=tbl+(tbFollowHScroll[t]?olt[0]:0)+tbMargins[t][0]+(NS?"":"px");tbS[t].top =tbt +(tbFollowVScroll[t]?olt[1]:0)+tbMargins[t][1]+(NS?"":"px");if(tbSpanning[t]==1){if(tbStyle[t]==0){tbO[t].st.left=tbS[t].left;tbS[t].left="0px";tbS[t].width=wh[0]+(tbFollowHScroll[t]?0:lt[0])-2*SMb+(NS?"":"px");}if(tbStyle[t]==1){tbO[t].st.top=tbS[t].top;tbS[t].top="0px";tbS[t].height=wh[1]+(tbFollowVScroll[t]?0:lt[1])-2*SMb+(NS?"":"px");}}tbS[t].visibility=(tbVisC[t]()?"visible":"hidden");if(tbFollowHScroll[t]||tbFollowVScroll[t]) if(ScrollTB(lt,wh,tbO[t])) mimg=false;}}if(NS||SM||mimg||er) sbHnd=window.setTimeout("SetupToolbar()",100);return true;}function getTBPos(t){var xy=[pri(tbO[t].st.left)+(NS?tbO[t].x:tbO[t].offsetLeft)+tbBorder[t],pri(tbO[t].st.top)+(NS?tbO[t].y:tbO[t].offsetTop)+tbBorder[t]];if(IE){var p=tbO[t];while(true){p=p.parentElement;if(!p) break;if(!p.style) break;if(p.style.position){xy[0]+=p.offsetLeft;xy[1]+=p.offsetTop;}}}return xy;}function unic(u,wh){var k=pri(u);return (NS?k:u.indexOf("%")==-1?k:wh*k/100);}function ScrollTB(lt,wh,tb){var s=[true,true];var v=pri(tb.top)+pri(tb.height);var h=pri(tb.left)+pri(tb.width);if(olt[0]!=lt[0]||olt[1]!=lt[1]){var d=[olt[0]-lt[0],olt[1]-lt[1]];if(d[0]<=0) if(h>=(lt[0]+wh[0])) s[0]=false;if(d[1]<=0) if(v>=(lt[1]+wh[1])) s[1]=false;var k=[pri(Math.abs(d[0]/20)+1)*(d[0]>0?-1:1),pri(Math.abs(d[1]/20)+1)*(d[1]>0?-1:1)];for(var i=0;i<2;i++) if(s[i]){olt[i]+=k[i];if(Math.abs(olt[i]-lt[i])<2) olt[i]=lt[i];}ClearTimer("sbHnd");sbHnd=window.setTimeout("SetupToolbar(true)",10);return true;}return false;}function GetHSPos(n,al,mW,mH,t){var tbs0=tbStyle[t]==0;var tp=getTBPos(t);var wh;if(NS){lmcHS.style=lmcHS;wh=[lmcHS.clip.width,lmcHS.clip.height];}else wh=[lmcHS.offsetWidth,lmcHS.offsetHeight];var acc=pri(tbs0?lmcHS.style.left:lmcHS.style.top);var x=(!tbs0&&IsFrames?-wh[0]:tp[0]);var y=(tbs0&&IsFrames?-wh[1]:tp[1]);if(tbs0) x+=acc;else y+=acc;switch(al){case 0:y+=wh[1];break;case 1:x-=(mW-wh[0]);y+=wh[1];break;case 2:y-=mH;break;case 3:x-=(mW-wh[0]);y-=mH;break;case 4:x-=mW;break;case 5:x-=mW;y+=(wh[1]-mH);break;case 6:x+=wh[0];break;case 7:x+=wh[0];y+=(wh[1]-mH);break;case 8:x-=mW;y+=(wh[1]-mH)/2;break;case 9:x+=wh[0];y+=(wh[1]-mH)/2;break;case 10:x+=(wh[0]-mW)/2;y-=mH;break;case 11:x+=(wh[0]-mW)/2;y+=wh[1];break;}if(IsFrames){x+=GetLeftTop()[0];y+=GetLeftTop()[1];}return [x,y];}function hsNSHoverSel(mode,mc,bcolor){var mcN;if(mode==0){if(lmcHS) hsNSHoverSel(1);mcN=mc.parentLayer.layers[mc.name.substr(0,mc.name.indexOf("EH"))+"N"];mcN.mcO=mc.parentLayer.layers[mc.name.substr(0,mc.name.indexOf("EH"))+"O"];if(mcN!=lmcHS) HideAll();if(nOM>1) if(mcN==om[nOM-1].sc) return false;mcN.mcO.visibility="show";mcN.visibility="hide";lmcHS=mcN;}else{mcN=lmcHS;mcN.visibility="show";mcN.mcO.visibility="hide";lmcHS=null;}return true;}function InitTB(){var dsn=true;var e="";var i,n;for(var t=1;t<=tbNum;t++) if(tbAlignment[t]==10){dsn=false;if(window.onload){e=window.onload.toString();n=e.indexOf("{");e=e.substr(n+1,e.lastIndexOf("}")-n-1);}e+=";SetupToolbar();";window.onload=new Function(e);break;}if(!NS){window.onresize=SetupToolbar;window.onscroll=SetupToolbar;}if(dsn) SetupToolbar();}InitTB();function HideSubMenus(id){var mc=GetObj(id);if(nOM>1){if(mc==om[nOM-1].sc) return false;while(true){if(!nOM) return false;if(gpid(mc)==om[nOM].id) break;Hide();}if(nOM&&scDelay) mc.onmouseover();}}function NSHoverSel(mode,mc){var mcN;var mn;ClearTimer("smHnd");if(!nOM) return false;if(mode==0&&om[nOM].sc!=null) NSHoverSel(1);if(mode==0){mn=mc.name.substr(0,mc.name.indexOf("EH"));mcN=mc.parentLayer.layers[mn+"N"];mcN.mcO=mc.parentLayer.layers[mn+"O"];if(nOM>1) if(mc==om[nOM-1].sc) return false;while(!InMenu()&&nOM>1) Hide();om[nOM].sc=mcN;mcN.mcO.visibility="show";mcN.visibility="hide";}else{mcN=(mode==1)?om[nOM].sc:om[nOM].op;mcN.visibility="show";mcN.mcO.visibility="hide";om[nOM].sc=null;}return true;}function Hide(chk){var m;var cl=false;ClearTimer("mhdHnd");ClearTimer("AnimHnd");if(chk)if(InMenu()) return false;if(nOM){m=om[nOM];if(m.sc!=null){if(IE) HoverSel(1);if(NS) NSHoverSel(1);}if(m.op!=null){if(IE) HoverSel(3);if(NS) NSHoverSel(3);}ToggleMenu(m,"hidden");ClearTimer("om[nOM].hsm");nOM--;cl=(nOM==0);if(cl) imgObj=null;}if(cl||chk){ClearTimer("smHnd");if(tbNum&&lmcHS) if(!lmcHS.disable){if(IE) hsHoverSel(1);if(NS) hsNSHoverSel(1);}window.setTimeout("if(!lmcHS)window.status=''",TimerHideDelay);}if((nOM>0||lmcHS)&&!InSelMenu()) mhdHnd=window.setTimeout("Hide(1)",TimerHideDelay/20);return true;}function ToggleMenu(m,s){if(IX) if(document.readyState=="complete"&&m.getAttribute("filters")!=null){if(!m.fs){m.fsn=m.filters.length;m.style.filter=dxFilter+m.style.filter;m.fs=true;}for(var i=0;i<m.filters.length-m.fsn;i++){m.filters[i].apply();m.style.visibility=s;m.filters[i].play();}}m.style.visibility=s;if(s=="hidden"&&!IX&&!NS) m.style.left=m.style.top="0px";FormsTweak(s=="visible"?"hidden":"visible");}function ShowMenu(mName,x,y,isc,hsimg,algn){mFrame._bg(mFrame._getobj(mName));if(!algn) algn=0;var f=["ShowMenu2('"+mName+"',"+x+","+y+","+isc+",'"+hsimg+"',"+algn+")"];ClearTimer("smHnd");if(isc){if(nOM==0) return false;lsc=om[nOM].sc;f[1]="if(nOM)if(lsc==om[nOM].sc)";f[2]=smDelay;}else{if(nOM>0) if(om[1].id==mName) return false;ClearTimer("mhdHnd");if(algn<0&&!lmcHS) return false;f[1]="HideAll(1);";f[2]=mDelay();}smHnd=window.setTimeout(f[1]+f[0],f[2]);return true;}function ShowMenu2(mName,x,y,isc,hsimg,algn){var xy;x=pri(x);y=pri(y);var Menu=GetObj(mName);if(!Menu) return false;if(Menu==om[nOM]) return false;if(NS) Menu.style=Menu;if(AnimHnd&&nOM>0){AnimStep=100;Animate();}Menu.op=nOM>0?om[nOM].sc:null;Menu.sc=null;imgObj=null;if(isc){if(!NS) HideSubMenus(om[nOM].sc.id);xy=GetSubMenuPos(Menu,algn);var gs=om[nOM].gs;if(gs) xy[1]+=pri(gs.top);}else{Menu.pHS=lmcHS;xy=(algn<0?GetHSPos(x,y,NS?Menu.w:Menu.offsetWidth,NS?Menu.h:Menu.offsetHeight,-algn):[x,y]);if(hsimg){var hss=hsimg.split("|");imgObj=NS?FindImage(cFrame.document,hss[0]):cFrame.document.images[hss[0]];if(imgObj){if(hss[1]&2) xy[0]=AutoPos(Menu,imgObj,algn)[0]+(IsFrames?GetLeftTop()[0]:0)+MacOffset()[0];if(hss[1]&1) xy[1]=AutoPos(Menu,imgObj,algn)[1]+(IsFrames?GetLeftTop()[1]:0)+MacOffset()[1];}}}if(xy){x=xy[0];y=xy[1];}var pWH=[GetWidthHeight()[0]+GetLeftTop()[0],GetWidthHeight()[1]+GetLeftTop()[1]];if(IE) with(Menu.style){if(SM) display="none";left=FixPos(x,pri(width),pWH[0],0)+"px";top=FixPos(y,pri(height),pWH[1],1)+"px";if(!IX&&!SM&&IsWin) clip="rect(0 0 0 0)";}if(NS){Menu.clip.width=0;Menu.clip.height=0;Menu.moveToAbsolute(FixPos(x,Menu.w,pWH[0]),FixPos(y,Menu.h,pWH[1]));}Menu.style.zIndex=1000+tbNum+nOM;om[++nOM]=Menu;if(!NS) FixCommands(mName);if(SM) Menu.style.display="inline";if(!IX){if((IE&&IsWin&&!SM)||(NS&&Menu.style.clip.width==0)) AnimHnd=window.setTimeout("Animate()",10);}ToggleMenu(Menu,"visible");IsContext=false;smHnd=0;return true;}function mDelay(){return rmDelay/(nOM==0&&scDelay>0?4:1);}function MacOffset(f){var mo=[0,0];if(!f) f=mFrame;if(IsMac&&IE&&!SM&&!KQ&&(BV>=5)) mo=[pri(f.document.body.leftMargin),pri(f.document.body.topMargin)];return mo;}function GetSubMenuPos(mg,a){var x;var y;var pg=om[nOM];var sc=(NS?pg.sc:GetObj("O"+pg.sc.id.substr(1)));if(NS){pg.offsetLeft=pg.left;pg.offsetTop=pg.top;pg.offsetWidth=pg.w;pg.offsetHeight=pg.h;mg.offsetWidth=mg.w;mg.offsetHeight=mg.h;sc.offsetLeft=sc.left;sc.offsetTop=sc.top;sc.offsetWidth=sc.clip.width;sc.offsetHeight=sc.clip.height;}var lp=pg.offsetLeft+sc.offsetLeft;var tp=pg.offsetTop+sc.offsetTop;switch(a){case 0:x=lp;y=tp+sc.offsetHeight;break;case 1:x=lp+sc.offsetWidth-mg.offsetWidth;y=tp+sc.offsetHeight;break;case 2:x=lp;y=tp-mg.offsetHeight;break;case 3:x=lp+sc.offsetWidth-mg.offsetWidth;y=tp-mg.offsetHeight;break;case 4:x=lp-mg.offsetWidth;y=tp;break;case 5:x=lp-mg.offsetWidth;y=tp+sc.offsetHeight-mg.offsetHeight;break;case 6:x=lp+sc.offsetWidth;y=tp;break;case 7:x=lp+sc.offsetWidth;y=tp+sc.offsetHeight-mg.offsetHeight;break;case 8:x=lp-mg.offsetWidth;y=tp+(sc.offsetHeight-mg.offsetHeight)/2;break;case 9:x=lp+sc.offsetWidth;y=tp+(sc.offsetHeight-mg.offsetHeight)/2;break;case 10:x=lp+(sc.offsetWidth-mg.offsetWidth)/2;y=tp-mg.offsetHeight;break;case 11:x=lp+(sc.offsetWidth-mg.offsetWidth)/2;y=tp+sc.offsetHeight;break;}return [x,y];}function Animate(){var r='';var nw=nh=0;if(AnimStep+AnimSpeed>100) AnimStep=100;switch(fx){case 1:if(IE) r="0 "+AnimStep+"% "+AnimStep+"% 0";if(NS) nw=AnimStep;nh=AnimStep;break;case 2:if(IE) r="0 100% "+AnimStep+"% 0";if(NS) nw=100;nh=AnimStep;break;case 3:if(IE) r="0 "+AnimStep+"% 100% 0";if(NS) nw=AnimStep;nh=100;break;case 0:if(IE) r="0 100% 100% 0";if(NS) nw=100;nh=100;break;}if(om[nOM]){with(om[nOM].style){if(IE) clip="rect("+r+")";if(NS){clip.width=w*(nw/100);clip.height=h*(nh/100);}}AnimStep+=AnimSpeed;if(AnimStep<=100) AnimHnd=window.setTimeout("Animate()",25);else{ClearTimer("AnimHnd");AnimStep=0;AnimHnd=0;}}}function InTBHotSpot(){var m=(imgObj?imgObj:lmcHS);var tp=[0,0];var tbb;if(!m) return false;if(imgObj) if(imgObj.name.indexOf("dmbHSdyna")!=-1){imgObj=null;return false;}var x=mX;var y=mY;if(!imgObj){if(IE){if(BV<5&&!IsMac) m.parentNode=m.parentElement;}else m.parentNode=m.parentLayer;tp=getTBPos(m.parentNode.id.substr(5));if(IE) m=m.style;}else{m.left=GetImgXY(imgObj)[0];m.top=GetImgXY(imgObj)[1];if(NS) m.clip=m;}var l=pri(m.left)+tp[0];var r=l+(IE?pri(m.width):m.clip.width);var t=pri(m.top)+tp[1];var b=t+(IE?pri(m.height):m.clip.height);if(IsFrames&&!NS){x-=GetLeftTop()[0];y-=GetLeftTop()[1];}return ((x>=l&&x<=r)&&(y>=t&&y<=b));}function InMenu(){var m=om[nOM];if(!m) return false;else if(IE) m=m.style;var l=pri(m.left);var r=l+(IE?pri(m.width):m.clip.width);var t=pri(m.top);var b=t+(IE?pri(m.height):m.clip.height);return ((mX>=l&&mX<=r)&&(mY>=t&&mY<=b));}function SetPointerPos(e){if(IE){if(!SM){if(mFrame!=cFrame||event==null){var cfe=cFrame.window.event;var mfe=mFrame.window.event;if(IE&&IsMac) cfe=(cfe.type=="mousemove"?cfe:null);if(IE&&IsMac) mfe=(mfe.type=="mousemove"?mfe:null);if(mfe==null&&cfe==null) return;e=(cfe?cfe:mfe);}else e=event;}mX=e.clientX+lt[0];mY=e.clientY+lt[1];if(!KQ){ClearTimer("cFrame.iefwh");cFrame.iefwh=window.setTimeout("lt=GetLeftTop()",100);}}if(NS){mX=e.pageX;mY=e.pageY;}}function InSelMenu(){var nOMb=nOM--;for(;nOM>0;nOM--) if(om[nOM].sc!=null) break;var im=InMenu();nOM=nOMb;return im||InMenu();}function IsOverMenus(){return (lmcHS||imgObj?InTBHotSpot():(nOM==1?!(om[nOM].sc!=null):false))||(nOM>0?InSelMenu():false);}function HideMenus(e){SetPointerPos(e);if(!IsOverMenus()&&mhdHnd==0) mhdHnd=window.setTimeout("mhdHnd=0;if(!IsOverMenus())Hide()",TimerHideDelay);}function FormsTweak(state){var fe;if(IE&&(!SM||OP)&&DoFormsTweak){var m=om[nOM];if((BV>=5.5)&&!OP&&m&&!KQ) cIF(state=="visible"?"hidden":"visible");else if(nOM==1) for(var f=0;f<mFrame.document.forms.length;f++) for(var e=0;e<mFrame.document.forms[f].elements.length;e++){fe=mFrame.document.forms[f].elements[e];if(fe.type) if(fe.type.indexOf("select")==0) fe.style.visibility=state;}}}function execURL(url,tframe){var d=100;if(mibc&&!NS){d+=mibs * mibc;if(lmcHS) mibm=lmcHS;if(nOM) for(var n=nOM;n>0;n--) if(om[n].sc){mibm=om[n].sc;break;}if(mibm){mibm.n=mibc;BlinkItem();}}else HideAll();execURL2(escape(_purl(url)),tframe);}function BlinkItem(){var f=(mibm.id.substr(1)>1000?cFrame:mFrame);mibm.bs=!Math.abs(mibm.bs);SwapMC(mibm.bs,mibm,f);mibc--;if(mibc>=0) window.setTimeout("BlinkItem()",mibs);else{mibc=mibm.n;mibm=null;HideAll();}}function execURL2(url,tframe){var w=eval("windo"+"w.ope"+"n");url=rStr(unescape(url));if(url.indexOf("javascript:")!=url.indexOf("vbscript:")) eval(url);else{switch(tframe){case "_self":if(IE&&!SM&&!KQ&&(BV>4)){var a=mFrame.document.createElement("A");a.href=url;mFrame.document.body.appendChild(a);a.click();}else mFrame.location.href=url;break;case "_blank":w(url,tframe);break;default:var f=rStr(tframe);var fObj=(tframe=='_parent'?mFrame.parent:eval(f));if(typeof(fObj)=="undefined") w(url,f.substr(8,f.length-10));else fObj.location.href=url;break;}}}function rStr(s){s=xrep(s,"%1E","'");s=xrep(s,"\x1E","'");if(OP&&s.indexOf("frames[")!=-1) s=xrep(s,String.fromCharCode(s.charCodeAt(7)),"'");return xrep(s,"\x1D","\x22");}function hNSCClick(e){eval(this.TCode);}function HideAll(dr){var o=lmcHS;if(dr) lmcHS=null;Hide();while(nOM>0) Hide();lmcHS=o;}function tHideAll(){ClearTimer("mhdHnd");mhdHnd=window.setTimeout("mhdHnd=0;if(!InSelMenu())HideAll();",TimerHideDelay);}function GetLeftTop(f){if(!f) f=mFrame;if(IE) if(SM) return [OP?f.pageXOffset:f.scrollX,OP?f.pageYOffset:f.scrollY];else{var b=GetBodyObj(f);return (b?[b.scrollLeft,b.scrollTop]:[0,0]);}if(NS) return [f.pageXOffset,f.pageYOffset];}function GetWidthHeight(f){var k=0;if(!f) f=mFrame;if(NS||SM){return [f.innerWidth,f.innerHeight];}else{var b=GetBodyObj(f);return (b?[b.clientWidth,b.clientHeight]:[0,0]);}}function GetBorderSize(s){return [(s.borderLeftStyle==""||s.borderLeftStyle=="none"?0:pri(s.borderLeftWidth))+(s.borderRightStyle==""||s.borderRightStyle=="none"?0:pri(s.borderRightWidth)),(s.borderTopStyle==""||s.borderTopStyle=="none"?0:pri(s.borderTopWidth))+(s.borderBottomStyle==""||s.borderBottomStyle=="none"?0:pri(s.borderBottomWidth))];}function AutoPos(m,img,arl){var x=GetImgXY(img)[0];var y=GetImgXY(img)[1];var iWH=GetImgWH(img);var mW=(NS?m.w:m.offsetWidth);var mH=(NS?m.h:m.offsetHeight);switch(arl){case 0:y+=iWH[1];break;case 1:x+=iWH[0]-mW;y+=iWH[1];break;case 2:y-=mH;break;case 3:x+=iWH[0]-mW;y-=mH;break;case 4:x-=mW;break;case 5:x-=mW;y-=mH-iWH[1];break;case 6:x+=iWH[0];break;case 7:x+=iWH[0];y-=mH-iWH[1];break;case 8:x-=mW;y+=(iWH[1]-mH)/2;break;case 9:x+=iWH[0];y+=(iWH[1]-mH)/2;break;case 10:x+=(iWH[0]-mW)/2;y-=mH;break;case 11:x+=(iWH[0]-mW)/2;y+=iWH[1];break;}return [x,y];}function GetImgXY(img){var x;var y;if(NS){y=GetImgOffset(cFrame,img.name,0,0);x=img.x+y[0];y=img.y+y[1];}else{y=getOffset(img);x=y[0];y=y[1];}return [x,y];}function GetImgWH(img){return [pri(img.width),pri(img.height)];}function getOffset(img){var xy=[img.offsetLeft,img.offsetTop];var ce=img.offsetParent;while(ce!=null){xy[0]+=ce.offsetLeft;xy[1]+=ce.offsetTop;ce=ce.offsetParent;}return xy;}function FindImage(d,img){var tmp;if(d.images[img]) return d.images[img];for(var i=0;i<d.layers.length;i++){tmp=FindImage(d.layers[i].document,img);if(tmp) return tmp;}return null;}function GetImgOffset(d,img,ox,oy){var i;var tmp;if(d.left){ox+=d.left;oy+=d.top;}if(d.document.images[img]) return [ox,oy];for(i=0;i<d.document.layers.length;i++){tmp=GetImgOffset(d.document.layers[i],img,ox,oy);if(tmp) return [tmp[0],tmp[1]];}return null;}function ShowContextMenu(e){if(IE){SetPointerPos(e);IsContext=true;}else if(e.which==3){IsContext=true;mX=e.x;mY=e.y;}if(IsContext){HideAll();cFrame.ShowMenu2(cntxMenu,mX-1,mY-1,false);return false;}return true;}function SetUpEvents(){nOM=0;if(!SM) onerror=errHandler;if(!mFrame) mFrame=cFrame;if(typeof(mFrame)=="undefined"||(NS&&(++NSDelay<2))) window.setTimeout("SetUpEvents()",10);else{IsFrames=(cFrame!=mFrame);if(NS){mFrame.captureEvents(Event.MOUSEMOVE);mFrame.onmousemove=HideMenus;if(cntxMenu!=""){mFrame.window.captureEvents(Event.MOUSEDOWN);mFrame.window.onmousedown=ShowContextMenu;}nsOWH=GetWidthHeight();window.onresize=rHnd;PrepareEvents();}if(IE){document.onmousemove=HideMenus;mFrame.document.onmousemove=document.onmousemove;if(cntxMenu) mFrame.document.oncontextmenu=ShowContextMenu;if(IsFrames) mFrame.window.onunload=new Function("mFrame=null;SetUpEvents()");cFrame.lt=[0,0];}MenusReady=true;}return true;}function errHandler(sMsg,sUrl,sLine){if(sMsg.substr(0,16)!="Access is denied"&&sMsg!="Permission denied"&&sMsg.indexOf("cursor")==-1) alert("Java Script Error\n"+      "\nDescription:"+sMsg+      "\nSource:"+sUrl+      "\nLine:"+sLine);return true;}function FixPos(v,s,r,k){var n;if(nOM==0||k==1) n=(v+s>r)?r-s:v;else n=(v+s>r)?pri(om[nOM].style.left)-s:v;return (n<0)?0:n;}function FixPointSize(s){if(IsWin||!NS) return s;for(var i=54;i>1;i--) if(s.indexOf("point-size="+i)!=-1) s=xrep(s,"point-size="+i,"point-size="+(i+3));return s;}function ClearTimer(t,f){if(!f) cFrame.f=cFrame;if(eval(t)) eval("cFrame.f.clearTimeout("+t+");"+t+"=0");}function xrep(s,f,n){if(s) s=s.split(f).join(n);return s;}function rHnd(){var nsCWH=GetWidthHeight();if((nsCWH[0]!=nsOWH[0])||(nsCWH[1]!=nsOWH[1])) frames["top"].location.reload();}function GetObj(oName,f){var obj=null;if(!f) f=mFrame;if(NS) obj=f.document.layers[oName];else{obj=(BV>=5?f.document.getElementById(oName):f.document.all[oName]);if(obj) if(obj.id!=oName) obj=null;}return obj;}function gpid(o){return (BV>=5?o.parentNode.parentNode.id:o.parentElement.parentElement.id);}function PrepareEvents(){for(var l=0;l<mFrame.document.layers.length;l++){var lo=mFrame.document.layers[l];if(lo.layers.length){lo.w=lo.clip.width;lo.h=lo.clip.height;for(var sx=0;sx<lo.layers.length;sx++) for(var sl=0;sl<lo.layers[sx].layers.length;sl++){var slo=mFrame.document.layers[l].layers[sx].layers[sl];if(slo.name.indexOf("EH")>0){slo.document.onmouseup=hNSCClick;slo.document.TCode=nTCode[slo.name.split("EH")[1]];}}for(var t=1;t<=tbNum;t++){tb=cFrame.document.layers['dmbTBBack'+t];for(var sl=0;sl<tb.layers['dmbTB'+t].layers.length;sl++){slo=tb.layers['dmbTB'+t].layers[sl];if(slo.name.indexOf('EH')>0){slo.document.onmouseup=hNSCClick;slo.document.TCode=nTCode[slo.name.split('EH')[1]];}}}}}}if(NS) with(document){open();write(xrep(FixPointSize(Expand("Back1020998name=dmbTB100020999>")),'%'+'%REL%%',rimPath));close();}if(NS) with(document){open();write(xrep(FixPointSize(Expand("Back212519999name=dmbTB200125191000> 1001EH100100125191002 OnMouseOver=\"hsNSHoverSel(0,this);cFrame.ShowMenu(\'DynAPI_Template\',1,0,false,\'\',-2);\"\"> 1001N00125191001 visibility=inherit>20	8FFFFFF>0012119>31210DynAPI_Template 1001O0012519100149291D20	8FFFFFF>0012119>31210DynAPI_Template")),'%'+'%REL%%',rimPath));close();}if(NS) with(document){open();write(xrep(FixPointSize(Expand(" name=DynAPI_Template0082191000bgColor=#6D3E2B1182191001> 1EH1118081003 OnMouseOver=\"cFrame.NSHoverSel(0,this);\"> 1N118081002ECD6CE>22	86D3E2B>00764>-4760DynAPICmd 1O1180810026D3E2B22	8FFFFFF>00764>-4760DynAPICmd1980111002>85641 bgcolor=#000000>")),'%'+'%REL%%',rimPath));close();}Expand('');SetUpEvents();function Expand(code){code=xrep(code,""," left=");code=xrep(code,""," top=");code=xrep(code,""," width=");code=xrep(code,""," height=");code=xrep(code,""," z-index=");code=xrep(code,""," visibility=hidden><layer ");code=xrep(code,""," bgColor=#");code=xrep(code,"	","><font face=");code=xrep(code,"","</font>");code=xrep(code,""," point-size=");code=xrep(code,""," color=#");code=xrep(code,"","><div align=left>");code=xrep(code,"","><div align=center>");code=xrep(code,"","</div>");code=xrep(code,"","<layer");code=xrep(code,"","</layer>");code=xrep(code,"","<ilayer");code=xrep(code,"","</ilayer>");code=xrep(code,"","name=MC");code=xrep(code,""," visibility=hidden>");code=xrep(code,"","</b>");code=xrep(code,"","><b");code=xrep(code,""," name=dmbTB");code=xrep(code,"","Verdana");return code;}function xA(o, n){for(var i=1;i<nTCode.length;i++){if(nTCode[i])nTCode[i]=xrep(nTCode[i],o,n);}}function pri(n){return parseInt(n)}