function Speller() {
  this.writtenNumbers = {
                          1: "one",
                          2: "two",
                          3: "three",
                          4: "four",
                          5: "five",
                          6: "six",
                          7: "seven",
                          8: "eight",
                          9: "nine",
                          10: "ten",
                          11: "eleven",
                          12: "twelve",
                          13: "thirteen",
                          14: "fourteen",
                          15: "fifteen",
                          16: "sixteen",
                          17: "seventeen",
                          18: "eighteen",
                          19: "nineteen",
                          20: "twenty",
                          30: "thirty",
                          40: "forty",
                          50: "fifty",
                          60: "sixty",
                          70: "seventy",
                          80: "eighty",
                          90: "ninety"
                        }
}
Speller.prototype.spellNumber = function(integer) {
  if(this.writtenNumbers[integer]) {
    return this.writtenNumbers[integer]
  } else if (integer/1000 >= 2) {
    var units = integer%1000;
    var thousands = (integer-units)/1000;
    var textStart = this.writtenNumbers[thousands];
    if(units === 0){
      return textStart + ' thousand';
    } else {
      var textLeft = this.spellNumber(units);
      return textStart + ' thousand ' + textLeft;
    }
  } else if (integer/100 >= 1) {
    var units = integer%100;
    var hundreds = (integer-units)/100;
    var textStart = this.writtenNumbers[hundreds];
    if(units === 0) {
      return textStart + ' hundred'
    } else {
      var textLeft = this.spellNumber(units);
      return textStart + ' hundred ' + textLeft;
    }
  } else {
    var units = integer%10;
    var tens = integer - units;
    var textStart = this.spellNumber(tens);
    var textLeft = this.spellNumber(units);
    return textStart + '-' + textLeft;
  };
};


// module.exports = Speller;

