<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GESTION.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <title>Gestion_Login</title>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
		
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"/>

    <style type="text/css">
        

#Contenedor{
	width: 400px;
	margin: 50px auto;
	background-color: #F3EDED;
        border: 1px solid #ECE8E8;
	height: 400px;
	border-radius:8px;
	padding: 0px 9px 0px 9px;
}


.Icon span{
      background: #A8A6A6;
      padding: 20px;
      border-radius: 120px;
}

.Icon{
     margin-top: 10px;
     margin-bottom:10px; 
     color: #FFF;
     font-size: 50px;
     text-align: center;
}

.opcioncontra{
	text-align: center;
	margin-top: 20px;
	font-size: 14px;
}


@media only screen and (max-width:320px){
#Contenedor{
	width: 100%;
	height: auto;
	margin: 0px;
}


@media only screen and (max-width:240px){
	
}


body{
	font-size: 12px;
}

#Contenedor{
	width: 400px;
	margin: 50px auto;
	background-color: #F3EDED;
        border: 1px solid #ECE8E8;
	height: 400px;
	border-radius:8px;
	padding: 0px 9px 0px 9px;
}
 

.Icon span{
      background: #A8A6A6;
      padding: 20px;
      border-radius: 120px;
}

.Icon{
     margin-top: 10px;
     margin-bottom:10px; 
     color: #FFF;
     font-size: 50px;
     text-align: center;
}

.opcioncontra{
	text-align: center;
	margin-top: 20px;
	font-size: 14px;
}
 
@media only screen and (max-width:320px){
#Contenedor{
	width: 100%;
	height: auto;
	margin: 0px;
}
 

@media only screen and (max-width:240px){
	
}

.claseDelDiv{
    background-image: url("/Imagenes/LOGO-WT-BLUE.png");
    background-repeat: no-repeat;
    background-size: cover;
    border-image-width:100%;
}
 


        .auto-style1 {
            border-width: 7px;
            padding-top: 9px;
            padding-bottom: 9px;
        }
 


   </style>

        <script type="text/javascript">function MostrarModalJS() {
    window.location.href = '#nombralo';
            }</script>


</head>
<body>
      <div class="grid-block embed-responsive-16by9" style="background-image: url('/Gestion2/Imagenes/FONDO.jpg') ;background-repeat: no-repeat; background-attachment:fixed; background-size: cover; width: 100%; height: 100vh; ">

         
    
	<div id="Contenedor" class="auto-style1">
		
        <div class="Icon img-circle" alt="Cinque Terre">        

<img src="/Gestion2/Imagenes/Login_LLaves.jpg" class="img-rounded" alt="Cinque Terre">

 </div>


                 <div class="ContentForm">
		 	     <form action="#" method="post" runat="server" name="FormEntrar">
		 	    	<div class="input-group input-group-lg" style="border: 4px outset #F9F2F4">
				  <span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-user"></i></span>
	    	    <asp:TextBox  runat="server" type="text"  id="txtUsuario" class="form-control" name="correo" placeholder="Usuario" aria-describedby="sizing-addon1" ></asp:TextBox>
                     
                     </div>
				<br/>
				<div class="input-group input-group-lg" style="border: 4px outset #F9F2F4">
				  <span class="input-group-addon" id="sizing-addon2"><i class="glyphicon glyphicon-lock"></i></span>
                    <asp:TextBox  runat="server" id="txtContraseña" type="password" name="contra" class="form-control" placeholder="******" aria-describedby="sizing-addon2" ></asp:TextBox>
                
                </div>
				<br/>
				<button class="btn btn-lg btn-primary btn-block btn-signin" runat="server" onserverclick="btnIngresar_Click"  type="submit">Entrar</button>
				<div class="opcioncontra"><a href="">Olvidaste tu contraseña?</a></div>

                <div class="text-center">      
                  <div id="Alertaok" runat="server" class="alert alert-success" visible="false">
                   <i class="glyphicon glyphicon-thumbs-up"></i> &nbsp;&nbsp; ¡Registro Realizado Correctamente!</div>
                 <div id="Alertanook" runat="server" class="alert alert-danger" visible="false">
                    <i class="glyphicon glyphicon-thumbs-down"></i>&nbsp;&nbsp;¡Error En El Registro , Favor Revisar los Datos...!</div>
            </div>

		 	</form>
		 </div>	
		 </div>
       <div class="text-center">

           <br />
           <br />
           <br />
           <br />
           <br />
     <strong>  Developed by Mario Rosales Figueroa © Copyright 2017 All Rights Reserved , World Transport International Ltda</strong>


       </div>




    </div>



      


</body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</html>

