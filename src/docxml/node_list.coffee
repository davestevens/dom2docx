define ->
  class DocXMLNodeList
    constructor: (node_list) -> @node_list = node_list

    to_xml: (xml) ->
      @convert_node(xml) for @node in @node_list

    convert_node: (xml) ->
      switch @node.nodeName
        when "P" then xml.paragraph(@_traverse)
        when "B" then xml.bold(@_traverse)
        when "STRONG" then xml.bold(@_traverse)
        when "I" then xml.italic(@_traverse)
        when "EM" then xml.italic(@_traverse)
        when "U" then xml.underline(@_traverse)
        when "INS" then xml.underline(@_traverse)
        when "SMALL" then xml.small(@_traverse)
        when "STRIKE" then xml.strike(@_traverse)
        when "DEL" then xml.strike(@_traverse)
        when "SUP" then xml.superscript(@_traverse)
        when "SUB" then xml.subscript(@_traverse)
        when "MARK" then xml.highlight(@_traverse)
        when "H1", "H2", "H3", "H4", "H5", "H6"
          xml.heading(@node.nodeName.match(/\d/)[0], @_traverse)
        when "BR" then xml.line_break()
        when "UL" then xml.list(@_traverse)
        when "LI" then xml.list_item(@_traverse)
        when "DL" then xml.list(@_traverse)
        when "DT" then xml.description_term(@_traverse)
        when "DD" then xml.description_description(@_traverse)
        when "#text" then xml.text(@node.textContent)
        else throw new Error("Not Defined")

    # private

    _traverse: (xml) =>
      node_list = new DocXMLNodeList(@node.childNodes)
      node_list.to_xml(xml)
