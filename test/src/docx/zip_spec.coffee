define ["docx/zip"], (DocxZip) ->
  describe "DocxZip", ->
    create_docx_zip = -> new DocxZip()

    describe "#create", ->
      it "creates a Zip based on the passes Manifest", ->
        manifest =
          directories:
            "foo":
              files:
                 "bar": "content"
        docx_zip = create_docx_zip()

        result = docx_zip.create(manifest)

        expect(result.files["foo/"]).to.exist
        expect(result.files["foo/bar"]).to.exist

    describe "#generate", ->
      it "returns a File Blob of the created Zip", ->
        docx_zip = create_docx_zip()

        result = docx_zip.generate()

        expect(result).to.be.an.instanceOf(Blob)
