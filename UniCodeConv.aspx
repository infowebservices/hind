<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UniCodeConv.aspx.cs" Inherits="HindiUnicode.UniCodeConv"
    EnableViewState="false" EnableSessionState="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <script type="text/javascript" src="JavaScript/tabber.js"></script>

    <link rel="stylesheet" href="Style/example.css" type="text/css" media="screen">

    <script type="text/javascript" src="https://www.google.com/jsapi?key=ABQIAAAAQjfRAotG1YXq4slrHXtzXBT2yXp_ZAY8_ufC3CFXhHIE1NvwkxSRAMcE7RjLJucHtwY8j-MtXULGLA">
    </script>

    <script type="text/javascript">

      // Load the Google Transliterate API
      google.load("elements", "1", {
            packages: "transliteration"
          });

      function onLoad() {
        var options = {
            sourceLanguage:
                google.elements.transliteration.LanguageCode.ENGLISH,
            destinationLanguage:
                [google.elements.transliteration.LanguageCode.HINDI],
            shortcutKey: 'ctrl+g',
            transliterationEnabled: true
        };

        // Create an instance on TransliterationControl with the required
        // options.
        var control =
            new google.elements.transliteration.TransliterationControl(options);

        // Enable transliteration in the textbox with id
        // 'transliterateTextarea'.
        control.makeTransliteratable(['transliterateTextarea']);
      }
      google.setOnLoadCallback(onLoad);
      
      
      function createPopUp(popUpCode)
{
	var div = document.createElement('div');
	
	div.innerHTML = popUpCode;
	document.body.appendChild(div.firstChild);
}

var divPopUpWin = null;
function ShowEmailPopUp()
{

var pop ='<div id ="divPopUp" class="popUp"><iframe src="SendEmail.aspx" height="100px" width="400px" ></iframe></div>';

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
    <style>
        .KurtiFont
        {
            font-family: 'Kruti Dev 010';
            font-size: 18px;
        }
        .test
        {
            border-right: #555555 2px solid;
            border-top: #555555 2px solid;
            border-left: #555555 2px solid;
            border-bottom: #555555 2px solid;
            background-color: #3e3e3e;
        }
        .btn
        {
            border-right: #131313 1px solid;
            background-position: left top;
            border-top: #131313 1px solid;
            font-weight: normal;
            font-size: 12px;
            background-image: url(images/btn.png);
            border-left: #131313 1px solid;
            color: #cccccc;
            border-bottom: #131313 1px solid;
            background-repeat: repeat-x;
            font-style: normal;
            font-family: Verdana, sans-serif;
            background-color: #131313;
            text-decoration: none;
        }
        .topmenuSele
        {
            border-right: #666 2px solid;
            border-top: #666 2px solid;
            background: #3e3e3e;
            border-left: #666 2px solid;
            color: #ccc;
            border-bottom: #3e3e3e 2px solid;
        }
        .myText
        {
            border-left-width: 0px;
            border-right-width: 0px;
            border-top-width: 1px;
            border-top-color: DodgerBlue;
            border-top-style: solid;
            border-bottom-width: 1px;
            border-bottom-color: DodgerBlue;
            border-bottom-style: solid;
            overflow: auto;
        }
        .popUp
        {
            position: absolute;
            top: 300px;
            left: 200px;
            text-align: center;
        }
    </style>
</head>
<body bgcolor="black" style="font-size: 10pt; font-family: Verdana; color: White">
    <form id="form1" runat="server">
    <table width="100%">
        <tr>
            <td align="center" width="100%">
                <span style="font-size: 24pt; color: Gray; display: ">ॐ</span>
            </td>
            <td>
                <a href="" style="color: White">Help</a>&nbsp;
            </td>
            <td>
                <a href="" style="color: White">Home</a>
            </td>
        </tr>
    </table>
    <div style="display: none" id="divErrorMsg">
        Invalid File<img src="images/close.jpg" style="height: 22px" />
    </div>
    <div class="tabber" style="margin-left: -8px">
        <div class="tabbertab" style="background: #3e3e3e">
            <h2>
                <pre>   कुरूति देव  </pre>
            </h2>
            <table width="100%">
                <tr id="trKurti1">
                    <td align="center">
                        <div  style="width:100% border: #555 1px solid; cursor: pointer;
                            background: url(http://images2.cambridgeincolour.com/buttons/newbtn_middle.png) #2e2e2e repeat-x">
                           
                            <table  width="100%">
                                <tr>
                                    <td style="width: 70%" align="left">
                                        <span style="font-size: 11pt">पेस्ट या टाइप करे कुरूति देव फॉण्ट टेक्स्ट </span>
                                        <span style="font-size: 10pt; font-family: Verdana">(Past or Type Text in Kruti Dev)</span>
                                    </td>
                                    <td align="right" style="width: 30%">
                                        <img onclick="CollapaseExpand(document.getElementById('tblKurti'),document.getElementById('img1'))" id="img1" src="images/collapse.png" />
                                    </td>
                                   <tr>
                                   <td colspan="2">
                                   <table id="tblKurti">
                                    <tr id="trKurti2">
                    <td align="left">
                        <asp:TextBox ID="txtKurti" runat="server" TextMode="MultiLine" CssClass="KurtiFont"
                            Height="232px" Style="overflow: auto;" BorderColor="White" BorderStyle="Solid"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <div onclick="ShowHideKeyBoard('imgCEKeyBoard')" style="border: #555 1px solid; cursor: pointer;
                            background: url(http://images2.cambridgeincolour.com/buttons/newbtn_middle.png) #2e2e2e repeat-x">
                            <table width="100%">
                                <tr>
                                    <td style="width: 70%" align="left">
                                        Show Kurti Dev KeyBoard
                                    </td>
                                    <td align="right" style="width: 30%">
                                        <img id="imgCEKeyBoard" src="images/collapse.png" />
                                    </td>
                                </tr>
                                <tr id="trKurtiKeyBoard" style="display: none">
                                    <td colspan="2">
                                        <img src="images/HINDI_FONT_KRUTI_DEV_10.jpg" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr id="trKurti3">
                    <td align="center">
                        OR
                    </td>
                </tr>
                <tr id="trKurti3">
                    <td align="center">
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="600px" />
                    </td>
                </tr>
                <tr id="trKurti3">
                    <td align="center">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="परिवर्तित्त करे यूनिकोडे में"
                            Width="219px" Visible="true" CssClass="btn" Font-Names="Verdana" Font-Size="12pt"
                            ToolTip="Click to Convert to Unicode" />
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
              <div onclick="CollapaseExpand(document.getElementById('tblKurti'),document.getElementById('img1'))" style="width:100% border: #555 1px solid; cursor: pointer;
                            background: url(http://images2.cambridgeincolour.com/buttons/newbtn_middle.png) #2e2e2e repeat-x">
                          
            <table>
                <tr id="trUniCod1">
                    <td>
                        <span id="span1" style="font-size: 11pt" runat="server" visible="false">परिवर्त यूनिकोडे
                            टेक्स्ट </span><span id="span2" style="font-size: 10pt; font-family: Verdana" visible="false"
                                runat="server">(Converted Unicode Text) </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtUnicode" runat="server" TextMode="MultiLine" BackColor="Gray"
                            Visible="False" Font-Names="Verdana" Font-Size="11pt" Height="232px" Width="728px"
                            Style="cursor: default; overflow: auto;" ForeColor="White" BorderColor="#F84E1D"
                            BorderStyle="Solid"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="btnCopy" OnClientClick="return CopyUniCode()" runat="server" Text="कॉपी  यूनिकोडे"
                            Width="218px" Font-Names="Verdana" Font-Size="10pt" Visible="false" ToolTip="Click To Copy Unicode" />
                        <asp:Button ID="btnDownload" runat="server" OnClick="btnDownload_Click" Text="Download" />
                        <asp:Button ID="btnSendEmail" runat="server" Text="Send Email" OnClientClick="return ShowEmailPopUp()" />
                    </td>
                </tr>
                </tr>
            </table>
            </div>
        </div>
        <div class="tabbertab" style="background: #3e3e3e">
            <h2>
                <pre>  इंग्लिश </pre>
            </h2>
            <div id="divGoogle">
                <table>
                    <tr>
                        <td style="width: 100px">
                            &nbsp;
                        </td>
                        <td>
                            <br>
                            Type a word in English and press SPACE to transliterate.
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <textarea style="height: 232px; width: 728px; overflow: auto;" id="transliterateTextarea"></textarea>
                            <br />
                            <br />
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
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
    
    
    function Init()
    {
   
    //document.getElementById("txtKurti").style.width = document.body.clientWidth + 10;
       document.getElementById("txtKurti").style.width = document.body.clientWidth-10 + "px";
       document.getElementById("txtKurti").style.marginLeft  =5;
       document.getElementById("transliterateTextarea").style.width = document.body.clientWidth-20 + "px";
       document.getElementById("transliterateTextarea").style.marginLeft  =5;

       if( document.getElementById("txtUnicode") !=null)
       {
       document.getElementById("txtUnicode").style.width = document.body.clientWidth-20 + "px";
       document.getElementById("txtUnicode").style.marginLeft  =5;
       }
      
    }
   
   
    Init();   
    
    //=====================================================================
    
    function ShowHideKeyBoard(imgObj)
    {
   // debugger;
        CollapaseExpand(document.getElementById("trKurtiKeyBoard"),document.getElementById(imgObj));
    stopPropagation(event);
    }
    
    function stopPropagation(e)
{
 //   e = e¦¦event;/* get IE event ( not passed ) */
 
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
   }
    
    
    
    </script>

</body>
</html>
