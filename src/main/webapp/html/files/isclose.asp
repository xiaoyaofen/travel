
function changeloginreg(){}
function changeloginm(){}


Function.prototype.method = function (name, func) {
  this.prototype[name] = func;
  return this;
};
if (!String.prototype.trim) {
  String.method('trim', function () {
    return this.replace(/^\s+|\s+$/g, '');
  });
  String.method('ltrim', function () {
    return this.replace(/^\s+/g, '');
  });
  String.method('rtrim', function () {
    return this.replace(/\s+$/g, '');
  });
}

function checksearch(frm) {
	if (typeof(frm.keywords)!="undefined"){
  if (frm.keywords.value.trim() == '' || frm.keywords.value.trim() == '������ؼ���') {
    alert("�����ؼ��ʲ���Ϊ�գ������롣");
    frm.keywords.focus();
    return false;
  }
  frm.submit();
  return false;
}
}

function AddFavorite(sURL, sTitle) {
  sURL = encodeURI(sURL);
  try {
    window.external.addFavorite(sURL, sTitle);
  } catch (e) {
    try {
      window.sidebar.addPanel(sTitle, sURL, "");
    } catch (e) {
      alert("�����ղ�ʧ�ܣ��밴��Ctrl+D�������,���ֶ�������������á�");
    }
  }
}

function SetHome(url) {
  if (document.all) {
    document.body.style.behavior = "url(#default#homepage)";
    document.body.setHomePage(url);
  } else {
    alert("�������֧�ִ˹���,���ֶ������������ҳ��������á�");
  }
}
var initial_fontsize = 16;
var initial_lineheight = 28;

function setFontsize(type, objname) {
  var whichEl = document.getElementById(objname);
  if (whichEl != null) {
    var oP = document.getElementById(objname).getElementsByTagName("p");
    if (type == 1) {
      if (initial_fontsize < 42) {
        whichEl.style.fontSize = ++initial_fontsize + "px";
        whichEl.style.lineHeight = ++initial_lineheight + "px";
        if (oP != null) {
          for (var i = 0; i < oP.length; i++) {
            oP[i].style.fontSize = whichEl.style.fontSize;
            oP[i].style.lineHeight = whichEl.style.lineHeight;
          }
        }
      }
    } else {
      if (initial_fontsize > 8) {
        whichEl.style.fontSize = --initial_fontsize + "px";
        whichEl.style.lineHeight = --initial_lineheight + "px";
        if (oP != null) {
          for (var i = 0; i < oP.length; i++) {
            oP[i].style.fontSize = whichEl.style.fontSize;
            oP[i].style.lineHeight = whichEl.style.lineHeight;
          }
        }
      }
    }
  }
}

function trresizeimg(maxw, maxh, objimg) {
  var img = new Image();
  img.src = objimg.src;
  if (parseInt(objimg.getAttribute("width"))>0&&parseInt(objimg.getAttribute("width"))!=parseInt(img.width)){return false}
if (parseInt(objimg.getAttribute("height"))>0&&parseInt(objimg.getAttribute("height"))!=parseInt(img.height)){return false}

  var hratio;
  var wratio;
  var ratio = 1;
  var w = img.width;
  var h = img.height;
  wratio = maxw / w;
  hratio = maxh / h;
  if (maxw == 0 && maxh == 0) {
    ratio = 1;
  } else if (maxw == 0) {
    //
    if (hratio < 1) ratio = hratio;
  } else if (maxh == 0) {
    if (wratio < 1) ratio = wratio;
  } else if (wratio < 1 || hratio < 1) {
    ratio = wratio <= hratio ? wratio : hratio;
  }
  if (ratio < 1) {
    w = w * ratio;
    h = h * ratio;
  }
  objimg.height = h;
  objimg.width = w;
}

function checkuseradd(frm) {
  frm.submit1.disabled = "true";
  var patrn = /^[\w+$]{5,20}$/;
  	if (typeof(frm.username)!="undefined"){
if (!patrn.test(frm.username.value.trim())) {
    alert("��¼��Ϊ5-20���ַ����������뺺�֣�ֻ�ɰ������֣���ĸ���»���");
    frm.username.focus();
    frm.submit1.disabled = 0;
    return false;
  }
}
  	if (typeof(frm.passwd1)!="undefined"){
  if (!patrn.test(frm.passwd1.value.trim())) {
    alert("����Ϊ5-20���ַ����������뺺�֣�ֻ�ɰ������֣���ĸ���»���");
    frm.passwd1.focus();
    frm.submit1.disabled = 0;
    return false;
  }
}
  	if (typeof(frm.passwd1)!="undefined"){
  if (frm.passwd1.value != frm.passwd2.value) {
    alert("�����������벻ͬ������������");
    frm.passwd1.focus();
    frm.submit1.disabled = 0;
    return false;
  }
}
  	if (typeof(frm.mail)!="undefined"){
  mail = frm.mail.value.trim();
  if (mail.indexOf("55tr.com") > -1) {
    alert("��������ʵ������,����ʹ��55tr.com");
    frm.mail.focus();
    frm.submit1.disabled = 0;
    return false;
  }
}
  re = new RegExp("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$");
  	if (typeof(frm.mail)!="undefined"){
  if (!re.test(mail)) {
    alert("��������ȷ������,���� admin@55tr.com");
    frm.mail.focus();
    frm.submit1.disabled = 0;
    return false;
  }
}
  var patrn = /^[0-9]{4}$/;
  	if (typeof(frm.vcode)!="undefined"){
  if (!patrn.test(frm.vcode.value.trim())) {
    alert("��֤��Ϊ4λ���֣�������");
    frm.vcode.focus();
    frm.submit1.disabled = 0;
    return false;
  }
}
  frm.submit();
    frm.submit1.disabled = 0;
  return false;
}

function checkuseredit(frm) {
  frm.submit1.disabled = "true";
  var patrn = /^[\w+$]{5,20}$/;
  	if (typeof(frm.passwd0)!="undefined"){
  if (!patrn.test(frm.passwd0.value.trim())) {
    alert("ԭʼ����Ϊ5-20���ַ����������뺺�֣�ֻ�ɰ������֣���ĸ���»���");
    frm.passwd0.focus();
    frm.submit1.disabled = 0;
    return false;
  }
}
  	if (typeof(frm.passwd1)!="undefined"){
  if (frm.passwd1.value.trim() != "") {
    if (!patrn.test(frm.passwd1.value.trim())) {
      alert("����������Ϊ5-20���ַ����������뺺�֣�ֻ�ɰ������֣���ĸ���»���");
      frm.passwd1.focus();
    frm.submit1.disabled = 0;
      return false;
    }
    if (frm.passwd1.value != frm.passwd2.value) {
      alert("��������������벻ͬ�����������룬���޸�������");
      frm.passwd1.focus();
    frm.submit1.disabled = 0;
      return false;
    }
  }
}
  frm.submit();
    frm.submit1.disabled = 0;
  return false;
}

function checkuserlog(frm) {
  frm.submit1.disabled = "true";
  var patrn = /^[\w+$]{5,20}$/;
  	if (typeof(frm.username)!="undefined"){
  if (!patrn.test(frm.username.value.trim())) {
    alert("��¼��Ϊ5-20���ַ����������뺺�֣�ֻ�ɰ������֣���ĸ���»���");
    frm.username.focus();
    frm.submit1.disabled = 0;
    return false;
  }
}
  	if (typeof(frm.passwd)!="undefined"){
  if (!patrn.test(frm.passwd.value.trim())) {
    alert("����Ϊ5-20���ַ����������뺺�֣�ֻ�ɰ������֣���ĸ���»���");
    frm.passwd.focus();
    frm.submit1.disabled = 0;
    return false;
  }
}
  var patrn = /^[0-9]{4}$/;
  	if (typeof(frm.vcode)!="undefined"){
  if (!patrn.test(frm.vcode.value.trim())) {
    alert("��֤��Ϊ4λ���֣�������");
    frm.vcode.focus();
    frm.submit1.disabled = 0;
    return false;
  }
}
  frm.submit();
    frm.submit1.disabled = 0;
  return false;
}

function randomString(len) {
  len = len || 32;
  var $chars = "ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678";
  /****Ĭ��ȥ�������׻������ַ�oOLl,9gq,Vv,Uu,I1****/
  var maxPos = $chars.length;
  var pwd = "";
  for (i = 0; i < len; i++) {
    pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
  }
  return pwd;
}

function udelnew(frm) {
  if (confirm("ɾ�����޷��ָ���ȷ��ɾ������ô��")) {
    frm.submit();
  } else {
    return false;
  }
}

function checkguest(frm) {
  frm.submit1.disabled = "true";
  	if (typeof(frm.content)!="undefined"){
  if (frm.content.value.trim().length < 6) {
    alert("��������Ӧ����6���ַ�");
    frm.content.focus();
    frm.submit1.disabled = 0;
    return false;
  }
}
  var patrn = /^(\w+){2,20}|([\u0391-\uFFE5]+){2,20}$/;
  	if (typeof(frm.username)!="undefined"){
  if (!patrn.test(frm.username.value.trim())) {
    alert("�ǳ�Ϊ2��20λ�ַ����������뺺�֣�ֻ�ɰ������֣����֣���ĸ���»���");
    frm.username.focus();
    frm.submit1.disabled = 0;
    return false;
  }
}
  	if (typeof(frm.mail)!="undefined"){
  mail = frm.mail.value.trim();
  if (mail != "") {
    if (mail.indexOf("55tr.com") > -1) {
      alert("��������ʵ������,����ʹ��55tr.com������");
      frm.mail.focus();
    frm.submit1.disabled = 0;
      return false;
    }
    re = new RegExp("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$");
    if (!re.test(mail)) {
      alert("��������ȷ������,���� admin@55tr.com������");
      frm.mail.focus();
    frm.submit1.disabled = 0;
      return false;
    }
  }
}
  	if (typeof(frm.homepage)!="undefined"){
  homepage = frm.homepage.value.trim();
  if (homepage != "") {
    re = new RegExp("^[A-Za-z0-9-_]+\\.[A-Za-z0-9-_%&?/.=]+$");
    if (!re.test(homepage)) {
      alert("��������ȷ����ַ,���� www.55tr.com������");
      frm.homepage.focus();
    frm.submit1.disabled = 0;
      return false;
    }
  }
}
  var patrn = /^[0-9]{4}$/;
  	if (typeof(frm.vcode)!="undefined"){
  if (!patrn.test(frm.vcode.value.trim())) {
    alert("��֤��Ϊ4λ���֣�������");
    frm.vcode.focus();
    frm.submit1.disabled = 0;
    return false;
  }
}
  top.trdisnone.innerHTML = ("<iframe id=\"ifr1\" name=\"ifr1\" style=\"display:none;\"></iframe>");
  frm.submit();
    frm.submit1.disabled = 0;
  return false;
}

function confirms() {
  if (confirm("ȷ����������ô��")) {} else {
    return false;
  }
}

function reloadAbleJSFn(id, newJS) {
  var oldjs = null;
  var t = null;
  var oldjs = document.getElementById(id);
  if (oldjs) oldjs.parentNode.removeChild(oldjs);
  var scriptObj = document.createElement("script");
  scriptObj.src = newJS;
  scriptObj.type = "text/javascript";
  scriptObj.id = id;
  document.getElementsByTagName("head")[0].appendChild(scriptObj);
}

function check_uaddnews(frm) {
  frm.submit1.disabled = "true";
  	if (typeof(frm.title)!="undefined"){
  if (frm.title.value.trim() == "") {
    alert("���ⲻ��Ϊ�գ������롣");
    frm.title.focus();
    frm.submit1.disabled = 0;
    return false;
  }
}
  	if (typeof(frm.columnid)!="undefined"){
  if (frm.columnid.value.trim() == "") {
    alert("������Ŀ����Ϊ�գ���ѡ��");
    frm.columnid.focus();
    frm.submit1.disabled = 0;
    return false;
  }
}
  frm.submit();
    frm.submit1.disabled = 0;
  return false;
}

var initial_rem = 3;
var initial_linerem = 3;

function setFontrem(type, objname) {
  var whichEl = document.getElementById(objname);
  if (whichEl != null) {
    var oP = document.getElementById(objname).getElementsByTagName("p");
    if (type == 1) {
      if (initial_rem < 8) {
        whichEl.style.fontSize = ++initial_rem*0.1 + "rem";
        whichEl.style.lineHeight = ++initial_linerem*0.1 + "rem";
        if (oP != null) {
          for (var i = 0; i < oP.length; i++) {
            oP[i].style.fontSize = whichEl.style.fontSize;
            oP[i].style.lineHeight = whichEl.style.lineHeight;
          }
        }
      }
    } else {
      if (initial_rem > 2) {
        whichEl.style.fontSize = --initial_rem*0.1 + "rem";
        whichEl.style.lineHeight = --initial_linerem*0.1 + "rem";
        if (oP != null) {
          for (var i = 0; i < oP.length; i++) {
            oP[i].style.fontSize = whichEl.style.fontSize;
            oP[i].style.lineHeight = whichEl.style.lineHeight;
          }
        }
      }
    }
  }
}

function hm170525() {����
var lena = 8;
var $chars = '12345678';����
var maxPos = $chars.length;����
var pwdd = '';����
for (i = 0; i < lena; i++) {��������
pwdd =pwdd+ $chars.charAt(Math.floor(Math.random() * maxPos));����
}����
return pwdd;
}
function setAttributezdy(o,a,v){
if(typeof o!='object'||typeof a!='string') return;
a=='class'?o.className=v:o.setAttribute(a,v);
}

function clkclose170522(ctdid){
document.getElementById("adtop"+ctdid).style.display="none";
}
function adClose170522(s,str170522,isfrist,dftdid){
var strlen=parseInt(str170522.length);
if (s==''){s=9999}
if (strlen>8 && strlen<=20 && parseInt(s)>parseInt(strlen)){s=parseInt(strlen/2)}
else if (strlen>20 && strlen<=40 && parseInt(s)>parseInt(strlen)){s=parseInt(strlen/3)}
else if (strlen>40 && parseInt(s)>parseInt(strlen)){s=parseInt(strlen/4)}
else if (strlen<=8 && s>5 ){s=5}
//s=999
var tdid=''
if (dftdid==''){var tdid = hm170525() }
else if (dftdid!='') {tdid=dftdid}
if (isfrist==1){
var vtrntblock=document.getElementById('trntblock');
var newdiv=document.createElement('div'); 
newdiv.setAttribute('id','adtop' +tdid); 
setAttributezdy(newdiv,'class','adtop170528')
//newdiv.setAttribute('class', 'adtop'); 
newdiv.innerHTML = "<span class=\"num170528\" id=\"num"+tdid+"\"></span><span class=\"close170528\" onClick=\"return clkclose170522("+tdid+")\">x</span><div id=\"nt"+tdid+"\"></div>";
vtrntblock.appendChild(newdiv);
}
var adtop = document.getElementById("adtop"+ tdid);
var adtopi = document.getElementById("num"+ tdid);
var nt170522 = document.getElementById("nt"+ tdid);
nt170522.innerHTML=str170522
if (isfrist==1){adtop.style.display="block";}
if (isfrist!=1 && adtop.style.display=="none"){
return false;}
s--;
adtopi.innerHTML=s;
if(s<=0){
adtop.style.display="none";
return;
}
return setTimeout(function(){adClose170522(s,str170522,0,tdid)},1000);
}; 






function _55tr_com(callid){
switch(callid){
}
}
