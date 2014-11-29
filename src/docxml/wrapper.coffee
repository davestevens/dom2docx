define ["xml/element"], (XMLElement) ->
  class DocXMLWrapper
    constructor: (xml, styles = []) ->
      @xml = xml
      @styles = styles

    # TODO: define for all types
    paragraph: (callback) ->
      element = @xml.ele("w:p")
      callback(new DocXMLWrapper(element)) if callback

    heading: (value, callback) ->
      element = @xml.ele("w:p")
      element.ele("w:pPr").ele("w:pStyle", "w:val": "Heading#{value}")
      callback(new DocXMLWrapper(element)) if callback

    bold: (callback) ->
      bold = { key: "w:b" }
      @style(bold, callback)

    italic: (callback) ->
      italic = { key: "w:i" }
      @style(italic, callback)

    small: (callback) ->
      small = { key: "w:sz", attributes: { "w:val": 18 } }
      @style(small, callback)

    underline: (callback) ->
      underline = { key: "w:u", attributes: { "w:val": "single" } }
      @style(underline, callback)

    strike: (callback) ->
      strikethrough = { key: "w:strike" }
      @style(strikethrough, callback)

    superscript: (callback) ->
      superscript =
        key: "w:vertAlign", attributes: { "w:val": "superscript" }
      @style(superscript, callback)

    subscript: (callback) ->
      subscript = { key: "w:vertAlign", attributes: { "w:val": "subscript" } }
      @style(subscript, callback)

    highlight: (callback) ->
      hightlight = { key: "w:highlight", attributes: { "w:val": "yellow" } }
      @style(hightlight, callback)

    style: (type, callback) ->
      parent = if @xml.name == "w:p" then @xml else @xml.ele("w:p")
      callback(new DocXMLWrapper(parent, @styles.concat(type))) if callback

    line_break: -> @xml.ele("w:br")

    list: (callback) ->
      # NOTE: a list does not need to add anything to the document
      callback(@) if callback

    list_item: (callback) ->
      element = @xml.ele("w:p")
      paragraph_properties = element.ele("w:pPr")
      paragraph_properties.ele("w:pStyle", "w:val": "ListParagraph")
      number_properties = paragraph_properties.ele("w:numPr")
      number_properties.ele("w:ilvl", "w:val": "0")
      number_properties.ele("w:numId", "w:val": "1")
      callback(new DocXMLWrapper(element)) if callback

    description_term: (callback) -> @bold(callback)

    description_description: (callback) ->
      element = @xml.ele("w:p")
      paragraph_properties = element.ele("w:pPr")
      paragraph_properties.ele("w:ind", "w:left": "567")
      callback(new DocXMLWrapper(element)) if callback

    text: (string) ->
      return if @_blank_string(string)
      parent = if @xml.name == "w:body" then @xml.ele("w:p") else @xml

      element = @_build_region(parent).txt("w:t", string)
      element.att("xml:space", "preserve") if @_preserve_whitespace(string)

    to_string: -> @xml.to_string()

    # private

    _blank_string: (string) -> !/\S/.test(string)

    _build_region: (parent) ->
      region = parent.ele("w:r")
      @_include_styles(region)
      region

    _include_styles: (region) ->
      return if @styles.length == 0

      region_properties = region.ele("w:rPr")
      for style in @styles
        region_properties.ele(style.key, style.attributes)

    _preserve_whitespace: (string) -> /(^\s+|\s+$)/.test(string)
