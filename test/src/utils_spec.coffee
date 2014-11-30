define ["utils"], (utils) ->
  describe "utils", ->
    describe "#clone", ->
      it "returns a cloned instance of the passed object", ->
        object = { a: 123, b: 456, c: { foo: "bar" } }

        result = utils.clone(object)

        expect(result).to.deep.equal(object)

      it "returns a new instance of the passed object", ->
        object = { a: 123 }

        result = utils.clone(object)

        expect(result).not.to.equal(object)

    describe "#merge", ->
      it "merges the two passes objects", ->
        object_1 = { a: 123, b: 456 }
        object_2 = { b: 789 }

        result = utils.merge(object_1, object_2)

        expect(result).to.deep.equal(a: 123, b: 789)

      it "does not affect the passed objects", ->
        object_1 = { a: 123, b: 456 }
        object_2 = { b: 789 }

        utils.merge(object_1, object_2)

        expect(object_1).to.deep.equal(a: 123, b: 456)
        expect(object_2).to.deep.equal(b: 789)

      context "with nested objects", ->
        it "recursively merges objects", ->
          object_1 = { a: { b: { c: "foo", d: "bar" } } }
          object_2 = { a: { b: { c: "bish" } } }

          result = utils.merge(object_1, object_2)

          expect(result).to.deep.equal(a: { b: { c: "bish", d: "bar" } })
