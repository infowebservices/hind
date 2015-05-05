<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendEmail.aspx.cs" Inherits="HindiUnicode.SendEmail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
       <link rel="stylesheet" href="Style/style.css" type="text/css" media="screen" />
 
   
</head>
<body bgcolor="#3e3e3e" style="background-color: White; color: Balck">
    <form id="form1" runat="server">
    <div style="position: relative; top: -10px; width: 485px">
        <table width="100%" border="0">
            <tr id="trEmailID" runat="server">
                <td class="UniCodeFont" style="color: Black">
                    ईमेल पता
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="295px"></asp:TextBox>
                </td>
            </tr>
            <tr id="trMessage" runat="server">
                <td colspan="2" style="width: 100%;color: Black" class="UniCodeFont">
                    <br />
                    &nbsp;परिवर्त यूनिकोडे टेक्स्ट आप के दीये ईमेल पता पर बेज दिया गया है
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Image ID="Image1" runat="server" ImageUrl="images/loading.gif" Height="29px" />
                    <asp:Button ID="btnOk" runat="server" CssClass="btn UniCodeFont" Text="ओके" OnClick="btnOk_Click" />
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hidEmailAttContent" runat="server" />
        <asp:HiddenField ID="hidSubject" runat="server" />
         <asp:HiddenField ID="hidEmailBody" runat="server" />
        
    </div>
    </form>

    <script>
        function CloseWindow() {
            window.parent.ClosePopUp();
            return false;
        }

        function ShowLoading(obj) {

            if (document.getElementById("TextBox1") != null)
                if (!ValidateEmail(document.getElementById("TextBox1").value))
                return false;

            document.getElementById("Image1").style.display = "";
            obj.style.display = "none";
            return true;
        }

        function ValidateEmail(email) {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
            if (!email.match(re)) {
                alert("InValid Email");
                return false;
            }
            document.getElementById("hidEmailAttContent").value = parent.GetMailAttachmentContent();
            document.getElementById("hidEmailBody").value = parent.GetMailBody();
            document.getElementById("hidSubject").value = parent.GetMailSubject();
            return true;
        }

        try {
            if (document.getElementById("TextBox1") != null)
                document.getElementById("TextBox1").focus();
        }
        catch (ex) { }
    </script>

</body>
</html>
