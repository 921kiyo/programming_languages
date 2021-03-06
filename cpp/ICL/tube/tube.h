enum Direction {N, S, W, E, NE, NW, SE, SW, INVALID_DIRECTION};

/* error codes for Question 3 */
#define ERROR_START_STATION_INVALID -1
#define ERROR_ROUTE_ENDPOINT_IS_NOT_STATION -2
#define ERROR_LINE_HOPPING_BETWEEN_STATIONS -3
#define ERROR_BACKTRACKING_BETWEEN_STATIONS -4
#define ERROR_INVALID_DIRECTION -5
#define ERROR_OFF_TRACK -6
#define ERROR_OUT_OF_BOUNDS -7

/* pre-supplied function to load a tube map from a file*/
char** load_map(const char* filename, int& height, int& width);

/* pre-supplied function to print the tube map */
void print_map(char** m, int height, int width);

/* pre-supplied helper function to describe errors for Question 3 */
const char* error_description(int code);

/* presupplied helper function for converting string to Direction enum */
Direction string_to_direction(const char* token);


bool get_symbol_position(char** map, int height, int width, char target, int& r, int& c);

char get_symbol_for_station_or_line(const char* name);

bool get_symbol(const char* filename, const char* name, char& sym);

int validate_route(char** map, int height, int width, const char* start_station, char* route, char* destination);

bool is_route_valid(char* route);

bool is_out_bound(int height, int width, int row_now, int column_now);
bool is_off_track(char** map, int row, int column);

void move(char** map, int& row, int& column, char* direction);
bool is_backtrack(char* previous_direction, char* direction);
