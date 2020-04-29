<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>관리자 로그인</title>
<link rel="stylesheet" href="./resources/assets/css/wiz_style.css" />

<script language="javascript">

function inputCheck(frm){

   if(frm.admin_id.value == ""){
      alert("관리자 아이디를 입력하세요");
      frm.admin_id.focus();
      return false;
   }

   if(frm.admin_pw.value == ""){
      alert("관리자 비밀번호를 입력하세요");
      frm.admin_pw.focus();
      return false;
   }

}

function loginFocus(){

   var frm = document.frm;
   var admin_id = frm.admin_id.value;
   var admin_pw = frm.admin_pw.value;

   if(admin_id == ""){
      frm.admin_id.focus();
   }else{
      if(admin_pw == "") frm.admin_pw.focus();
   }

}


</script>
</head>
<body id="index" onLoad="loginFocus();">

<form name="frm" action="./admin_login_ok.mysql" method="post" onSubmit="return inputCheck(this);">
<div id="index_wrap"><div id="index_loginbox"><div class="inner">
	<div class="index_login_form">
    	<ul>
        	<li class="id"><input type="text" name="admin_id" value="" ></li>
        	<li class="pw"><input type="password" name="admin_pw" value=""></li>
        </ul>
        <div class="btn">
			<input type="image" src="./resources/assets/img/admin/index/btn_login.gif" />
		</div>
		<!--		
			<input type="checkbox" name="secure_login" value="Y" checked>보안접속
		-->    </div>

    <div class="top10 left65"></div>
</div></div></div>
</form>

</body>
</html>