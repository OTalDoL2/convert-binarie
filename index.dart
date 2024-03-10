int exponentiation(int base, int exponent) {
  if (exponent == 0) {
    return 1;
  } else if (exponent == 1) {
    return base;
  }

  int power = base;

  for (int i = 1; i < exponent; i++) {
    power = power * base;
  }

  return power;
}

String reverseString(String originalString) {
  String reversedString = "";
  for (int i = originalString.length; i >= 1; i--) {
    reversedString += originalString.substring(i - 1, i);
  }
  return reversedString;
}

int binarieToDecimal(String valor) {
  String reversedString = reverseString(valor);
  
  
  int decimalValue = 0;

  for (int i = 0; i < valor.length; i++) {
    decimalValue += int.parse(reversedString[i]) * exponentiation(2, i);
  }

  return decimalValue;
}

int decimalPlacesRemove(double decimalNumber){
  int decimalPlacesRemoved = int.parse(decimalNumber.toString().split('.')[0]);
  return decimalPlacesRemoved;
}

String decimalToBinarie(int number){
  String valorDecimal = "";

  int valorVerificacao = number;
  
  do{
    valorDecimal += " " + (valorVerificacao%2).toString();
    valorVerificacao = decimalPlacesRemove(valorVerificacao/2);
  }
  while(valorVerificacao < 1);

  valorDecimal = reverseString(valorDecimal);
  return valorDecimal;
}

int octalToDecimal(int valor) {
  String reversedString = reverseString(valor.toString());
  
  
  int decimalValue = 0;

  for (int i = 0; i < valor.toString().length; i++) {
    decimalValue += int.parse(reversedString[i]) * exponentiation(8, i);
  }

  return decimalValue;
}


int decimalToOctal(int number){
  if(number < 8){
    return number;
  }
  
  String decimalValue = "";

  int auxiliarNumber = number;
  
  do{ 
    decimalValue += (auxiliarNumber%8).toString();
    auxiliarNumber = decimalPlacesRemove(auxiliarNumber/8);

    if (auxiliarNumber < 8){
      decimalValue += auxiliarNumber.toString();
    }
  }
  while(auxiliarNumber < 1);

  decimalValue = reverseString(decimalValue);
  return int.parse(decimalValue);
}

int hexadecimalToDecimal(String valor) {
  String reversedString = reverseString(valor);
  
  
  int decimalValue = 0;

  for (int i = 0; i < valor.length; i++) {
    int auxiliarValue = 0;


    try {
      auxiliarValue = int.parse(reversedString[i]);
    } catch (e) {
      hexaCharToNumber(reversedString[i].toLowerCase());
    }
    decimalValue += auxiliarValue * exponentiation(16, i);
  }

  return decimalValue;
}


String numberToHexaChar(int number){
  switch(number){
        case 10:
        return 'a';
        
        case 11:
        return 'b';
        
        case 12:
        return 'c';
        
        case 13:
        return 'd';
        
        case 14:
        return 'e';
        
        case 15:
        return 'f';
      }
  return '';
  
}

int hexaCharToNumber(String character){
  switch(character.toLowerCase()){
    case 'a':
    return 10;

    case 'b':
    return 11;
    
    case 'c':
    return 12;
    
    case 'd':
    return 13;
    
    case 'e':
    return 14;
    
    case 'f':
    return 14;
  }
  return 0;
}

String decimalToHexadecimal(int number){
  if(number < 16){
    return numberToHexaChar(number);
  }
  
  String decimalValue = "";

  int auxiliarNumber = number;
  
  do{ 
    if(auxiliarNumber%16 > 9){
      decimalValue += numberToHexaChar(auxiliarNumber%16);
    } else {
      decimalValue += (auxiliarNumber%16).toString();
    }
    
    auxiliarNumber = decimalPlacesRemove(auxiliarNumber/16);

    if (auxiliarNumber < 10){
      decimalValue += auxiliarNumber.toString();
    }
    else if (auxiliarNumber < 16){
      decimalValue += numberToHexaChar(auxiliarNumber);
    }
  }
  while(auxiliarNumber < 1);

  decimalValue = reverseString(decimalValue);
  return (decimalValue);
}

void main() {
  print(decimalToHexadecimal(30));
  print(hexadecimalToDecimal('1e'));

}