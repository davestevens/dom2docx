# dom2docx.js

Tool for creating Microsoft Word docx (OpenXML) document in the Browser.
Pass a dom element to produce a .docx file of your dom elements.
A default style is defined but this can be customised by passing in a custom
styles.xml file. (See `Customizing Styles` section below)

Currently supported Dom elements:
Paragraph (p), Bold (b), Strong (strong), Italic (i), Emphasis (em),
Underline (u), Inserted (ins), Small (small), Strikethough (strike),
Deleted (del), Superscript (sup), Subscript (sub), Highlighted (mark),
Headings (h1-h6), Line Break (br)
Unordered List (ul), List Item (li)
Description List (dl), Description Term (dt), Description Description (dd)

## Usage

See http://davestevens.github.io/dom2docx/ for example

### Convert dom element to .docx File
```
// Include dom2docx.js
<script src="dist/dom2docx.min.js"></script>

// #input element in dom contains data which is to be converted to .docx
input = document.getElementById("input")

// Create instance on Dom2Docx
dom2docx = new Dom2Docx(input)

// Creates the dom to a File Blob object
docx = dom2docx.create()

// you can use `URL.createObjectURL` to create
link = document.createElement("a")
link.href = (window.URL || window.webkitURL).createObjectURL(docx)
link.download = "example.docx"
link.textContent = "Download File"
document.body.appendChild(link)

// Using FileSaver (see vendor/FileSaver.js)
// include FileSave.js
saveAs(docx, "example.docx")
```

## Customizing Styles
TODO

## Development
`npm install`

`make all` to generate all `.js` files

`make watch-all` to watch all `.coffee` files and convert to `.js` when changed

You can then use `require("src/dom2docx")` or build a js file to include in a
page (see `Compilation` section)

## TODO
- Styles
 - [ ] Tables
 - [ ] Forms
- [x] Example Usage
- [x] gh-pages
- [ ] How to Replace Styles

## Compilation
`node run build-js`
Create a minified javascript file: `dist/dom2docx.min.js`

`node run build-js-dev`
Create a javascript file: `dist/dom2docx.js`

## Tests

### Command Line
`npm test`
Runs tests with `mocha-phantomjs`

### Browser
`node run test-server`
Go to `http://0.0.0.0:8081/test` in a browser
