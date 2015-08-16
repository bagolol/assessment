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

  describe("knows how to spell tens", function(){
     it("returns 'twenty' when 20 is submitted", function() {
      expect(speller.spellNumber(20)).toEqual("twenty");
    });
    it("returns 'fifty' when 50 is submitted", function() {
      expect(speller.spellNumber(50)).toEqual("fifty");
    });

  });
});