<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HindiToEnglish.aspx.cs"
    Inherits="HindiUnicode.HindiToEnglish" EnableViewState="false" EnableSessionState="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript">
      function createPopUp(popUpCode)
{
	var div = document.createElement('div');
	
	div.innerHTML = popUpCode;
	document.body.appendChild(div.firstChild);
}

var divPopUpWin = null;
function ShowEmailPopUp()
{

var pop ='<div id ="divPopUp" class="popUp"><iframe src="SendEmail.aspx" scrolling="no" height="130px" width="470px" ></iframe></div>';

createPopUp(pop);
return false;
}


function ClosePopUp()
{
var div = document.getElementById("divPopUp");
div.parentNode.removeChild(div);
}

    </script>

    <title>कुरूति देव से यूनिकोडे </title>
    <link rel="stylesheet" href="Style/style.css" type="text/css" media="screen">
</head>
<body>
    <form id="form1" runat="server">
    <!--div class="fileinputs">
	<input type="file" class="file" />
	<div class="fakefile">
		<input/>
		<div>Brrowse</div>
		<img src="search.gif" />
	</div>
</div-->
    <table width="100%">
        <tr id="trKurti1">
            <td align="center">
                <div class="panel">
                    <table width="100%">
                        <tr>
                            <td style="width: 70%" align="left">
                                <span class="UniCodeFont">पेस्ट या टाइप करे कुरूति देव फॉण्ट टेक्स्ट </span><span
                                    style="font-size: 10pt; font-family: Verdana">(Past or Type Text in Kruti Dev)</span>
                            </td>
                            <td align="right" style="width: 30%">
                                <img onclick="CollapaseExpand(document.getElementById('tblKurti'),this)" id="imgCEKurti"
                                    runat="server" src="images/collapse.png" height="15" width="15" />
                            </td>
                            <tr>
                                <td colspan="2" align="center" style="width: 100%">
                                    <table id="tblKurti" style="width: 95%" runat="server">
                                        <tr id="trKurti2">
                                            <td align="center" style="width: 100%">
                                                <asp:TextBox ID="txtKurti" runat="server" TextMode="MultiLine" CssClass="KurtiFont"
                                                    Height="232px" Style="overflow: auto; width: 100%" BorderColor="White" BorderStyle="Solid"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="cursor: pointer">
                                                <div class="panel">
                                                    <table width="100%">
                                                        <tr>
                                                            <td style="width: 70%;" class="UniCodeFont" align="left">
                                                                कुरूति देव कीबोर्ड
                                                            </td>
                                                            <td align="right" style="width: 30%">
                                                                <img id="imgCEKeyBoard" onclick="ShowHideKeyBoard('imgCEKeyBoard')" src="images/collapse.png"
                                                                    height="15" width="15" />
                                                            </td>
                                                        </tr>
                                                        <tr id="trKurtiKeyBoard" style="display: none">
                                                            <td colspan="2" align="center">
                                                                <img src="images/HINDI_FONT_KRUTI_DEV_10.jpg" />
                                                                <a style="position: relative; color: Fuchsia; left: -140px; top: -50px" href="k010.ttf">
                                                                    Download Kurti Font </a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="UniCodeFont">
                                                या
                                                <!--div style="" class="errorMsg" id="divErrorMsg UniCodeFont">
                    अवैध फ़ाइल<br />
                    केवल .docx या .txt फ़ाइलें स्वीकार किए जाते हैं<img src="images/close.jpg" style="height:10px;width:10px" />
                </div-->
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="UniCodeFont">
                                                अपलोड फाइल &nbsp;&nbsp;
                                                <asp:FileUpload ID="FileUpload1" Style="width: 400px;" runat="server" />
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <br />
                                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="परिवर्तित्त करे यूनिकोडे में"
                                                    Width="230px" Visible="true" CssClass="btn UniCodeFont" ToolTip="Click to Convert to Unicode" />
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <div id="divUniCode" runat="server" class="panel">
        <table width="100%">
            <tr>
                <td>
                    <span id="span3" class="UniCodeFont" runat="server">परिवर्त यूनिकोडे टेक्स्ट </span>
                    <span id="span4" style="font-size: 10pt; font-family: Verdana" runat="server">(Converted
                        Unicode Text) </span>
                </td>
                <td align="right" style="width: 30%">
                    <img onclick="CollapaseExpand(document.getElementById('tblUniCode'),document.getElementById('img3'))"
                        id="img3" src="images/collapse.png" height="15" width="15" />
                </td>
            </tr>
        </table>
        <table id="tblUniCode" runat="server" width="100%">
            <tr>
                <td align="center" style="width: 100%">
                    <asp:TextBox ID="txtUnicode" runat="server" TextMode="MultiLine" BackColor="Gray"
                        Visible="False" Font-Names="Verdana" ReadOnly="true" Font-Size="11pt" Height="232px"
                        Style="cursor: default; overflow: auto; width: 98%" ForeColor="White" BorderColor="Gray"
                        BorderStyle="Solid"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                    <asp:Button ID="btnDownload" CssClass="btn UniCodeFont" Style="width: 200px" runat="server"
                        OnClick="btnDownload_Click" Text="डाउनलोड" />
                    <asp:Button ID="btnSendEmail" CssClass="btn UniCodeFont" Style="width: 200px" runat="server"
                        Text="ईमेल भेजे " OnClientClick="return ShowEmailPopUp()" />
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    </div>

    <script>
    
    function ShowHideKeyBoard(imgObj)
    {
   // debugger;
        CollapaseExpand(document.getElementById("trKurtiKeyBoard"),document.getElementById(imgObj));
    stopPropagation(event);
    }
    
    function stopPropagation(e)
{
 
    e.stopPropagation? e.stopPropagation() : e.cancelBubble = true;
}
    
    function CollapaseExpand(obj,imgObj)
   {
    if(obj.style.display == "none")
    {
    obj.style.display = ""
    imgObj.src = "images/Expand.png";
    }
    else
    {
    obj.style.display = "none";
    imgObj.src = "images/collapse.png";
    }
  ResizeFrame();
   }
    function Test()
    {
    var bj = document.getElementById("FileUpload1");
    bj.click();
    }
    
    
    function ResizeFrame()
    {
    window.parent.ResizeChild(document.body.offsetHeight+20,document.body.offsetWidth,"ifrmTab3");
    }
    
    ResizeFrame();
    </script>

    <asp:HiddenField ID="hidSourceCode" runat="server" EnableViewState="False" />
    </form>
</body>
</html>
