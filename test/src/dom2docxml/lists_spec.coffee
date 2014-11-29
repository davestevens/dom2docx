define ["dom2docxml", "jquery"], (Dom2DocXML, $) ->
  describe "Dom2DocXML", ->
    describe "Lists", ->
      describe "Unordered List", ->
        it "converts '<ul><li>One</li><li>Two</li></ul>'", ->
            $input = $("<div><ul><li>One</li><li>Two</li></ul></div>")

            result = new Dom2DocXML($input[0]).convert()

            expected = '<w:body><w:p><w:pPr><w:pStyle w:val="ListParagraph"/>
<w:numPr><w:ilvl w:val="0"/><w:numId w:val="1"/></w:numPr></w:pPr><w:r>
<w:t>One</w:t></w:r></w:p><w:p><w:pPr><w:pStyle w:val="ListParagraph"/>
<w:numPr><w:ilvl w:val="0"/><w:numId w:val="1"/></w:numPr></w:pPr><w:r>
<w:t>Two</w:t></w:r></w:p></w:body>'

            expect(result).to.equal(expected)

        describe "List Item", ->
          it "converts '<li>One</li>'", ->
            $input = $("<div><li>One</li></div>")

            result = new Dom2DocXML($input[0]).convert()

            expected = '<w:body><w:p><w:pPr><w:pStyle w:val="ListParagraph"/>
<w:numPr><w:ilvl w:val="0"/><w:numId w:val="1"/></w:numPr></w:pPr><w:r>
<w:t>One</w:t></w:r></w:p></w:body>'

            expect(result).to.equal(expected)

      describe "Description List", ->
        it "converts '<dl><dt>Term</dt><dd>Description<dd></dl>'", ->
          $input = $("<div><dl><dt>Term</dt><dd>Description</dd></dl></div>")

          result = new Dom2DocXML($input[0]).convert()

          expected = '<w:body><w:p><w:r><w:rPr><w:b/></w:rPr><w:t>Term
</w:t></w:r></w:p><w:p><w:pPr><w:ind w:left="567"/></w:pPr><w:r>
<w:t>Description</w:t></w:r></w:p></w:body>'

          expect(result).to.equal(expected)

        describe "Term", ->
          it "converts '<dt>Term</dt>'", ->
            $input = $("<div><dt>Term</dt></div>")

            result = new Dom2DocXML($input[0]).convert()

            expected = '<w:body><w:p><w:r><w:rPr><w:b/></w:rPr><w:t>Term
</w:t></w:r></w:p></w:body>'

            expect(result).to.equal(expected)

        describe "Description", ->
          it "converts '<dd>Description</dd>'", ->
            $input = $("<div><dd>Description</dd></div>")

            result = new Dom2DocXML($input[0]).convert()

            expected = '<w:body><w:p><w:pPr><w:ind w:left="567"/></w:pPr><w:r>
<w:t>Description</w:t></w:r></w:p></w:body>'

            expect(result).to.equal(expected)
