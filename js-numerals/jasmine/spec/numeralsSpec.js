describe("Speller", function() {
  // var Speller = require('../src/Speller');
  var speller;


  beforeEach(function() {
    speller = new Speller();
  });

  describe("knows how to spell numbers from 1 to 19", function(){
    it("returns 'one' when 1 is submitted", function() {
      expect(speller.spellNumber(1)).toEqual("one");
    });

    it("returns 'nine' when 9 is submitted", function() {
      expect(speller.spellNumber(9)).toEqual("nine");
    });

    it("returns 'nineteen' when 19 is submitted", function() {
      expect(speller.spellNumber(19)).toEqual("nineteen");
    });
  });
});