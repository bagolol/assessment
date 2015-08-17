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
};


var units, tens, textLeft, dividers, firstDigit;

Speller.prototype.spellNumber = function(integer) {


  if(this.writtenNumbers[integer]) {
    return this.writtenNumbers[integer]
  } else if (integer/1000 >= 2) {

    return this.writeSentence(integer, 1000);

  } else if (integer/100 >= 1) {

    return this.writeSentence(integer, 100);

  } else {
    units = integer%10;
    tens = integer - units;
    textStart = this.spellNumber(tens);
    return textStart + '-' + this.writtenNumbers[units];
  };
};

Speller.prototype.writeSentence = function(integer, divider){

  dividers = {100: " hundred", 1000: " thousand"};
  units = integer%divider;
  firstDigit = (integer-units)/divider;
  var textStart = this.writtenNumbers[firstDigit];
  var nameNum = dividers[divider];
  if(units === 0){
    return textStart + nameNum;
  } else {
    textLeft = this.spellNumber(units);
    return textStart + nameNum + ' ' + textLeft;
  };
};



