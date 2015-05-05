<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="TranslateHindiToEnglish.aspx.cs"
    Inherits="HindiUnicode.TranslateHindiToEnglish" %>

<%@ Register Src="Editor.ascx" TagName="Editor" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>

    <script src="https://www.google.com/jsapi?key=ABQIAAAAQjfRAotG1YXq4slrHXtzXBT2yXp_ZAY8_ufC3CFXhHIE1NvwkxSRAMcE7RjLJucHtwY8j-MtXULGLA"></script>

    <script type="text/javascript" src="https://www.google.com/jsapi?key=ABQIAAAAQjfRAotG1YXq4slrHXtzXBT2yXp_ZAY8_ufC3CFXhHIE1NvwkxSRAMcE7RjLJucHtwY8j-MtXULGLA">
    </script>

    <script type="text/javascript">
        var isLoadeed = false;
        var doTranslation = false;
        var source;
        var target = "";
        var indx = 0;
        var batchSiz = 200;
        var endIndx = 0;
        google.load("language", "1");

        function GetNextSentence(startIndex, batchSize, source) {

            var endIndex;
            endIndex = source.lastIndexOf(".", startIndex + batchSize)
            if (endIndex != -1 && endIndex > startIndex)
                return endIndex;

            endIndex = source.lastIndexOf(",", startIndex + batchSize)
            if (endIndex != -1 && endIndex > startIndex)
                return endIndex;

            endIndex = source.lastIndexOf(" ", startIndex + batchSize)
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
                Transalte(source.substring(indx), "hi", "en");
            }
            else {
                endIndx = GetNextSentence(indx, batchSiz, source);
                endIndx++;
                Transalte(source.substring(indx,endIndx), "hi", "en");
            }
          
            return false;
        } 
    
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
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:Editor ID="Editor1" runat="server" />
        <span id="spnConvertText" style="display: none"></span>
        <asp:HiddenField ID="hidSourceCode" runat="server" EnableViewState="False" />
        <span id="imgLoading" style="border:solid 1;  position: absolute; top: 200px; left: 200px;" runat="server">
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
        <div id="div1" editorcustomcontent="true" contentnumber="1" runat="server">
            चयन करें
            <select id="langOption" name="langOption" onchange="LangChange(this)">
                <option value="K">कुरूति देव में टाइप करे </option>
                <option value="E">अंग्रेजी में टाइप करें हिन्दी </option>
            </select>
        </div>
        <div id="div2" editorcustomcontent="true" contentnumber="2" runat="server">
            <textarea id="transliterateTextarea" name="transliterateTextarea" style="display: none;
                overflow: auto; width: 100%; height: 232px"></textarea>
        </div>
    </form>

    <script>
        var txtKurtivID = '<%=Editor1.txtKurti.ClientID%>';
        function LangChange(objSelect) {
            if (objSelect.value == "E") {
                document.getElementById(txtKurtivID).style.display = "none";
                document.getElementById("transliterateTextarea").style.display = "";
            }
            else {
                document.getElementById(txtKurtivID).style.display = "";
                document.getElementById("transliterateTextarea").style.display = "none";
            }
        }

        function ZoomFontEx(out) {
            var obj = document.getElementById("transliterateTextarea");
            var size = parseInt(obj.style.fontSize.substring(0, 2));
            if (out)
                size -= 2;
            else
                size += 2;

            if (size <= 10 || size > 96) {
                return false;
            }

            obj.style.fontSize = size + "px";
        }

        function RefreshEx() {
            document.getElementById("transliterateTextarea").value = "";
        }


        function ConvertToEnglish() {
            var objSelect = document.getElementById("langOption")
            if (objSelect.value == "E") {
                document.getElementById("<%=Editor1.divUniCode.ClientID%>").style.display = "";
                document.getElementById(txtKurtivID).value = document.getElementById("transliterateTextarea").value;
            }

            return true;
        }
        
    </script>

</body>
</html>
