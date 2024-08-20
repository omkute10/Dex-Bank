import Debug "mo:base/Debug";  //This is tne motoko base library
import Int "mo:base/Int";

actor DBank {  //This is new canister
  var currentValue = 300;
  currentValue := 0;  //This is overwriting the variable

  stable var loanValue = 100;  //This orthogonal persistance, using the stable keyword.
  //This will hold on the state of the variable even after redeploying!

  let id = 121212; //Value will never change


  Debug.print("Hello, Motoko!"); //The print functon will just print text
  Debug.print(debug_show(currentValue));  //debug_show will print variables
  Debug.print(debug_show(id));

  
  public func deposit(amount: Nat) {  //Functions  //This function will be private without the public keyword, to the actor(canister) dbank
  //Nat means any natural number. Here we are taking input from the user for the amount
  //To make function s accessible outside the canister we use the public keyword
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };

  //this function will allow users to withdraw amount
  public func withdraw(amount: Nat) {
    let temp: Int = currentValue-amount;
    if(temp >= 0) {
      currentValue-=amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount too large, please check your Balance.")
    }
    
  };


  //Query calls -- For read only!(This loads quickly as this has to only read the value and not to update anything on the blockchain)
  public query func checkBalance(): async Nat {
    return currentValue;
  };

}