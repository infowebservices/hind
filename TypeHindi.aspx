<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="TypeHindi.aspx.cs" Inherits="HindiUnicode.test3" %>

<%@ Register Src="Editor.ascx" TagName="Editor" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script>
        if (window.self == window.top) 
            self.location.href = "index.htm?indx=1";
    </script>

    <title>Untitled Page</title>

    <script type="text/javascript" src="https://www.google.com/jsapi?key=ABQIAAAAQjfRAotG1YXq4slrHXtzXBT2yXp_ZAY8_ufC3CFXhHIE1NvwkxSRAMcE7RjLJucHtwY8j-MtXULGLA"></script>
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


        function GetMailAttachmentContentEx() {
            return document.getElementById("transliterateTextarea").value;
        }
  
    </script>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:Editor ID="Editor1" runat="server" />
        <div id="div2" editorcustomcontent="true" contentnumber="2" runat="server">
            <textarea id="transliterateTextarea" name="transliterateTextarea" style="display: none;
                overflow: auto; width: 100%; height: 232px"></textarea>
        </div>
    </div>
    </form>

    <script>
        var txtKurtivID = '<%=Editor1.txtKurti.ClientID%>';
        document.getElementById(txtKurtivID).style.display = "none";
         document.getElementById("transliterateTextarea").style.display = "";
     
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


        $(document).ready(function() {
            $('#tblEditorToolBar').append("<tr><TD></TD><TD><IMG style='CURSOR: pointer' title='यूनिकोडे एडिटर' onclick=OpenEditWindow() src='images/Edit.png' width=26> </TD></tr>"); 
        });
    
     txtUnicodeEditorSource = 'transliterateTextarea';
    </script>

</body>
</html>
