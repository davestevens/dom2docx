define ["dom2docxml", "jquery"], (Dom2DocXML, $) ->
  describe "Dom2DocXML", ->
    describe "Paragraphs", ->
      it "converts '<p>Hello, World!</p>'", ->
        $input = $("<div><p>Hello, World!</p></div>")

        result = new Dom2DocXML($input[0]).convert()

        expected = '<w:body><w:p><w:r><w:t>Hello, World!</w:t></w:r></w:p>
</w:body>'
        expect(result).to.equal(expected)

      context "with line breaks", ->
        it "converts '<p>Hello,<br/>World!</p>'", ->
          $input = $("<div><p>Hello,<br/>World!</p></div>")

          result = new Dom2DocXML($input[0]).convert()

          expected = '<w:body><w:p><w:r><w:t>Hello,</w:t></w:r><w:br/><w:r><w:t>
World!</w:t></w:r></w:p></w:body>'
          expect(result).to.equal(expected)
