<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnglishToHindi.aspx.cs" Inherits="HindiUnicode.EnglishToHindi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

   <link rel="stylesheet" href="Style/style.css" type="text/css" media="screen">
  
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
      
      
  
    </script>

    <title>कुरूति देव से यूनिकोडे </title>
   
</head>
<body>
    <form id="form1" runat="server">
    <div>
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
    </form>
  <script>
      function ResizeFrame()
    {
    window.parent.ResizeChild(document.body.offsetHeight+20,document.body.offsetWidth,"ifrmTab2");
    }
    
    ResizeFrame();  
    </script>
</body>
</html>
