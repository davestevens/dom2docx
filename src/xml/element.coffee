define ["xml/xml"], (XML) ->
  class XMLElement
    constructor: (element) ->
      @element = element
      @name = @element.nodeName

    to_string: ->
      serializer = new XMLSerializer()
      serializer.serializeToString(@element)

    create_element: (type, attributes = {}) ->
      ele = XML.createElement(type)
      ele.setAttribute(key, value) for key, value of attributes
      @element.appendChild(ele)
      new XMLElement(ele)

    ele: -> @create_element.apply(@, arguments)

    create_text_node: (type, string) ->
      ele = XML.createElement(type)
      ele.appendChild(XML.createTextNode(string))
      @element.appendChild(ele)
      new XMLElement(ele)

    txt: -> @create_text_node.apply(@, arguments)

    set_attribute: (key, value) -> @element.setAttribute(key, value)

    att: -> @set_attribute.apply(@, arguments)
