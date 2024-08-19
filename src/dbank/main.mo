import Debug "mo:base/Debug";  //This is tne motoko base library

actor DBank {  //This is new canister
  var currentValue = 300;
  currentValue := 0;  //This is overwriting the variable

  let id = 121212; //Value will never change


  Debug.print("Hello, Motoko!"); //The print functon will just print text
  Debug.print(debug_show(currentValue));  //debug_show will print variables
  Debug.print(debug_show(id));

  
  public func topUp(amount: Nat) {  //Functions  //This function will be private without the public keyword, to the actor(canister) dbank
  //Nat means any natural number. Here we are taking input from the user for the amount
  //To make function s accessible outside the canister we use the public keyword
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };


  //this function will allow users to withdraw amount
  public func withDraw(amount: Nat) {
    currentValue-=amount;
    Debug.print(debug_show(currentValue));
  };
}