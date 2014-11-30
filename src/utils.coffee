define ->
  merge: (object_1, object_2) ->
    object = @clone(object_1)
    for key, value of object_2
      if typeof(value) == "object"
        object[key] = @merge(object[key], value)
      else
        object[key] = value
    object

  clone: (object) ->
    clone = {}
    for key, value of object
      if typeof(value) == "object" && value != null
        clone[key] = @clone(value)
      else
        clone[key] = value
    clone
