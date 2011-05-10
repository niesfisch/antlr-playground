grammar Sample;

options {
  language = Java;
}

@header {
  package abc;

}

@lexer::header {
  package abc;
}

rule returns [String result]
  : text EOF {$result = $text.result;}
  ;


word returns [String result]
  : (op1=CHAR {$result = $result + $op1.text;})
    (op2=CHAR|INTEGER {$result = $result + $op2.text;})*
  ;

token returns [String result]
  : TOKEN_START word TOKEN_END  {$result = $result + $word.text;}
  ;

text returns [String result]
  : ( op1=word {$result = $result + $op1.result;}
    | op2=token {$result = $result + $op2.result;}
    | op3=WS {$result = $result + $op3.text;}
    )+
  ;

TOKEN_START
  : '\{'
  ;

TOKEN_END
  : '\}'
  ;

fragment INTEGER
  : '0'..'9'
  ;

CHAR
  : 'a'..'z' | 'A'..'Z'
  ;

WS
  : ' ' | '\t' | '\n' | '\r';
