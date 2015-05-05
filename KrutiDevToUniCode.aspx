<%@ Page Language="C#" EnableViewState="false" ValidateRequest="true" AutoEventWireup="true" CodeBehind="KrutiDevToUniCode.aspx.cs"
    Inherits="HindiUnicode.KrutiDevToUniCode" %>

<%@ Register Src="Editor.ascx" TagName="Editor" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<script>
        if (window.self == window.top) 
            self.location.href = "index.htm?indx=0";
</script>
    <title>Untitled Page</title>
    <script type="text/javascript" src="JavaScript/Util.js"></script>
    <link rel="stylesheet" href="Style/style.css" type="text/css" media="screen" />
 <script>
 
     function CheckKurtiFont(){
        if (document.getElementById("spnCheckFont").offsetWidth > 190) {
            document.getElementById("divInfoPopup").innerHTML = CreateMessageWindow("<span>कुरूति देव फॉण्ट आप के कंप्यूटर पर स्थापित नहीं है<br><a href='k010.ttf' style=color:White' >डाउनलोड कुरूति देव फॉण्ट</a></span>");
            var divObj = document.getElementById("divInfoPopup");
            divObj.style.left = (document.body.offsetWidth - 325) + "px";
            divObj.style.display = "";
        }
      }
        function GetMailSubjectEx() {
            return "infowebservices/कुरूति देव से यूनिकोडे";
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:Editor ID="Editor1" runat="server" />
        <span  id="spnCheckFont"  style="visibility:hidden;color:White" class="KurtiFont">aaaaaaaaaaaaaaaaaaaaaaaaa</span>
    </div>
    
    </form>

   

</body>
</html>
