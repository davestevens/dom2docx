define ["xml/xml"], (XML) ->
  describe "XML", ->
    it "is a Document node", ->
      type = XML.nodeType

      expect(type).to.equal(9)

    describe "#createElement", ->
      it "returns an Element node", ->
        element = XML.createElement("foo")

        type = element.nodeType

        expect(type).to.equal(1)

    describe "#createTextNode", ->
      it "returns a Text node", ->
        text_node = XML.createTextNode("foo")

        type = text_node.nodeType

        expect(type).to.equal(3)

      it "sets text within Text node", ->
        text_node = XML.createTextNode("foo")

        result = text_node.textContent

        expect(result).to.equal("foo")
