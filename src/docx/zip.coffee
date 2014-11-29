define ["jszip"], (JSZip) ->
  class DocxZip
    constructor: -> @zip = new JSZip()

    create: (manifest) ->
      @_build_zip(manifest, @zip)
      @zip

    generate: -> @zip.generate(compression: "DEFLATE", type: "blob")

    _build_zip: (manifest, zip) ->
      for filename, content of manifest.files
        zip.file(filename, content)

      for directory_name, content of manifest.directories
        folder = zip.folder(directory_name)
        @_build_zip(content, folder)
