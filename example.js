create = document.getElementById("create");

create.addEventListener("click", function() {
  // #input element in dom contains data which is to be converted to .docx
  input = document.getElementById("input");

  // Create instance on Dom2Docx
  dom2docx = new Dom2Docx(input);

  // Creates the dom to a File Blob object
  docx = dom2docx.create();

  // you can use `URL.createObjectURL` to create
  link = document.createElement("a");
  link.href = (window.URL || window.webkitURL).createObjectURL(docx);
  link.download = "example.docx";
  link.textContent = "Download File";
  document.getElementById("js-create").appendChild(link);

  // Using FileSaver
  saveAs(docx, "example.docx");
});
