define (require) ->
  files:
    "[Content_Types].xml": require("text!docx/skeleton/[Content_Types].xml")
  directories:
    "_rels":
      files:
        ".rels": require("text!docx/skeleton/_rels/_rels")
    "docProps":
      files:
        "app.xml": require("text!docx/skeleton/docProps/app.xml")
        "core.xml": require("text!docx/skeleton/docProps/core.xml")
    "word":
      files:
        "document.xml": null
        "fontTable.xml": require("text!docx/skeleton/word/fontTable.xml")
        "numbering.xml": require("text!docx/skeleton/word/numbering.xml")
        "settings.xml": require("text!docx/skeleton/word/settings.xml")
        "styles.xml": require("text!docx/skeleton/word/styles.xml")
        "stylesWithEffects.xml":
          require("text!docx/skeleton/word/stylesWithEffects.xml")
        "webSettings.xml": require("text!docx/skeleton/word/webSettings.xml")
      directories:
        "_rels":
          files:
            "document.xml.rels":
              require("text!docx/skeleton/word/_rels/document.xml.rels")
        "theme":
          files:
            "theme1.xml": require("text!docx/skeleton/word/theme/theme1.xml")
