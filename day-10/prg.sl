% printf("Hello %s!\n", __argv[1]);

variable f = fopen(__argv[1], "r");
variable lines = fgetslines(f);
() = fclose(f);

% printf("L %d\n",  length (lines));

variable mem = Integer_Type [length(lines) * 2];
mem[0] = 1;

variable l = 0;
variable ptr = 0;

while (l < length(lines)) {
    variable line = lines[l];
    if (line[0] == 'n') {
        ptr++;
        mem[ptr] = mem[ptr - 1];
    } else if (line[0] == 'a') {
        ptr++;
        mem[ptr] = mem[ptr - 1];
        ptr++;
        mem[ptr] = mem[ptr - 1] + atoi(substr(line, 5, -1));
    } else {
        printf("Error line: %s", line);
    }

    l++;
}

% l = 0;
% while (l < length(mem)) {
%    printf("%d: %d\n", l, mem[l]);
%    l++;
% }

variable s = 0;
variable arr = [20, 60, 100, 140, 180, 220];
variable i;
foreach i (arr) {
    s += i * mem[i - 1];
}

printf("Sum: %d\n", s);

variable x = 0;
variable y = 0;

i = 1;
_for y (0, 5, 1) {
    _for x (0, 39, 1) {
        if (mem[i - 1] + 1 >= x && mem[i - 1] - 1 <= x) {
            printf("#");
        } else {
            printf(".");
        }
        i++;
    }
    printf("\n");
}
