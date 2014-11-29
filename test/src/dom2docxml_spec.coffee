define ["dom2docxml", "jquery"], (Dom2DocXML, $) ->
  describe "Dom2DocXML", ->
    describe "#convert", ->
      it "returns a DocXML string of the passed Dom", ->
        dom = $("<div><p>Hello, World!</p></div>")

        result = new Dom2DocXML($(dom)[0]).convert()

        expected_docx_string =
          '<w:body><w:p><w:r><w:t>Hello, World!</w:t></w:r></w:p></w:body>'
        expect(result).to.equal(expected_docx_string)
