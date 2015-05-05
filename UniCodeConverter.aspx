<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UniCodeConverter.aspx.cs"
    Inherits="HindiUnicode.UniCodeConverter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title > कुरूति देव से यूनिकोडे </title>
    <style>
        .KurtiFont
        {
            font-family: 'Kruti Dev 010';
            font-size: 18px;
        }
    </style>
</head>
<body bgcolor="#d5eaff">
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td style="width: 100px;">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 100px;">
                    &nbsp;
                </td>
                <td>
                <span style="font-size:11pt">पेस्ट या टाइप करे कुरूति देव फॉण्ट टेक्स्ट  </span>
                <span style="font-size:10pt;font-family:Verdana">(Past or Type Text in Kruti Dev)</span>
                
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:TextBox ID="txtKurti" runat="server" TextMode="MultiLine" CssClass="KurtiFont"
                        Height="232px" Width="728px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="परिवर्तित्त करे यूनिकोडे में"
                        Width="219px" Font-Names="Verdana" Font-Size="11pt"  
                        ToolTip="Click to Convert to Unicode"/>
                </td>
               </tr>
            <tr>
            <td></td>
                <td>
                   <span id="span1" style="font-size:11pt" runat="server" visible="false">परिवर्तित्त यूनिकोडे टेक्स्ट  </span>
                <span id="span2" style="font-size:10pt;font-family:Verdana" runat="server" visible="false">(Converted Unicode Text)</span>
                
                   
                
                </td>
            <td></td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:TextBox ID="txtUnicode" runat="server" TextMode="MultiLine" ReadOnly="True"
                        BackColor="#EBEBEB" Visible="False" Font-Names="Verdana" Font-Size="12pt" Height="232px"
                        Width="728px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
              <tr>
                <td align="center" colspan="3">
                    <asp:Button ID="btnCopy" OnClientClick="return CopyUniCode()" runat="server"  Text="कॉपी  यूनिकोडे"
                        Width="218px" Font-Names="Verdana" Font-Size="11pt" Visible="false" 
                        ToolTip="Click To Copy Unicode" />
                </td>
               </tr>
           </tr>
        </table>
    </form>
    <script>
    function CopyUniCode()
    {
    copyToClipboard(document.getElementById("txtUnicode").value);
    return false;
    }
    function copyToClipboard(text)
{
    if (window.clipboardData) // IE
    {  
        window.clipboardData.setData("Text", text);
    }
    else
    {  
        unsafeWindow.netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");  
        var  clipboardHelper = Components.classes["@mozilla.org/widget/clipboardhelper;1"].getService(Components.interfaces.nsIClipboardHelper);  
        clipboardHelper.copyString(text);
    }
}
    
    </script>
</body>
</html>
