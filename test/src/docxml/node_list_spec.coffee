define ["docxml/node_list"], (DocXMLNodeList) ->
  describe "DocXMLNodeList", ->
    create_node_list = (options) -> new DocXMLNodeList(options)

    describe "#to_xml", ->
      it "converts all nodes to xml", sinon.test ->
        nodes = [1, 2, 3]
        node_list = create_node_list(nodes)
        stubbed_method = @stub(node_list, "convert_node")

        node_list.to_xml()

        expect(stubbed_method).to.have.been.calledThrice

    describe "#convert_node", ->
      context "with unknown node type", ->
        it "throws an error", ->
          node_list = create_node_list()
          node_list.node = { nodeName: "unknown" }

          expect(node_list.convert_node).to.throw(Error)

      mappings = [
        { node_name: "P", func: "paragraph" }
        { node_name: "B", func: "bold" }
        { node_name: "STRONG", func: "bold" }
        { node_name: "I", func: "italic" }
        { node_name: "EM", func: "italic" }
        { node_name: "U", func: "underline" }
        { node_name: "INS", func: "underline" }
        { node_name: "SMALL", func: "small" }
        { node_name: "STRIKE", func: "strike" }
        { node_name: "DEL", func: "strike" }
        { node_name: "SUP", func: "superscript" }
        { node_name: "SUB", func: "subscript" }
        { node_name: "MARK", func: "highlight" }
        { node_name: "H1", func: "heading" }
        { node_name: "H2", func: "heading" }
        { node_name: "H3", func: "heading" }
        { node_name: "H4", func: "heading" }
        { node_name: "H5", func: "heading" }
        { node_name: "H6", func: "heading" }
        { node_name: "BR", func: "line_break" }
        { node_name: "UL", func: "list" }
        { node_name: "LI", func: "list_item" }
        { node_name: "DL", func: "list" }
        { node_name: "DT", func: "description_term" }
        { node_name: "DD", func: "description_description" }
        { node_name: "#text", func: "text" }
      ]

      mappings.forEach((map) ->
        context "with #{map.node_name}", ->
          it "calls '#{map.func}' on xml object", sinon.test ->
            xml = new Object()
            xml[map.func] = ->
            stubbed_method = @stub(xml, map.func)

            node_list = create_node_list()
            node_list.node = { nodeName: map.node_name }

            node_list.convert_node(xml)

            expect(stubbed_method).to.have.been.called
      )
