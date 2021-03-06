lexer grammar adelelex;

/******************************************************************************/
/* tokens                                                                     */
/******************************************************************************/

/* keywords */
IF:     'if'        ;
END:    'end'       ;
WHILE:  'while'     ;
RETURN: 'return'    ;
GROUP:  'group'     ;

/* symbols */
fragment MULTI:      '*'  ;
fragment DIV:        '/'  ;
fragment HASH:       '#'  ;
fragment GT:         '>'  ;
fragment LT:         '<'  ;
fragment GET:        '>=' ;
fragment LET:        '<=' ;
fragment NE:         '!=' ;
fragment EQ:         '==' ;


LPAREN:     '('  ;
RPAREN:     ')'  ;
COMMA:      ','  ;
SEMICOLON:  ';'  ;
EQUAL:      '='  ;
OVERLAY:    '//' ;
AT:         '@'  ;
LSB:        '['  ;
RSB:        ']'  ;
LBRACE:     '{'  ;
RBRACE:     '}'  ;
DOT:        '.'  ;

ADD:        '+'  ;
SUB:        '-'  ;
VATT:       '|'  ;

MULTI_OP:       MULTI   | DIV ;
COMPARE_OP:     NE | GT | LT | GET | LET | EQ ;

/* types */
/*
fragment INT:       'int'   ;
fragment FLOAT:     'float' ;
fragment CHAR:      'char'  ;
fragment VOID:      'void'  ;
fragment BOOL:      'bool'  ;
fragment STRING:    'string';
*/

/* primitive types */
fragment INT_NUM:    [1-9]+[0-9]* | [0] ;       // integers
fragment FLOAT_NUM: INT_NUM '.' [0-9]+;             // is it better?
fragment Escape_seq: '\\' [ntb"'\\];
fragment CHR:   ~["\\]
            |   Escape_seq
            ;
NUM:    FLOAT_NUM | INT_NUM ;
BOOL_LITERAL: 'true' | 'false';
STR:    '"' CHR* '"' ;

/* identifiers */
ID:     [_a-zA-Z]+[_0-9a-zA-Z]* ;                   // match lower-case identifiers

/* spaces, tabs.. */
WS:     [ \t\r\n]+ -> skip ;        // skip spaces, tabs, newlines
LINE_COMMENT:   HASH ~[\r\n]* -> channel(HIDDEN) ;
