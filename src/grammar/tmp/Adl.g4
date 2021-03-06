/******************************************************************************/
/* Simplified version of the previous adele.g4                                */
/******************************************************************************/
grammar Adl;
import adelelex;

prog:                                       /* empty programs       */
        |   (
                func                        /* functions            */
        |       (declaration SEMICOLON)     /* declarations         */

            )*
        ;

func:   type ID LPAREN RPAREN
        stmts
        END ;

type:   'int' | 'void';

stmts:  stmt* ;
stmt:       expr SEMICOLON
        |   declaration SEMICOLON
        |   RETURN expr SEMICOLON
        ;

declaration:    type ID
            |   type ID EQUAL expr
            ;

expr:      ID LPAREN func_plist RPAREN #funccall
        |    ID      EQUAL   expr        #assign
        |   NUM                         #num
        ;

func_plist:  | ( fpitem COMMA )* fpitem;
fpitem:     expr ;