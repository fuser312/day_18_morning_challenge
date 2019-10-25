import 'package:collection/equality.dart';

// Challenge 1
// Write test cases for next 2 challenges. Also include tests for boundary conditions
// For this challenge, the input will be a (long) string.


// Challenge 2
// A word encountered for the first time is a stranger.
// A word encountered thrice becomes an acquaintance.
// A word encountered 5 times becomes a friend.

// Create a function that takes the string and returns a list of two lists.
// The first is a list of acquaintances in the order they became an acquaintance (see example).
// The second is a list of friends in the order they became a friend.
// Words in the friend list should no longer be in the acquaintance list.

// Example
// noStrangers("See Spot run. See Spot jump. Spot likes jumping. See Spot fly.")
// ➞ [["spot", "see"], []]
/// "see" was encountered first but "spot" became an acquaintance earlier.

List noStrangers(String string){
  List acquaintance = [];
  List friend = [];
  string.replaceAll(".", "");
  List listOfString = string.split(" ");
  List finalList = [];

  for(int i = 0; i<listOfString.length; i++){
    int count = 0;
      for(int j = 1; j<listOfString.length; j++){
        if (listOfString[i] == listOfString[j]){
          count++;
          if(count == 2 || count == 3){
            acquaintance.add(listOfString[i]);
          }
          else if(count == 5 || count> 5){
            friend.add(listOfString[i]);
          }
        }
      }


  }

  acquaintance = acquaintance.toSet().toList();
  friend = friend.toSet().toList();
 // finalList.add(acquaintance.toSet().toList());
 // finalList.add(friend.toSet().toList());
  for(int i = 0; i< friend.length; i++){
    if(acquaintance.contains(friend[i])){
      acquaintance.remove(friend[i]);
    }
  }
  finalList.add(acquaintance);
  finalList.add(friend);
  return finalList;
}

// Challenge 3
// Rhyme Time
// Create a function that returns true if two lines rhyme and false otherwise.
// For the purposes of this exercise, two lines rhyme if the last
// word from each sentence contains the same vowels.
// Example:
// doesRhyme("Sam I am!", "Green eggs and ham.") ➞ true

bool doesRhyme(String first, String second){
  List listOfVowels = ["a","e","i","o","u"];
  List firstSentence = first.split(" ");
  List secondSentence = second.split(" ");
  List firstWordVowels = [];
  List secondWordVOwels = [];

  for(int i = 0; i<listOfVowels.length;i++){
    if((firstSentence.last).contains(listOfVowels[i])){
      firstWordVowels.add(listOfVowels[i]);
    }

  }

  for(int i = 0; i<listOfVowels.length;i++){
    if((secondSentence.last).contains(listOfVowels[i])){
      secondWordVOwels.add(listOfVowels[i]);
    }

  }

  if (const IterableEquality().equals(firstWordVowels, secondWordVOwels)) {
    return true;
  } else {
    return false;
  }
}

// Challenge 4
// Do All Bigrams (2 character words) Exist?
// You are given an input list of bigrams, and a list of words.
//
// Write a function that returns true if you can find every single bigram from
// this list can be found at least once in an list of words.
//
// Examples
// canFind(["at", "be", "th", "au"], ["beautiful", "the", "hat"]) ➞ true

bool canFind(List listOne, listTwo){
  List foundWords = [];
  for(int i = 0; i< listTwo.length; i++){
    for(int j = 0; j<listOne.length; j++){
      if(listTwo[i].contains(listOne[j])){
        foundWords.add(listOne[j]);
      }
    }
  }

  foundWords.toSet().toList();
  if(foundWords.length == listOne.length){
    return true;
  }
  else{
    return false;
  }
}

main() {
print(noStrangers("See Spot run. See Spot jump. Spot likes jumping. See Spot fly. "));
print(doesRhyme("Sam I am!", "Green eggs and ham."));
print(canFind(["at", "be", "th", "au"], ["beautiful", "the", "hat"]));
}
