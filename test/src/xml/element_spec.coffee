define ["xml/element", "xml/xml"], (XMLElement, XML) ->
  describe "XMLElement", ->
    create_xml_element = ->
      element = XML.createElement("foo")
      new XMLElement(element)

    describe ".name", ->
      it "is the nodeName of the passed Element", ->
        element = XML.createElement("foo")
        xml_element = new XMLElement(element)

        result = xml_element.name

        expect(result).to.equal("foo")

    describe "#to_string", ->
      it "serializes Element to string", ->
        element = XML.createElement("foo")
        xml_element = new XMLElement(element)

        result = xml_element.to_string()

        expect(result).to.equal("<foo/>")

    describe "#create_element", ->
      it "creates a new child element", ->
        xml_element = create_xml_element()

        xml_element.create_element("bar")

        expect(xml_element.element.childNodes).to.have.length(1)

      it "returns a new XMLElement", ->
        xml_element = create_xml_element()

        result = xml_element.create_element("bar")

        expect(result).to.be.an.instanceOf(XMLElement)

      context "with attributes", ->
        it "sets the attributes on the new element", ->
          xml_element = create_xml_element()

          element = xml_element.create_element("bar", { bish: "bosh" })
          attributes = element.element.attributes

          expect(attributes["bish"].nodeValue).to.equal("bosh")

    describe "#ele", ->
      it "calls 'create_element'", sinon.test ->
        xml_element = create_xml_element()
        stubbed_method = @stub(xml_element, "create_element")

        xml_element.ele("type", "attributes")

        expect(stubbed_method).to.have.been.calledWith("type", "attributes")

    describe "#create_text_node", ->
      it "creates a new child Element with a Text node", ->
        xml_element = create_xml_element()

        xml_element.create_text_node("bar", "string")

        expect(xml_element.element.childNodes).to.have.length(1)
        text_node = xml_element.element.childNodes[0]
        expect(text_node.textContent).to.equal("string")

      it "returns a new XMLElement", ->
        xml_element = create_xml_element()

        result = xml_element.create_text_node("bar", "string")

        expect(result).to.be.an.instanceOf(XMLElement)

    describe "#txt", ->
      it "calls 'create_text_node'", sinon.test ->
        xml_element = create_xml_element()
        stubbed_method = @stub(xml_element, "create_text_node")

        xml_element.txt("type", "string")

        expect(stubbed_method).to.have.been.calledWith("type", "string")

    describe "#set_attribute", ->
      it "sets attribute on the current element", ->
        xml_element = create_xml_element()

        xml_element.set_attribute("bish", "bosh")
        attributes = xml_element.element.attributes

        expect(attributes["bish"].nodeValue).to.equal("bosh")

    describe "#att", ->
      it "calls 'set_attribute'", sinon.test ->
        xml_element = create_xml_element()
        stubbed_method = @stub(xml_element, "set_attribute")

        xml_element.att("key", "value")

        expect(stubbed_method).to.have.been.calledWith("key", "value")
