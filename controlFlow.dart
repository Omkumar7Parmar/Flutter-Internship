void main(){
  // if Statement
  int age = 20;
  if(age >= 18){
    print("You are eligible for voting");
  }
  //else Statement
  else{
    print("You are not eligible for voting");
  } 
  //else if Statement
  if(age >= 18){
    print("You are eligible for voting");
  }
  else if(age >= 18){
    print("You are eligible for voting");
  }
  //switch Statement
  switch(age){
    case 18:
      print("You are eligible for voting");
      break;
    case 20:
      print("You are eligible for voting");
      break;
    default:
      print("You are not eligible for voting");
  }
  //for loop
  for(int i = 0; i < 10; i++){
    print(i);
  }
  //while loop
  int i = 0;
  while(i < 10){
    print(i);
    i++;
  }
  //do while loop
  int j = 0;
  do{
    print(j);
    j++;
  }while(j < 10);
  //break Statement
  for(int i = 0; i < 10; i++){
    if(i == 5){
      break;
    }
    print(i);
  }
  //continue Statement
  for(int i = 0; i < 10; i++){
    if(i == 5){
      continue;
    }
    print(i);
  }
  //return Statement
  for(int i = 0; i < 10; i++){
    if(i == 5){
      return;
    }
    print(i);
  }
  //for-in loop
  List<int> numbers = [1, 2, 3, 4, 5];
  for(int number in numbers){
    print(number);
  }
  //for-each loop
  numbers.forEach((number){
    print(number);
  });
  //nested if Statement
  int age1 = 20;
  if(age1 >= 18){
    if(age1 >= 20){
      print("You are eligible for voting");
    }
    else{
      print("You are not eligible for voting");
    }
  }
  //nested else if Statement
  else if(age1 >= 18){
    print("You are eligible for voting");
  }
  //nested switch Statement
  switch(age1){
    case 18:
      print("You are eligible for voting");
      break;
    case 20:
      print("You are eligible for voting");
      break;
    default:
      print("You are not eligible for voting");
  }
  //nested for loop
  for(int i = 0; i < 10; i++){
    for(int j = 0; j < 10; j++){
      print(i);
    }
  }
  //nested while loop
  int a = 0;
  while(a < 10){
    int b = 0;
    while(b < 10){
      print(a);
      b++;
    }
    a++;
  }
  //nested do while loop
  int c= 0;
  do{
    int d  = 0;
    do{
      print(c);
      d++;
    }while(d < 10);
    c++;
  }while(j < 10);
  //nested break Statement
  for(int e = 0; e < 10; e++){
    for(int f = 0; f < 10; f++){
      if(e == 5){
        break;
      }
      print(e);
    }
  }
  //nested continue Statement
  for(int i = 0; i < 10; i++){
    for(int j = 0; j < 10; j++){
      if(i == 5){
        continue;
      }
      print(i);
    }
  }
  //nested return Statement
  for(int i = 0; i < 10; i++){
    for(int j = 0; j < 10; j++){
      if(i == 5){
        return;
      }
      print(i);
    }
  }
  //nested for-in loop
  List<int> numbers1 = [1, 2, 3, 4, 5];
  for(int number in numbers1){
    for(int number in numbers1){
      print(number);
    }
  }
  //nested for-each loop
  numbers1.forEach((number){
    numbers1.forEach((number){
      print(number);
    });
  });
  //ternary operator
  int age2 = 20;
  String result = age2 >= 18 ? "Eligible" : "Not Eligible";
  print(result);

  
}