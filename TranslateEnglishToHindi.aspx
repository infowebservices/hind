<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="TranslateEnglishToHindi.aspx.cs"
    Inherits="HindiUnicode.TranslateEnglishToHindi" %>

<%@ Register Src="Editor.ascx" TagName="Editor" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script src="https://www.google.com/jsapi?key=ABQIAAAAQjfRAotG1YXq4slrHXtzXBT2yXp_ZAY8_ufC3CFXhHIE1NvwkxSRAMcE7RjLJucHtwY8j-MtXULGLA"></script>

    <script type="text/javascript">
        var isLoadeed = false;
        var doTranslation = false;
        var source;
        var target = "";
        var indx = 0;
        var endIndx = 0;
        var batchSiz = 1000;
        google.load("language", "1");


        function GetNextSentence(startIndex,batchSize,source) {
         
            var endIndex; 
            endIndex = source.lastIndexOf(".",startIndex + batchSize)
            if (endIndex != -1 && endIndex > startIndex)
                return endIndex;
               
            endIndex = source.lastIndexOf(",",startIndex + batchSize)
            if (endIndex != -1 && endIndex > startIndex)
                return endIndex;

            endIndex = source.lastIndexOf(" ",startIndex + batchSize)
            if (endIndex != -1 && endIndex > startIndex)
                return endIndex;

            return startIndex + batchSize;
        }
        
        function initialize() {
            isLoadeed = true;
            source = document.getElementById('hidSourceCode').value;
            TransalteBtn_Click();
        }
        google.setOnLoadCallback(initialize);

        function Transalte(text, sourceLang, targetLang) {
            if (isLoadeed) {
                google.language.translate(text, sourceLang, targetLang, function(result) {
                    ProcessResult(result)
                });
            }
            else
                alert('API is not Loaded');
        }

        function ProcessResult(result) {
            target += result.translation;
            document.getElementById('spnConvertText').innerHTML = target;
            document.getElementById('<%=Editor1.txtUnicode.ClientID%>').value = document.getElementById('spnConvertText').innerHTML;

            if (doTranslation) {
                indx = endIndx;
                TransalteBtn_Click();
            }
            else {
                document.getElementById("imgLoading").style.display = "none";
            }
        }

        function TransalteBtn_Click() {
            if (!doTranslation)
                return;
     
            if (indx + batchSiz > source.length) {
                doTranslation = false;
                Transalte(source.substring(indx), "en", "hi");

            }
            else {
                endIndx = GetNextSentence(indx, batchSiz, source);
                endIndx++;
                Transalte(source.substring(indx, endIndx), "en", "hi");
            }
            return false;
        } 
    
    </script>

    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:Editor ID="Editor1" runat="server" />
        <asp:HiddenField ID="hidSourceCode" runat="server" EnableViewState="False" />
        <span id="spnConvertText" style="display: none"></span><span id="imgLoading" style="border: solid 1;
            position: absolute; top: 200px; left: 200px;" runat="server">
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
        <div id="div2" editorcustomcontent="true" contentnumber="2" runat="server">
            <textarea id="transliterateTextarea" name="transliterateTextarea" style="overflow: auto;
                width: 100%; height: 232px"></textarea>
        </div>
    </div>
    </form>
</body>
</html>
