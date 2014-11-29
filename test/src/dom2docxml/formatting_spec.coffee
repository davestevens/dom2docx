define ["dom2docxml", "jquery"], (Dom2DocXML, $) ->
  describe "Dom2DocXML", ->
    describe "Formatting", ->
      context "when within a Paragraph", ->
        it "does not create a new Paragraph", ->
          $input = $("<div><p>Hello, <b>World!</b></p></div>")

          result = new Dom2DocXML($input[0]).convert()

          expected = '<w:body><w:p><w:r><w:t xml:space="preserve">Hello, </w:t>
</w:r><w:r><w:rPr><w:b/></w:rPr><w:t>World!</w:t></w:r></w:p></w:body>'
          expect(result).to.equal(expected)

      context "with Bold text", ->
        it "converts '<b>Hello, World!</b>'", ->
          $input = $("<div><b>Hello, World!</b></div>")

          result = new Dom2DocXML($input[0]).convert()

          expected = '<w:body><w:p><w:r><w:rPr><w:b/></w:rPr><w:t>Hello, World!
</w:t></w:r></w:p></w:body>'
          expect(result).to.equal(expected)

      context "with Strong text", ->
        it "converts '<strong>Hello, World!</strong>'", ->
          $input = $("<div><strong>Hello, World!</strong></div>")

          result = new Dom2DocXML($input[0]).convert()

          expected = '<w:body><w:p><w:r><w:rPr><w:b/></w:rPr><w:t>Hello, World!
</w:t></w:r></w:p></w:body>'
          expect(result).to.equal(expected)

      context "with Italic text", ->
        it "converts '<i>Hello, World!</i>'", ->
          $input = $("<div><i>Hello, World!</i></div>")

          result = new Dom2DocXML($input[0]).convert()

          expected = '<w:body><w:p><w:r><w:rPr><w:i/></w:rPr><w:t>Hello, World!
</w:t></w:r></w:p></w:body>'
          expect(result).to.equal(expected)

      context "with Emphasized text", ->
        it "converts '<em>Hello, World!</em>'", ->
          $input = $("<div><em>Hello, World!</em></div>")

          result = new Dom2DocXML($input[0]).convert()

          expected = '<w:body><w:p><w:r><w:rPr><w:i/></w:rPr><w:t>Hello, World!
</w:t></w:r></w:p></w:body>'
          expect(result).to.equal(expected)

      context "with Underlined text", ->
        it "converts '<u>Hello, World!</u>'", ->
          $input = $("<div><u>Hello, World!</u></div>")

          result = new Dom2DocXML($input[0]).convert()

          expected = '<w:body><w:p><w:r><w:rPr><w:u w:val="single"/></w:rPr>
<w:t>Hello, World!</w:t></w:r></w:p></w:body>'
          expect(result).to.equal(expected)

      context "with Inserted text", ->
        it "converts '<ins>Hello, World!</ins>'", ->
          $input = $("<div><ins>Hello, World!</ins></div>")

          result = new Dom2DocXML($input[0]).convert()

          expected = '<w:body><w:p><w:r><w:rPr><w:u w:val="single"/></w:rPr>
<w:t>Hello, World!</w:t></w:r></w:p></w:body>'
          expect(result).to.equal(expected)

      context "with Small text", ->
        it "converts '<small>Hello, World!</small>'", ->
          $input = $("<div><small>Hello, World!</small></div>")

          result = new Dom2DocXML($input[0]).convert()

          expected = '<w:body><w:p><w:r><w:rPr><w:sz w:val="18"/></w:rPr>
<w:t>Hello, World!</w:t></w:r></w:p></w:body>'
          expect(result).to.equal(expected)

      context "with Strikethrough text", ->
        it "converts '<strike>Hello, World!</strike>'", ->
          $input = $("<div><strike>Hello, World!</strike></div>")

          result = new Dom2DocXML($input[0]).convert()

          expected = '<w:body><w:p><w:r><w:rPr><w:strike/></w:rPr><w:t>
Hello, World!</w:t></w:r></w:p></w:body>'
          expect(result).to.equal(expected)

      context "with Deleted text", ->
        it "converts '<del>Hello, World!</del>'", ->
          $input = $("<div><del>Hello, World!</del></div>")

          result = new Dom2DocXML($input[0]).convert()

          expected = '<w:body><w:p><w:r><w:rPr><w:strike/></w:rPr><w:t>
Hello, World!</w:t></w:r></w:p></w:body>'
          expect(result).to.equal(expected)

      context "with Superscript text", ->
        it "converts '<sup>Hello, World!</sup>'", ->
          $input = $("<div><sup>Hello, World!</sup></div>")

          result = new Dom2DocXML($input[0]).convert()

          expected = '<w:body><w:p><w:r><w:rPr>
<w:vertAlign w:val="superscript"/></w:rPr><w:t>Hello, World!</w:t></w:r></w:p>
</w:body>'
          expect(result).to.equal(expected)

      context "with Subscript text", ->
        it "converts '<sub>Hello, World!</sub>'", ->
          $input = $("<div><sub>Hello, World!</sub></div>")

          result = new Dom2DocXML($input[0]).convert()

          expected = '<w:body><w:p><w:r><w:rPr>
<w:vertAlign w:val="subscript"/></w:rPr><w:t>Hello, World!</w:t></w:r></w:p>
</w:body>'
          expect(result).to.equal(expected)

      context "with Marked text", ->
        it "converts '<mark>Hello, World!</mark>'", ->
          $input = $("<div><mark>Hello, World!</mark></div>")

          result = new Dom2DocXML($input[0]).convert()

          expected = '<w:body><w:p><w:r><w:rPr><w:highlight w:val="yellow"/>
</w:rPr><w:t>Hello, World!</w:t></w:r></w:p></w:body>'
          expect(result).to.equal(expected)

      describe "Mixed Format text", ->
        it "converts '<b>Hello, <u>World!</u></b>'", ->
          $input = $("<div><b>Hello, <u>World!</u></b></div>")

          result = new Dom2DocXML($input[0]).convert()

          expected = '<w:body><w:p><w:r><w:rPr><w:b/></w:rPr>
<w:t xml:space="preserve">Hello, </w:t></w:r><w:r><w:rPr><w:b/>
<w:u w:val="single"/></w:rPr><w:t>World!</w:t></w:r></w:p></w:body>'
          expect(result).to.equal(expected)
