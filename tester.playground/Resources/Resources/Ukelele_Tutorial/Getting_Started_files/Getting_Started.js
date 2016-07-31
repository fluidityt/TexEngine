// Created by iWeb 2.0.4 local-build-20091128

setTransparentGifURL('Media/transparent.gif');function applyEffects()
{var registry=IWCreateEffectRegistry();registry.registerEffects({shadow_0:new IWShadow({blurRadius:4,offset:new IWPoint(1.4142,1.4142),color:'#000000',opacity:0.500000}),stroke_0:new IWStrokeParts([{rect:new IWRect(-1,1,2,398),url:'Getting_Started_files/stroke.png'},{rect:new IWRect(-1,-1,2,2),url:'Getting_Started_files/stroke_1.png'},{rect:new IWRect(1,-1,557,2),url:'Getting_Started_files/stroke_2.png'},{rect:new IWRect(558,-1,2,2),url:'Getting_Started_files/stroke_3.png'},{rect:new IWRect(558,1,2,398),url:'Getting_Started_files/stroke_4.png'},{rect:new IWRect(558,399,2,2),url:'Getting_Started_files/stroke_5.png'},{rect:new IWRect(1,399,557,2),url:'Getting_Started_files/stroke_6.png'},{rect:new IWRect(-1,399,2,2),url:'Getting_Started_files/stroke_7.png'}],new IWSize(559,400))});registry.applyEffects();}
function hostedOnDM()
{return false;}
function onPageLoad()
{loadMozillaCSS('Getting_Started_files/Getting_StartedMoz.css')
adjustLineHeightIfTooBig('id1');adjustFontSizeIfTooBig('id1');adjustLineHeightIfTooBig('id2');adjustFontSizeIfTooBig('id2');adjustLineHeightIfTooBig('id3');adjustFontSizeIfTooBig('id3');Widget.onload();fixAllIEPNGs('Media/transparent.gif');applyEffects()}
function onPageUnload()
{Widget.onunload();}
