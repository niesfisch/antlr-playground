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

@members {
	public String replace(String toReplace){
	 return "####" + toReplace;
	}

	public void register(String toReplace){
   //
  }
}


rule returns [String result]
  : (
      word=WORD {$result = $result + $word.text;}
      |
      (TOKEN_START token=WORD TOKEN_END {$result = $result + replace($token.text);})
      |
      ws=WS {$result = $result + $ws.text;}
    )+
    EOF
  ;

TOKEN_START
  : '{'
  ;

TOKEN_END
  : '}'
  ;

WORD
  : ('a'..'z' | 'A'..'Z' | '0'..'9')+
  ;

WS
  : (' ' | '\t' | '\n' | '\r')+
  ;
