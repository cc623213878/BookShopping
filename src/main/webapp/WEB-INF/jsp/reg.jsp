<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册账号</title>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<style type="text/css">
	body{
		background-color: #61adf5;
	}
	.tb_title{
        width: 70px;
		text-align: right;
	}
	.text{
		height: 22px;
		line-height: 22px;
		border: none;
	}
	#reg{
        font-size: 14px ;
        width: 40%;
		margin: auto;
		margin-top: 200px;
		padding:10px 20px 10px 20px;
		box-shadow:1px 1px 5px black;
		background-color: #3791c4 ;
		border-radius: 16px;
		color: white;
	}
	#reset{
        cursor: pointer;
        width: 60px;
        height: 30px;
        border: none;
        background-color:#61adf5; 
        color: white;
		position: relative;
        left: 100px;
	}
    th{
        font-size: 20px;
    }
	#submin{
        width: 60px;
        height: 30px;
        border: none;
        color: white;
        background-color:#61adf5; 
        position: relative;
        left: 100px;
	}
    #reset:hover{
      box-shadow:1px 1px 5px black;
	}
    .open{
         cursor: pointer;
    }
    .open::hover{
        box-shadow:1px 1px 5px black;
	}
    span{
        margin-left: 10px;
        width: 200px;
        height: 30px;
        line-height: 12px;
        font-size: 12px;
    }
</style>
</head>
<body>
<form action="reg_into" method="POST">
    <table id="reg">
    	<tr>
            <th colspan="2" >注册</th>
        </tr>
        <tr>
            <th colspan="2" >${errorinfo }</th>
        </tr>
        <tr>
            <td colspan="2" height="10px"></td>
        </tr>
        <tr>
            <td class="tb_title"  class="login_td">用户名：</td>
            <td class="login_td">
            	<input class="text" type="text" name="username" id="username"><span id="username_err"></span>
            </td>
        </tr>
        <tr>
            <td class="tb_title" class="login_td">密码：</td>
            <td class="login_td">
            	<input class="text" type="password" name="password" id="password"><span id="password_err"></span>
            </td>
        </tr>
        <tr>
            <td class="tb_title" class="login_td">重复密码：</td>
            <td class="login_td">
                <input class="text" type="password" name="password_2" id="password_2">
            </td>
        </tr>
        <tr>
            <td height="30" colspan="2">
            	<input id="reset" type="reset" value="重置" />  
             	<input id="submin" class="open" type="submit" value="注册"/> 
            </td>
        </tr>
    </table>
</form>
<script>
    $(function(){
        count=0;
        $('#username').focusout(function () {
            var l = $(this).val().length;
            val= $(this).val();
            if(l<6){
                $('#username_err').text("使用最少6位数字和字母组合");
                $('#submin').attr("disabled", true); 
                $('#submin').removeClass('open');
            }
            else{
                var isletter = /^[a-zA-Z0-9]+$/.test(val);
                if (isletter)
                    $('#username_err').text(" "); 
                else{
                    $('#username_err').text("使用最少6位数字和字母组合");
                    $('#submin').attr("disabled", true); 
                    $('#submin').removeClass('open');
                }
            }
        });
        $('#password').focusout(function () {
            var l = $(this).val().length;
            if (l < 6){
                $('#password_err').text("密码最少使用6位数");
                $('#submin').attr("disabled", true); 
                $('#submin').removeClass('open');
            }
            else
                $('#password_err').text(" ");

        });
         $('#password_2').focusout(function () {
            if ($('#password_2').val()!= $('#password').val()) {
                $('#password_err').text("密码不相同");
                $('#submin').attr("disabled", true);
                $('#submin').removeClass('open');
            }
            else if($(this).val().length>=6)
                $('#password_err').text(" ");
        });
        $('input').focusout(function () {
            em= /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
            user= /^[a-zA-Z0-9]+$/;
            if(user.test($('#username').val())&& $('#password').val().length >=6&& $('#password_2').val() === $('#password').val()){
                $('#submin').attr("disabled", false); 
                $('#submin').addClass('open');
            }
        });
    });
</script>
</body>
</html>