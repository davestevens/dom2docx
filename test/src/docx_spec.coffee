define ["docx"], (Docx) ->
  describe "Docx", ->
    describe "#create", ->
      it "returns a File Blob", ->
        input = document.createElement("div")
        docx = new Docx(input).create()

        expect(docx).to.be.an.instanceOf(Blob)
