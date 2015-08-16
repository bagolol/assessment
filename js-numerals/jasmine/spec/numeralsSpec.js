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
  describe("knows how to spell numbers up until 100", function(){
     it("returns 'seventy-seven' when 77 is submitted", function() {
      expect(speller.spellNumber(77)).toEqual("seventy-seven");
    });
    it("returns 'fity-two' when 52 is submitted", function() {
      expect(speller.spellNumber(52)).toEqual("fifty-two");
    });
  });
  describe("knows how to spell numbers up until 1000", function(){
     it("returns 'one hundred seventy-seven' when 77 is submitted", function() {
      expect(speller.spellNumber(177)).toEqual("one hundred seventy-seven");
    });
    it("returns 'four hundred two' when 402 is submitted", function() {
      expect(speller.spellNumber(402)).toEqual("four hundred two");
    });
    it("returns 'one hundred' when 100 is submitted", function() {
      expect(speller.spellNumber(100)).toEqual("one hundred");
    });
  });
});