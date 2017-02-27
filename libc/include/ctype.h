#ifndef _CTYPE_H
#define _CTYPE_H 1

#include <sys/config.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Returns isalpha( c ) || isdigit( c ) */
int isalnum( int c );

int isalpha( int c );

int isblank( int c );

/* Returns true if the character is a control character. */
int iscntrl( int c );

/* Returns true if the character is a digit. */
int isdigit( int c );

/* Returns true for every printing character except space (' '). */
int isgraph( int c );

int islower( int c );

/* Returns true for every printing character including space (' '). */
int isprint( int c );

int ispunct( int c );

/* Returns true for every standard whitespace character (' ', '\f', '\n', '\r',
   '\t', '\v').
*/ 
int isspace( int c );

int isupper( int c );

/* Returns true for any hexadecimal-digit character. */
int isxdigit( int c );

/* Converts an uppercase letter to a corresponding lowercase letter. Input that
   is not an uppercase letter remains unchanged.
*/
int tolower( int c );

/* Converts a lowercase letter to a corresponding uppercase letter. Input that
   is not a lowercase letter remains unchanged.
*/
int toupper( int c );

#ifdef __cplusplus
}
#endif

#endif
