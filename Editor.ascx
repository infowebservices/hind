<%@ Control Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="Editor.ascx.cs"
    Inherits="HindiUnicode.Editor" %>
<link rel="stylesheet" href="Style/style.css" type="text/css" media="screen">

<script type="text/javascript" src="JavaScript/Util.js"></script>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>

<script type="text/javascript">

    var tblKurtiID = '<%=tblKurti.ClientID%>';
    var tblUniCodeID = '<%=tblUniCode.ClientID%>';
    var isConvertClicked = false;
    var zoomObject1;

    function SetZoomObject1(obj) {
        zoomObject1 = obj;
    }

    function createPopUp(popUpCode) {
        var div = document.createElement('div');

        div.innerHTML = popUpCode;

        document.body.appendChild(div.firstChild);
    }

    var divPopUpWin = null;
    function ShowEmailPopUp() {
        if (!IsWindowExist()) {
            var pop = '<div id ="divPopUp" style="position:absolute;top:240px;left:230px;">' + CreateMessageFrame("SendEMail.aspx", "ईमेल भेजे", "90px", "430px") + '</div>';
            createPopUp(pop);
        }
        return false;
    }

    function ClosePopUp() {
        var div = document.getElementById("divPopUp");
        div.parentNode.removeChild(div);
    }


    function ZoomFont1(out) {

        var size = parseInt(zoomObject1.style.fontSize.substring(0, 2));
        if (out)
            size -= 2;
        else
            size += 2;

        if (size <= 10 || size > 96) {
            return false;
        }

        zoomObject1.style.fontSize = size + "px";

        try {
            ZoomFontEx(out);
        }
        catch (ex) { }

    }

    function Refresh() {
        try {
            var objTxt = document.getElementById('<%=txtKurti.ClientID%>');
            objTxt.value = "";
        }
        catch (ex) { }

        try {
            RefreshEx();
        }
        catch (Ex) { }

    }

    function CopyUniCode() {
        copyToClipboard(document.getElementById("txtUnicode").value);
        return false;
    }
    function copyToClipboard(text) {
        if (window.clipboardData) // IE
        {
            window.clipboardData.setData("Text", text);
        }
        else {
            unsafeWindow.netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            var clipboardHelper = Components.classes["@mozilla.org/widget/clipboardhelper;1"].getService(Components.interfaces.nsIClipboardHelper);
            clipboardHelper.copyString(text);
        }
    }

    function ShowHideKeyBoard(imgObj) {
        CollapaseExpand(document.getElementById("trKurtiKeyBoard"), document.getElementById(imgObj));
        stopPropagation(event);
    }

    function stopPropagation(e) {

        e.stopPropagation ? e.stopPropagation() : e.cancelBubble = true;
    }

    function CollapaseExpand(obj, imgObj) {
        if(imgObj == null)
        return;
        
        if (obj.style.display == "none") {
            obj.style.display = ""
            imgObj.src = "images/Expand.png";
        }
        else {
            obj.style.display = "none";
            imgObj.src = "images/collapse.png";
        }
        ResizeFrame();
    }
    function Test() {
        var bj = document.getElementById("FileUpload1");
        bj.click();
    }

    function ResizeFrame() {
        try {
            window.parent.ResizeChild(document.body.offsetHeight + 40, document.body.offsetWidth, window.name);
        }
        catch (ex) { }
    }

    function GetMailAttachmentContent() {

        if (typeof (GetMailAttachmentContentEx) != "undefined") {
            return GetMailAttachmentContentEx();
        }
        else {
            return document.getElementById("<%=txtUnicode.ClientID%>").value;
        }
    }

    function GetMailSubject() {

        if (typeof (GetMailSubjectEx) != "undefined") {
            return GetMailSubjectEx();
        }
        else {
            return "infowebservices/Converted Text";
        }
    }

    function GetMailBody() {

        if (typeof (GetMailBodyEx) != "undefined") {
            return GetMailBodyEx();
        }
        else {
            return "PFA is converted file";
        }
    }
    
    
</script>

<table width="100%">
    <tr>
        <td>
            <div class="panel">
                <table width="100%">
                    <tr>
                        <td>
                            <table width="100%">
                                <tr id="trKurtiHeading" onclick="CollapaseExpand(document.getElementById(tblKurtiID),document.getElementById('<%=imgCEKurti.ClientID%>'))" >
                                    <td style="width: 70%" align="left">
                                        <%=Panel1Heading%>
                                    </td>
                                    <td align="right" style="width: 30%">
                                        <img id="imgCEKurti"
                                            runat="server" src="images/collapse.png" height="15" width="15" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="width: 100%">
                            <table id="tblKurti" style="width: 100%" runat="server">
                                <tr>
                                    <td align="center">
                                        <%=CustomContent1%>
                                    </td>
                                </tr>
                                <tr id="trKurti2">
                                    <td align="center" style="width: 100%">
                                        <asp:TextBox ID="txtKurti" Font-Size="18px" runat="server" TextMode="MultiLine" Height="232px"
                                            Style="overflow: auto; width: 100%" BorderColor="White" BorderStyle="Solid"></asp:TextBox>
                                        <%=CustomContent2%>
                                    </td>
                                    <td align="right">
                                        <table id="tblEditorToolBar">
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <img title="फ़ॉन्ट का आकार बड़ा करे" class="btn" onclick="ZoomFont1(false)" src="images/zoomin.jpg"
                                                        style="height: 23px; width: 23px">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <img title="फ़ॉन्ट का आकार छोटे करे" class="btn" onclick="ZoomFont1(true)" src="images/zoomout.jpg"
                                                        style="height: 23px; width: 23px">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <img title="रिफ्रेश करे" class="btn" onclick="Refresh('txtKurti')" src="images/refresh.png"
                                                        style="height: 23px; width: 23px">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr id="trKrutiKeyBaordContainer" runat="server">
                                    <td align="center" style="cursor: pointer">
                                        <div class="panel">
                                            <table width="100%">
                                                <tr onclick="ShowHideKeyBoard('imgCEKeyBoard')" style="cursor:pointer">
                                                    <td style="width: 70%;" class="UniCodeFont" align="left">
                                                        कुरूति देव कीबोर्ड
                                                    </td>
                                                    <td align="right" style="width: 30%">
                                                        <img id="imgCEKeyBoard"  src="images/collapse.png"
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
                                <tr id="trUploadFileContainer" runat="server">
                                    <td>
                                        <br />
                                        <table width="100%">
                                            <tr>
                                                <td align="center" class="UniCodeFont">
                                                    अपलोड फाइल (केवल .doc और .docx फाइल)&nbsp;&nbsp;
                                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                                    <br />
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <br />
                                        <asp:Button ID="btnConvertToUnicode" runat="server" OnClientClick="return BtnConvertClick()"
                                            OnClick="btnConvertToUnicode_Click" Text="परिवर्तित्त करे यूनिकोडे में" Width="230px"
                                            Visible="true" CssClass="btn UniCodeFont" ToolTip="Click to Convert to Unicode" />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            <div id="divUniCode" runat="server" class="panel">
                <table width="100%">
                    <tr>
                        <td>
                            <table width="100%">
                                <tr id="trUnicodeHeading" style="cursor:pointer" onclick="CollapaseExpand(document.getElementById(tblUniCodeID),document.getElementById('imgColExUnicode'))">
                                    <td>
                                        <%=Panel2Heading%>
                                    </td>
                                    <td align="right" style="width: 30%">
                                        <img id="imgColExUnicode" src="images/collapse.png" height="15" width="15" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table id="tblUniCode" runat="server" width="100%">
                                <tr>
                                    <td align="center" style="width: 100%">
                                        <asp:TextBox ID="txtUnicode" runat="server" TextMode="MultiLine" BackColor="Gray"
                                            ReadOnly="true" Font-Size="11pt" Height="232px" Style="cursor: default; overflow: auto;
                                            width: 98%" ForeColor="White" BorderColor="Gray" BorderStyle="Solid"></asp:TextBox>
                                    </td>
                                    <td>
                                        <img src="images/Edit.png" id="imgUnicodeEditor" runat="server" onclick="OpenEditWindow()"
                                            style="cursor: pointer;" title="यूनिकोडे एडिटर" width="26" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
    <!-- Temp Fix has to remove -->
    <%if (displayDownloadBtn)
      { %>
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
    <%} %>
</table>

<script>
    ResizeFrame();
    SetZoomObject1(document.getElementById('<%=txtKurti.ClientID%>'));

    var txtUnicodeEditorSource = '<%=txtUnicode.ClientID%>';

    function GetEditorText() {
        //debugger;
        //if ($('#<%=txtUnicode.ClientID%>').length !=0 && $("#<%=txtUnicode.ClientID%>").is(":visible"))
        //  return $("#<%=txtUnicode.ClientID%>").val();

        //return $("#transliterateTextarea").val();

        return $('#' + txtUnicodeEditorSource).val();

    }

    function SetEditorText(text) {
        //    if ( $('#<%=txtUnicode.ClientID%>').length !=0 && $("#<%=txtUnicode.ClientID%>").is(":visible")){
        //        $("#<%=txtUnicode.ClientID%>").val(text);
        //    }
        //    else{
        //    $("#transliterateTextarea").val(text);
        //    }

        $('#' + txtUnicodeEditorSource).val(text);

    }

    function OpenEditWindow() {
        var w = 900;
        var h = 620;
        var left = (screen.width / 2) - (w / 2);
        var top = ((screen.height / 2) - (h / 2)) - 30;
        //var win = window.open('UnicodeEditor.aspx','','toolbar=0,resizable=0,scrollbars=0,status=0,menubar=0,width='+w+',height='+h+',top='+top +',left='+ left);
        var win = window.open('UnicodeEditorEx.aspx', '', 'toolbar=0,resizable=0,scrollbars=0,status=0,menubar=0,width=' + w + ',height=' + h + ',top=' + top + ',left=' + left);
    }


    function BtnConvertClick() {
        if (!isConvertClicked) {
            isConvertClicked = true;
            return true;
        }
        else
            return false;
    }

    function Init() {
        try {
         
         if (document.getElementById('<%=imgCEKurti.ClientID%>')!= null){
          document.getElementById('trKurtiHeading').style.cursor = "pointer";
         }
            var objTxt = document.getElementById('<%=txtKurti.ClientID%>');
            //objTxt.value = decode64(objTxt.value);
            objTxt.value = unescape(objTxt.value);
            objTxt.focus();
        }
        catch (ex) {
        }
    }


    document.forms[0].onsubmit = function () {
        var objTxt = document.getElementById('<%=txtKurti.ClientID%>');
        // objTxt.value = encode64(objTxt.value);
        objTxt.value = escape(objTxt.value);
        setTimeout("UnEscapeDownLoadClicked()", 2000);
        return true;
    }


    function getParentDomain() {
        try {
            var topUrl = top.location.href;
            if (topUrl.indexOf("infowebservice.in") > 0) {

            }
        }
        catch (err) {
        }
    }



    function UnEscapeDownLoadClicked() {
        var objTxt = document.getElementById('<%=txtKurti.ClientID%>');
        objTxt.value = unescape(objTxt.value);
    }

    try {
        if (window.parent.latestDate != "23Sep2012") {
            alert("Trying to get latest version of this page. If you keep getting this message, then please remove your temporary browser files to avoid this problem");
            window.parent.location.href = "index.htm";
        }
    }
    catch (ex) {
        alert("Trying to get latest version of this page. If you keep getting this message. Than please remove your temporary browser files to avoid this problem");
        window.parent.location.href = "index.htm";
    }
    Init();
</script>

