<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="commonconn.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>drag drop</title>
<style>.draggable{cursor: move;}</style>
</head>
<body>
<%
ResultSet rs=null;
stmt=con.prepareStatement("select column_name, column_type from information_schema.columns where table_name='namelist';");
rs=stmt.executeQuery();
while(rs.next()){
	%>
	<label id="<%out.println(rs.getString(2)+"."+rs.getString(1));%>" class="draggable"><%out.println(rs.getString(2)+"."+rs.getString(1));%></label><br>
	<%
	}
	 %>
<p style="margin-left:300px;text-indent: 5em;"><B>y axis &nbsp;&nbsp;&nbsp;&nbsp;  x axis</B></p>
<button id="drop_boxy" style="margin-left:300px;width: 70px;height: 200px;border: 1px solid black;"></button>
<button id="drop_boxx" style="width: 200px;height: 70px;border: 1px solid black;"></button><br><br>
</body>
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
    $( ".draggable" ).draggable({
    	cursor:"move",
    	helper: function() {
            return jQuery(this).clone().appendTo('body').css({
                'zIndex': 5
            });
        }        
    });
$( "#drop_boxx" ).droppable({	
  drop: function( event, ui ) {  
	  $targetidx=event.target.id;	  	
	  if (!ui.draggable.hasClass("dropped"))
          jQuery(this).append(jQuery(ui.draggable).clone().addClass("dropped").draggable()); 
         $bx=ui.draggable.attr('id');//dropped elmt id         
         //alert(" draggable: " + $bx + " , dropbox: " + $targetidx);             
         $(this).droppable( 'disable' );
  }  
});
$( "#drop_boxy" ).droppable({	
	  drop: function( event, ui ) {  
		  $by=ui.draggable.attr('id');//dropped elmt id 
		  //alert($by);
		  if($by.match(/var/gi)=="var"||$by.match(/text/gi)=="text")
			{
				alert("I accept only NUMERIC values");
				ui.draggable.draggable('option','revert',true);
			}
		else if($by.match(/int/gi)=="int")
			{
			//alert("else");
			if (!ui.draggable.hasClass("dropped"))
		          jQuery(this).append(jQuery(ui.draggable).clone().addClass("dropped").draggable()); 
			}
		  $targetidy=event.target.id;	  	
		 /*  if (!ui.draggable.hasClass("dropped"))
	          jQuery(this).append(jQuery(ui.draggable).clone().addClass("dropped").draggable()); 	                
	         //alert(" draggable: " + $by + " , dropbox: " + $targetidy);             
	         $(this).droppable( 'disable' ); */
	  }  
	});
//button with click func 
var btn=document.createElement("BUTTON");
var t=document.createTextNode("CLICK TO CREATE");
btn.appendChild(t);
document.body.appendChild(btn);
btn.onclick = function() { //  this is a function 	
	window.location.href="drg_drp2.jsp?x="+$bx+"&&y="+$by;	
    //    alert("js created buton");
    };
//end button    
});
</script>
</html>
