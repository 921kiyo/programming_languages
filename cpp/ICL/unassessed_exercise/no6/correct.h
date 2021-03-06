#ifndef CORRECT_H
#define CORRECT_H

void ascii_to_binary(const char letter, char *output);
char binary_to_ascii(const char *binary);

void text_to_binary(const char* str, char* binary);

void binary_to_text(const char* binary, char* str);

void add_error_correction(const char* data, char* decoded);

char* create_error_corrected_data(char* d,char* decoded);

char parity(char first, char second, char third, char fourth = '0');

int decode(const char* received, char* decoded);

#endif
