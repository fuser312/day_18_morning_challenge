import 'main.dart';
import 'package:test/test.dart';

void main() {

  test("Test Case 1",(){
    expect(noStrangers("See Spot run. See Spot jump. Spot likes jumping. See Spot fly."), [["spot", "see"],[]]);
  });

  test("Test Case 2",(){
    expect(doesRhyme("Sam I am!", "Green eggs and ham."), true);
  });

  test("Test Case 3", (){
    expect(canFind(["at", "be", "th", "au"], ["beautiful", "the", "hat"]), true);
  });


}