define ["dom2docxml", "jquery"], (Dom2DocXML, $) ->
  describe "Dom2DocXML", ->
    describe "Headings", ->
      [1..6].forEach((heading) ->
        describe "H#{heading}", ->
          it "converts <h#{heading}>Hello, World!</h#{heading}>", ->
            $input = $("<div><h#{heading}>Hello, World!</h#{heading}></div>")

            result = new Dom2DocXML($input[0]).convert()

            expected = "<w:body><w:p><w:pPr>
<w:pStyle w:val=\"Heading#{heading}\"/></w:pPr><w:r><w:t>Hello, World!</w:t>
</w:r></w:p></w:body>"
            expect(result).to.equal(expected)
      )
