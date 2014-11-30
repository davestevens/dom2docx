define ["docxml/node_list", "docxml/wrapper", "xml/element", "xml/xml"],
(DocXMLNodeList, DocXMLWrapper, XMLElement, XML) ->
  class Dom2DocXML
    constructor: (dom) ->
      @dom = dom
      @xml = @_create_xml()

    convert: ->
      @_to_xml()
      @_to_string()

    # private

    _create_xml: ->
      element = XML.createElement("w:body")
      new DocXMLWrapper(new XMLElement(element))

    _to_xml: -> new DocXMLNodeList(@dom.childNodes).to_xml(@xml)

    _to_string: -> @xml.to_string()
