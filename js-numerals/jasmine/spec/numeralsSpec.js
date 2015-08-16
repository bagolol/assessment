describe("Speller", function() {
  // var Speller = require('../src/Speller');
  var speller;


  beforeEach(function() {
    speller = new Speller();
  });

  it("returns 'one' when 1 is submitted", function() {
    expect(speller.spellNumber(1)).toEqual("one");
  });
});