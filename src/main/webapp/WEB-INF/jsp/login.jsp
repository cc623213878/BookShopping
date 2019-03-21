<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
    <link rel="stylesheet" href="./css/login.css">
    <script src="./js/jquery.min.js"></script>
</head>
<body>
<form id="form_login" action="logining" method="POST">
    <table id="login">
    	<tr>
            <td colspan="2"  align="center">登录</td>
        </tr>
        <tr>
            <td colspan="2"  align="center" style="color:red"><span>${errorinfo }</span></td>
        </tr>
        <tr>
            <td class="tb_title" width="66" height="30" class="login_td">用户名：</td>
            <td width="115" class="login_td">
            	<input class="text" type="text" name="username" id="username">
            </td>
        </tr>
        <tr>
            <td class="tb_title" height="30" class="login_td">密 码：</td>
            <td class="login_td">
                <input class="text" type="password" name="password" 
                id="password">
            </td>
        </tr>
        <tr>
            <td class="tb_title">
            </td>
            <td>
                <canvas width="100" height="40" id="verifyCanvas" style="display: none;"></canvas>
                <img  id="code_img" src="data:image/png;base64,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">
                <div id="verifyCanvas_after"></div>
            </td>
        </tr>
        <tr>
            <td class="tb_title" height="30" class="login_td">验证码：</td>
            <td  class="login_td">
                <input class="text" type="text" name="verify" id="verify">
            </td>
        </tr>
        <tr>
        	<td></td>
            <td  align="left">
            	<input  type="checkbox" name="remeberbox" id="remeberbox"/>
             	<span>记住密码</span>
            </td>
        </tr>
        <tr>
            <td  colspan="2" align="center">
            	<input id="submin" type="button" value="登录" />  
             	<a id="reg" href="reg">注册</a>
            </td>
        </tr>
    </table>
</form>

</body>
<script>
    var nums = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
        'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
        'y', 'z'];
    // 绘制验证码
    function drawCode() {
        var canvas = document.getElementById("verifyCanvas");  //获取HTML端画布
        var context = canvas.getContext('2d');                 //获取画布2D上下文
        context.fillStyle = "cornflowerblue";                  //画布填充色
        context.fillRect(0, 0, canvas.width, canvas.height);   //清空画布
        context.fillStyle = "white";                           //设置字体颜色
        context.font = "25px Arial";                           //设置字体
        var rand = new Array();
        var x = new Array();
        var y = new Array();
        for (var i = 0; i < 5; i++) {
            rand[i] = nums[Math.floor(Math.random() * nums.length)]
            x[i] = i * 16 + 10;
            y[i] = Math.random() * 20 + 20;
            context.fillText(rand[i], x[i], y[i]);
        }
        //alert(rand);
        //画3条随机线
        for (var i = 0; i < 3; i++) {
            drawline(canvas, context);
        }

        // 画30个随机点
        for (var i = 0; i < 30; i++) {
            drawDot(canvas, context);
        }
        convertCanvasToImage(canvas);
        return rand;
    }

    // 随机线
    function drawline(canvas, context) {
        context.moveTo(Math.floor(Math.random() * canvas.width), Math.floor(Math.random() * canvas.height));             //随机线的起点x坐标是画布x坐标0位置，y坐标是画布高度的随机数
        context.lineTo(Math.floor(Math.random() * canvas.width), Math.floor(Math.random() * canvas.height));  //随机线的终点x坐标是画布宽度，y坐标是画布高度的随机数
        context.lineWidth = 0.5;                                                  //随机线宽
        context.strokeStyle = 'rgba(50,50,50,0.3)';                               //随机线描边属性
        context.stroke();                                                         //描边，即起点描到终点
    }
    // 随机点(所谓画点其实就是画1px像素的线，方法不再赘述)
    function drawDot(canvas, context) {
        var px = Math.floor(Math.random() * canvas.width);
        var py = Math.floor(Math.random() * canvas.height);
        context.moveTo(px, py);
        context.lineTo(px + 1, py + 1);
        context.lineWidth = 0.2;
        context.stroke();

    }
    // 绘制图片
    function convertCanvasToImage(canvas) {
        document.getElementById("verifyCanvas").style.display = "none";
        var image = document.getElementById("code_img");
        image.src = canvas.toDataURL("image/png");
        return image;
    }
    function getCookie(c_name){
	    if (document.cookie.length>0){
	      	c_start=document.cookie.indexOf(c_name + "=")
	      	if (c_start!=-1){ 
	        	c_start=c_start + c_name.length+1 
	        	c_end=document.cookie.indexOf(";",c_start)
	        	if (c_end==-1) c_end=document.cookie.length
	        		return unescape(document.cookie.substring(c_start,c_end))
	        } 
	    }
	    return ""
    }
    // 点击图片刷新
    var yzm;
    yzm=drawCode();
    $(document).ready(function(){
        var s=$('#code_img');
        var log=$('#verifyCanvas_after');
        s.click(function () {
            $('#verifyCanvas').remove();
            log.before('<canvas width="100" height="40" id="verifyCanvas"></canvas>');
            yzm=drawCode();
        });
        s.hover(
            function(){
                log.text('看不清');
            },
            function(){
                log.text('');
            }
        );
        if(getCookie('chchyu_username')!=null){
        	$('#username').val(getCookie('chchyu_username'));
        	$('#password').val(getCookie('chchyu_password'));
        	$('#remeberbox').attr("checked", true);
        }
        $('#submin').click(function () {
            var str='';
            for(i=0;i<5;i++)
                str=str+yzm[i];
            if (str.toLowerCase()=== $('#verify').val())
                $('#form_login').submit();
            else {
                log.text('验证码错误');
                $('#verifyCanvas').remove();
                log.before('<canvas width="100" height="40" id="verifyCanvas"></canvas>');
                yzm=drawCode();
            }
        });
        
    })
</script>
</html>