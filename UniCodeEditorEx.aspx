<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UniCodeEditorEx.aspx.cs"
    Inherits="HindiUnicode.UniCodeEditorEx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>

    <script>
    var btnclass = "mybutton";
    var keyBoardLeft ="15px";
    var keyFontSize = "15px";
    
function RemoveChildNodes(cell){    
if ( cell.hasChildNodes() )
    while ( cell.childNodes.length >= 1 )
        cell.removeChild( cell.firstChild );       
}

function SetText(text){
    document.getElementById('txtUniCode').value = text;
}

function UpdateKeyBoard()
{
    var arr =   document.getElementsByTagName("INPUT");
    for(var i =0; i < arr.length; i++){
        arr[i].className = btnclass;
     if(arr[i].value.indexOf('Alt') > 0){
        arr[i].style.fontSize = keyFontSize;
     }
  
    }

    arr =   document.getElementsByTagName("button");
    
    for(var i =0; i < arr.length; i++){
        arr[i].className = btnclass;
        arr[i].childNodes[0].className = arr[i].childNodes[0].className + " " + btnclass;;
    }
    
    var k32 = document.getElementById('K32');
    k32.style.width = k32.parentNode.style.width;
}

function MoveKeyBoard()
{

//return;
if( kbd.isVisible())
{
   // kbd.setVisible(false);
        document.getElementById('kbd_t').style.fontSize = "16px";
        document.getElementById('kbd_t').style.height = "25px";
        document.getElementById('kbd_t').style.backgroundColor = "Gray";
        var headerRow =  document.getElementById('kbd_t').parentNode;
        headerRow.id ="trHearderRow";
        RemoveChildNodes(headerRow);
        var td = document.createElement('td');
        td.style.width = "100%";
        td.style.fontSize = "16px";
        td.style.height = "25px";
        td.style.backgroundColor = "#444444";
        td.align ="center";
        td.nowrap = "true"
        td.innerHTML = "हिंदी यूनिकोडे कीबोर्ड";
        headerRow.appendChild(td);
       
        td = document.createElement('td');
        td.style.width = "100%";
        td.style.backgroundColor = "#444444";
        td.align ="center";
        var img = document.createElement('img');
        img.id ='imgCollapse';
        img.src = "images/collapse.png";
        td.appendChild(img);
        headerRow.appendChild(td);
        
          
        document.getElementById('kbd_mka').childNodes[0].style.backgroundColor = "#444444";
        document.getElementById('kbd').style.left =keyBoardLeft;
        document.getElementById('kbd').style.right=document.getElementById('kbd').offsetWidth +"px";
        document.getElementById('kbd').style.top=document.getElementById('txtUniCode').offsetHeight + 25 +  "px";
        document.getElementById('kbd').style.bottom="700px";
        document.getElementById('kbd').className = "";

        UpdateKeyBoard();
        document.getElementById('kbd').style.backgroundColor="black";
        document.getElementById("imgLoading").style.display="none";
        headerRow.childNodes[1].style.width =  document.getElementById('kbd_mka').offsetWidth + "px";
       //alert( headerRow. style.width);
        //kbd.setVisible(true);
    
    document.getElementById('imgCollapse').onclick = function () {CollapaseExpand(this);}
    }
   else{
        setTimeout("MoveKeyBoard()",100);
    }


}

    </script>

    <script type="text/javascript" src="https://www.google.com/jsapi?key=ABQIAAAAQjfRAotG1YXq4slrHXtzXBT2yXp_ZAY8_ufC3CFXhHIE1NvwkxSRAMcE7RjLJucHtwY8j-MtXULGLA"></script>

    <link rel="stylesheet" href="Style/style.css" type="text/css" media="screen">
    <style type="text/css">
        .btn
        {
            border: 1px solid #131313;
            background-position: left top;
            font-weight: normal;
            background-image: url(      'images/btn.png' );
            color: #cccccc;
            background-repeat: repeat-x;
            font-style: normal;
            font-family: Verdana, sans-serif;
            background-color: #131313;
            text-decoration: none;
            cursor: pointer;
        }
        .UniCodeFont
        {
            font-size: 14px;
            font-family: Verdana;
        }
        .mybutton
        {
            border: 1px solid #131313;
            background-position: left top;
            font-weight: normal;
            background-image: url(      'images/btn.png' );
            color: #cccccc;
            background-repeat: repeat-x;
            font-style: normal;
            font-family: Verdana, sans-serif;
            background-color: #131313;
            text-decoration: none;
            cursor: pointer;
            font-size: 18px;
            background-color: Black;
            color: White;
            width: 57px;
            height: 35px;
        }
        
        .mybuttonEx
        {
        	width: 60px;
            height: 33px;
            font-size: 17px;

        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">

    <script type="text/javascript">       
     // Load the Google Onscreen Keyboard API       
     google.load("elements", "1", {           packages: "keyboard"       }); 
     var kbd;
      function onLoad() {     
   
      kbd = new google.elements.keyboard.Keyboard(     
      [google.elements.keyboard.LayoutCode.HINDI],['txtUniCode']); 
     kbd.setVisible(false);
   //  debugger;
     
     setTimeout("MoveKeyBoard()", 100);
      }      
       
       
      google.setOnLoadCallback(onLoad);    
      
    </script>

    <table width="90%" class="panel">
        <tr>
            <td align="center">
                <asp:TextBox ID="txtUniCode" Font-Size="11pt" runat="server" TextMode="MultiLine"
                    Height="300px" Style="overflow: auto;" Width="830px" BorderColor="White" BorderStyle="Solid"></asp:TextBox>
                <span id="imgLoading" style="border: solid 1; position: absolute; top: 200px; left: 200px;"
                    runat="server">
                    <table border="0" width="400px" style="background-color: Gray">
                        <tr>
                            <td align="center">
                                <img src="images/loading.gif" height="30" width="30" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                कृपया प्रतीक्षा करें..
                            </td>
                        </tr>
                    </table>
                </span>
            </td>
            <td align="left">
                <table>
                    <tr>
                        <td>
                            <img title="फ़ॉन्ट का आकार बड़ा करे" class="btn" onclick="ZoomFont1(false)" src="images/zoomin.jpg"
                                style="height: 23px; width: 23px">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img title="फ़ॉन्ट का आकार छोटे करे" class="btn" onclick="ZoomFont1(true)" src="images/zoomout.jpg"
                                style="height: 23px; width: 23px">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
     
        <tr>
            <td style="height: 400px; width: 100%">
                <table width="100%">
                    <tr>
                        <td style="height: 150px;">
                        </td>
                    </tr>
                    <tr>
                        <td width="100%" align="center" valign="middle">
                            <div id="divCloseBtn" onclick="CloseWin()" class="btn UniCodeFont" style="width: 103px;
                                height: 30px; vertical-align: middle">
                                <img src="images/Save.png" style="height: 20px; width: 20px; position: relative;
                                    top: 5px" />&nbsp;<span style="position: relative; top: 0px; font-size: 15px">संपन्न</span>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>

    <script>

        if(window.opener){
        document.getElementById('txtUniCode').value = window.opener.GetEditorText();
        }
        else{
         var btnclass = "mybutton mybuttonEx";
         keyBoardLeft = "30px";
         keyFontSize ="17px";
        document.getElementById('divCloseBtn').style.display = "none";
        document.getElementById('txtUniCode').style.width = "98%";
        document.getElementById('txtUniCode').style.height ="232px";
        }
        
        function ZoomFont1(out) {
        var zoomObject1 =document.getElementById('txtUniCode');
        var size = parseInt(zoomObject1.style.fontSize.substring(0, 2));
        if (out)
            size -= 2;
        else
            size += 2;

        if (size <= 10 || size > 96) {
            return false;
        }

        zoomObject1.style.fontSize = size + "px";

    }
    
    function CloseWin(){
   
     if(window.opener){
     window.opener.SetEditorText(document.getElementById('txtUniCode').value);
     window.close();
     }
    
    }
    
    function CollapaseExpand(imgObj) {
    var obj = document.getElementById('kbd_mka');
        if (obj.style.display == "none") {
            obj.style.display = ""
            imgObj.src = "images/Expand.png";
        }
        else {
            obj.style.display = "none";
            imgObj.src = "images/collapse.png";
        }
        
          document.getElementById("trHearderRow").firstChild.style.width = "1000px";
          document.getElementById("trHearderRow").firstChild.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +document.getElementById("trHearderRow").firstChild.innerText+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";

 //document.getElementById("trHearderRow").firstChild.innerText ="kk"
     //   ResizeFrame();
    }
    
    window.onbeforeunload=function() {CloseWin();}
    
      function ResizeFrame() {
        try {
            window.parent.ResizeChild(document.body.offsetHeight + 40, document.body.offsetWidth, window.name);
        }
        catch (ex) { }
    }
    
    ResizeFrame();

    </script>

</body>
</html>
