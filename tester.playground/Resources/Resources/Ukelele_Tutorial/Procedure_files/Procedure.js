// Created by iWeb 2.0.4 local-build-20091128

setTransparentGifURL('Media/transparent.gif');function applyEffects()
{var registry=IWCreateEffectRegistry();registry.registerEffects({stroke_0:new IWStrokeParts([{rect:new IWRect(-1,1,2,268),url:'Procedure_files/stroke.png'},{rect:new IWRect(-1,-1,2,2),url:'Procedure_files/stroke_1.png'},{rect:new IWRect(1,-1,478,2),url:'Procedure_files/stroke_2.png'},{rect:new IWRect(479,-1,2,2),url:'Procedure_files/stroke_3.png'},{rect:new IWRect(479,1,2,268),url:'Procedure_files/stroke_4.png'},{rect:new IWRect(479,269,2,2),url:'Procedure_files/stroke_5.png'},{rect:new IWRect(1,269,478,2),url:'Procedure_files/stroke_6.png'},{rect:new IWRect(-1,269,2,2),url:'Procedure_files/stroke_7.png'}],new IWSize(480,270)),shadow_0:new IWShadow({blurRadius:4,offset:new IWPoint(1.4142,1.4142),color:'#000000',opacity:0.500000})});registry.applyEffects();}
function hostedOnDM()
{return false;}
function onPageLoad()
{loadMozillaCSS('Procedure_files/ProcedureMoz.css')
adjustLineHeightIfTooBig('id1');adjustFontSizeIfTooBig('id1');adjustLineHeightIfTooBig('id2');adjustFontSizeIfTooBig('id2');adjustLineHeightIfTooBig('id3');adjustFontSizeIfTooBig('id3');Widget.onload();fixAllIEPNGs('Media/transparent.gif');applyEffects()}
function onPageUnload()
{Widget.onunload();}
