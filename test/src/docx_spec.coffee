define ["dom2docx"], (Dom2Docx) ->
  describe "Dom2Docx", ->
    describe "#create", ->
      it "returns a File Blob", ->
        input = document.createElement("div")
        docx = new Dom2Docx(input).create()

        expect(docx).to.be.an.instanceOf(Blob)
