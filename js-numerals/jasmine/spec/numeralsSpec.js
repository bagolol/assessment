describe("Speller", function() {
  // var Speller = require('../src/Speller');
  var speller;


  beforeEach(function() {
    speller = new Speller();
  });

  describe("knows how to spell numbers from 1 to 19", function(){
    xit("returns 'one' when 1 is submitted", function() {
      expect(speller.spellNumber(1)).toEqual("one");
    });

    xit("returns 'nine' when 9 is submitted", function() {
      expect(speller.spellNumber(9)).toEqual("nine");
    });

    xit("returns 'nineteen' when 19 is submitted", function() {
      expect(speller.spellNumber(19)).toEqual("nineteen");
    });
  });

  describe("knows how to spell tens", function(){
     xit("returns 'twenty' when 20 is submitted", function() {
      expect(speller.spellNumber(20)).toEqual("twenty");
    });
    xit("returns 'fifty' when 50 is submitted", function() {
      expect(speller.spellNumber(50)).toEqual("fifty");
    });
  });
  describe("knows how to spell numbers up until 100", function(){
     xit("returns 'seventy-seven' when 77 is submitted", function() {
      expect(speller.spellNumber(77)).toEqual("seventy-seven");
    });
    xit("returns 'fity-two' when 52 is submitted", function() {
      expect(speller.spellNumber(52)).toEqual("fifty-two");
    });
  });
  describe("knows how to spell numbers up until 999", function(){
     xit("returns 'one hundred seventy-seven' when 177 is submitted", function() {
      expect(speller.spellNumber(177)).toEqual("one hundred seventy-seven");
    });
    xit("returns 'four hundred two' when 402 is submitted", function() {
      expect(speller.spellNumber(402)).toEqual("four hundred two");
    });
    it("returns 'one hundred' when 100 is submitted", function() {
      expect(speller.spellNumber(100)).toEqual("one hundred");
    });
  });
  describe("knows how to spell numbers up until 9999", function(){
     xit("returns 'seventeen hundred seventy-seven' when 1777 is submitted", function() {
      expect(speller.spellNumber(1777)).toEqual("seventeen hundred seventy-seven");
    });
    xit("returns 'four thousand four hundred two' when 4402 is submitted", function() {
      expect(speller.spellNumber(4402)).toEqual("four thousand four hundred two");
    });
    xit("returns 'nine thousand' when 9000 is submitted", function() {
      expect(speller.spellNumber(9000)).toEqual("nine thousand");
    });
  });
});