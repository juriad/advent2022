MODE FACE = STRUCT (
    INT number,
    INT offset row, INT offset col,
    INT size, REF [,] CHAR map,
    REF FACE right, INT bear right,
    REF FACE down, INT bear down,
    REF FACE left, INT bear left,
    REF FACE up, INT bear up
);

MODE POS = STRUCT (REF FACE face, INT row, col, bear);

PROC load face = ([][] CHAR lines, REF FACE face) VOID:
    BEGIN
        HEAP [size OF face, size OF face] CHAR map;
        FOR r TO (size OF face) DO
            FOR c TO (size OF face) DO
                map[r,c] := lines[offset row OF face + r][offset col OF face + c]
            OD
        OD;
        map OF face := map
    END;

PROC create small faces = ([][] CHAR lines) [] REF FACE:
    BEGIN
        # 0 = right, 1 = down, 2 = left, 3 = up #

        HEAP FACE f1 := (
            1, 0, 8, 4, NIL,
            NIL, 0, NIL, 1, NIL, 2, NIL, 3
        );
        HEAP FACE f2 := (
            2, 4, 0, 4, NIL,
            NIL, 0, NIL, 1, NIL, 2, NIL, 3
        );
        HEAP FACE f3 := (
            3, 4, 4, 4, NIL,
            NIL, 0, NIL, 1, NIL, 2, NIL, 3
        );
        HEAP FACE f4 := (
            4, 4, 8, 4, NIL,
            NIL, 0, NIL, 1, NIL, 2, NIL, 3
        );
        HEAP FACE f5 := (
            5, 8, 8, 4, NIL,
            NIL, 0, NIL, 1, NIL, 2, NIL, 3
        );
        HEAP FACE f6 := (
            6, 8, 12, 4, NIL,
            NIL, 0, NIL, 1, NIL, 2, NIL, 3
        );

        right OF f1 := f1;
        down OF f1 := f4;
        left OF f1 := f1;
        up OF f1 := f5;
        load face(lines, f1);

        right OF f2 := f3;
        down OF f2 := f2;
        left OF f2 := f4;
        up OF f2 := f2;
        load face(lines, f2);

        right OF f3 := f4;
        down OF f3 := f3;
        left OF f3 := f2;
        up OF f3 := f3;
        load face(lines, f3);

        right OF f4 := f2;
        down OF f4 := f5;
        left OF f4 := f3;
        up OF f4 := f1;
        load face(lines, f4);

        right OF f5 := f6;
        down OF f5 := f1;
        left OF f5 := f6;
        up OF f5 := f4;
        load face(lines, f5);

        right OF f6 := f5;
        down OF f6 := f6;
        left OF f6 := f5;
        up OF f6 := f6;
        load face(lines, f6);

        (f1, f2, f3, f4, f5, f6)
    END;


PROC create big faces = ([][] CHAR lines) [] REF FACE:
    BEGIN
        # 0 = right, 1 = down, 2 = left, 3 = up #

        HEAP FACE f1 := (
            1, 0, 50, 50, NIL,
            NIL, 0, NIL, 1, NIL, 2, NIL, 3
        );
        HEAP FACE f2 := (
            2, 0, 100, 50, NIL,
            NIL, 0, NIL, 1, NIL, 2, NIL, 3
        );
        HEAP FACE f3 := (
            3, 50, 50, 50, NIL,
            NIL, 0, NIL, 1, NIL, 2, NIL, 3
        );
        HEAP FACE f4 := (
            4, 100, 0, 50, NIL,
            NIL, 0, NIL, 1, NIL, 2, NIL, 3
        );
        HEAP FACE f5 := (
            5, 100, 50, 50, NIL,
            NIL, 0, NIL, 1, NIL, 2, NIL, 3
        );
        HEAP FACE f6 := (
            6, 150, 0, 50, NIL,
            NIL, 0, NIL, 1, NIL, 2, NIL, 3
        );

        right OF f1 := f2;
        down OF f1 := f3;
        left OF f1 := f2;
        up OF f1 := f5;
        load face(lines, f1);

        right OF f2 := f1;
        down OF f2 := f2;
        left OF f2 := f1;
        up OF f2 := f2;
        load face(lines, f2);

        right OF f3 := f3;
        down OF f3 := f5;
        left OF f3 := f3;
        up OF f3 := f1;
        load face(lines, f3);

        right OF f4 := f5;
        down OF f4 := f6;
        left OF f4 := f5;
        up OF f4 := f6;
        load face(lines, f4);

        right OF f5 := f4;
        down OF f5 := f1;
        left OF f5 := f4;
        up OF f5 := f3;
        load face(lines, f5);

        right OF f6 := f6;
        down OF f6 := f4;
        left OF f6 := f6;
        up OF f6 := f4;
        load face(lines, f6);

        (f1, f2, f3, f4, f5, f6)
    END;

PROC create small cube = ([] REF FACE faces) VOID:
    BEGIN
        REF FACE f1 = faces[1];
        REF FACE f2 = faces[2];
        REF FACE f3 = faces[3];
        REF FACE f4 = faces[4];
        REF FACE f5 = faces[5];
        REF FACE f6 = faces[6];

        right OF f1 := f6;
        bear right OF f1 := 2;
        down OF f1 := f4;
        bear down OF f1 := 1;
        left OF f1 := f3;
        bear left OF f1 := 1;
        up OF f1 := f2;
        bear up OF f1 := 1;

        right OF f2 := f3;
        bear right OF f2 := 0;
        down OF f2 := f5;
        bear down OF f2 := 3;
        left OF f2 := f6;
        bear left OF f2 := 3;
        up OF f2 := f1;
        bear up OF f2 := 1;

        right OF f3 := f4;
        bear right OF f3 := 0;
        down OF f3 := f5;
        bear down OF f3 := 0;
        left OF f3 := f2;
        bear left OF f3 := 2;
        up OF f3 := f1;
        bear up OF f3 := 0;

        right OF f4 := f6;
        bear right OF f4 := 1;
        down OF f4 := f5;
        bear down OF f4 := 1;
        left OF f4 := f3;
        bear left OF f4 := 2;
        up OF f4 := f1;
        bear up OF f4 := 3;

        right OF f5 := f6;
        bear right OF f5 := 0;
        down OF f5 := f2;
        bear down OF f5 := 3;
        left OF f5 := f3;
        bear left OF f5 := 3;
        up OF f5 := f4;
        bear up OF f5 := 3;

        right OF f6 := f1;
        bear right OF f6 := 2;
        down OF f6 := f2;
        bear down OF f6 := 0;
        left OF f6 := f5;
        bear left OF f6 := 2;
        up OF f6 := f4;
        bear up OF f6 := 2;

        SKIP
    END;

PROC create big cube = ([] REF FACE faces) VOID:
    BEGIN
        REF FACE f1 = faces[1];
        REF FACE f2 = faces[2];
        REF FACE f3 = faces[3];
        REF FACE f4 = faces[4];
        REF FACE f5 = faces[5];
        REF FACE f6 = faces[6];

        right OF f1 := f2;
        bear right OF f1 := 0;
        down OF f1 := f3;
        bear down OF f1 := 1;
        left OF f1 := f4;
        bear left OF f1 := 0;
        up OF f1 := f6;
        bear up OF f1 := 0;

        right OF f2 := f5;
        bear right OF f2 := 2;
        down OF f2 := f3;
        bear down OF f2 := 2;
        left OF f2 := f1;
        bear left OF f2 := 2;
        up OF f2 := f6;
        bear up OF f2 := 3;

        right OF f3 := f2;
        bear right OF f3 := 3;
        down OF f3 := f5;
        bear down OF f3 := 1;
        left OF f3 := f4;
        bear left OF f3 := 1;
        up OF f3 := f1;
        bear up OF f3 := 3;

        right OF f4 := f5;
        bear right OF f4 := 0;
        down OF f4 := f6;
        bear down OF f4 := 1;
        left OF f4 := f1;
        bear left OF f4 := 0;
        up OF f4 := f3;
        bear up OF f4 := 0;

        right OF f5 := f2;
        bear right OF f5 := 2;
        down OF f5 := f6;
        bear down OF f5 := 2;
        left OF f5 := f4;
        bear left OF f5 := 2;
        up OF f5 := f3;
        bear up OF f5 := 3;

        right OF f6 := f5;
        bear right OF f6 := 3;
        down OF f6 := f2;
        bear down OF f6 := 1;
        left OF f6 := f1;
        bear left OF f6 := 1;
        up OF f6 := f4;
        bear up OF f6 := 3;

        SKIP
    END;

PROC create cube = ([] REF FACE faces) VOID:
    BEGIN
        IF size OF faces[1] = 4 THEN
            create small cube(faces)
        ELSE
            create big cube(faces)
        FI
    END;

PROC go if possible = (POS next, POS pos) POS:
    BEGIN
        REF FACE face := face OF next;
        REF [,] CHAR map := map OF face;
        IF map[row OF next, col OF next] = "." THEN
            next
        ELSE
            pos
        FI
    END;

PROC go right = (POS pos) POS:
    BEGIN
        REF FACE face := face OF pos;
        INT size := size OF face;

        INT row := row OF pos;
        INT col := col OF pos;
        INT bear := bear OF pos;

        POS next;

        IF col < size THEN
            next := (face, row, col + 1, bear)
        ELIF col >= size THEN
            REF FACE f := right OF face;
            INT b := bear right OF face;
            IF b = 0 THEN
                next := (f, row, 1, b)
            ELIF b = 1 THEN
                next := (f, 1, size - row + 1, b)
            ELIF b = 2 THEN
                next := (f, size - row + 1, size, b)
            ELSE
                next := (f, size, row, b)
            FI
        FI;

        go if possible(next, pos)
    END;

PROC go down = (POS pos) POS:
    BEGIN
        REF FACE face := face OF pos;
        INT size := size OF face;

        INT row := row OF pos;
        INT col := col OF pos;
        INT bear := bear OF pos;

        POS next;

        IF row < size THEN
            next := (face, row + 1, col, bear)
        ELIF row >= size THEN
            REF FACE f := down OF face;
            INT b := bear down OF face;
            IF b = 0 THEN
                next := (f, size - col + 1, 1, b)
            ELIF b = 1 THEN
                next := (f, 1, col, b)
            ELIF b = 2 THEN
                next := (f, col, size, b)
            ELSE
                next := (f, size, size - col + 1, b)
            FI
        FI;

        go if possible(next, pos)
    END;

PROC go left = (POS pos) POS:
    BEGIN
        REF FACE face := face OF pos;
        INT size := size OF face;

        INT row := row OF pos;
        INT col := col OF pos;
        INT bear := bear OF pos;

        POS next;

        IF col > 1 THEN
            next := (face, row, col - 1, bear)
        ELIF col <= 1 THEN
            REF FACE f := left OF face;
            INT b := bear left OF face;
            IF b = 0 THEN
                next := (f, size - row + 1, 1, b)
            ELIF b = 1 THEN
                next := (f, 1, row, b)
            ELIF b = 2 THEN
                next := (f, row, size, b)
            ELSE
                next := (f, size, size - row + 1, b)
            FI
        FI;

        go if possible(next, pos)
    END;

PROC go up = (POS pos) POS:
    BEGIN
        REF FACE face := face OF pos;
        INT size := size OF face;

        INT row := row OF pos;
        INT col := col OF pos;
        INT bear := bear OF pos;

        POS next;

        IF row > 1 THEN
            next := (face, row - 1, col, bear)
        ELIF row <= 1 THEN
            REF FACE f := up OF face;
            INT b := bear up OF face;
            IF b = 0 THEN
                next := (f, col, 1, b)
            ELIF b = 1 THEN
                next := (f, 1, size - col + 1, b)
            ELIF b = 2 THEN
                next := (f, size - col + 1, size, b)
            ELSE
                next := (f, size, col, b)
            FI
        FI;

        go if possible(next, pos)
    END;

PROC go = (POS pos) POS:
    BEGIN
        INT bear := bear OF pos;
        POS new pos;

        IF bear = 0 THEN
            new pos := go right(pos)
        ELIF bear = 1 THEN
            new pos := go down(pos)
        ELIF bear = 2 THEN
            new pos := go left(pos)
        ELSE
            new pos := go up(pos)
        FI;

        new pos
    END;

PROC turn = (POS pos, INT t) POS:
    BEGIN
        (face OF pos, row OF pos, col OF pos, ((bear OF pos) + 4 + t) MOD 4)
    END;

PROC load faces = [] REF FACE:
    BEGIN
        [1000] STRING lines;
        INT cnt := 0;

        WHILE
            STRING line;
            read ((line, new line));
            ELEMS line > 0
        DO
            cnt +:= 1;
            lines[cnt] := line;
            # print ((line, new line)); #
            SKIP
        OD;

        [6] REF FACE faces;
        IF cnt = 12 THEN
            faces := create small faces(lines)
        ELSE
            faces := create big faces(lines)
        FI;
        faces
    END;

PROC load steps = [] INT:
    BEGIN
        STRING instr;
        INT step := 0;
        INT scnt := 1;

        read((instr, new line));
        # print((instr, new line)); #

        HEAP [ELEMS instr] INT steps;

        FOR i FROM (LWB instr) TO (UPB instr) DO
            # print((instr[i], new line)); #
            IF (instr[i] = "R") OR (instr[i] = "L") THEN
                IF step > 0 THEN
                    steps[scnt] := step;
                    scnt +:= 1;
                    step := 0
                FI;

                steps[scnt] := IF instr[i] = "R" THEN -3 ELSE -1 FI;
                scnt +:= 1
            ELSE
               step := step * 10 + (ABS instr[i]) - (ABS "0")
            FI
        OD;
        IF step > 0 THEN
            steps[scnt] := step;
            scnt +:= 1;
            step := 0
        FI;

        WHILE scnt <= UPB steps DO
            steps[scnt] := 0;
            scnt +:= 1
        OD;

        steps
    END;

PROC walk = ([] REF FACE faces, [] INT steps, POS pos) POS:
    BEGIN
        POS p := pos;

        FOR i FROM (LWB steps) TO (UPB steps) DO
            # print(("walk", steps[i], new line)); #
            IF steps[i] < 0 THEN
                p := turn(p, steps[i])
            ELSE
                TO steps[i] DO
                    p := go(p)
                OD
            FI;
            # print(("score", score(p), new line)); #
            SKIP
        OD;
        p
    END;

PROC score = (POS pos) INT:
    BEGIN
        FACE face := face OF pos;
        (row OF pos + offset row OF face) * 1000 + (col OF pos + offset col OF face) * 4 + (bear OF pos)
    END;

PROC print position = (POS pos) VOID:
    BEGIN
        print(("pos", number OF face OF pos, row OF pos, col OF pos, bear OF pos, new line))
    END;

BEGIN
    [] REF FACE faces = load faces();

    # print(("arg", argv(5), new line)); #

    IF argv(5) = "2" THEN
        create cube(faces)
    FI;

    [] INT steps = load steps();
    # print((ELEMS faces, ELEMS steps, new line)); #

    POS st := (faces[1], 1, 1, 0);
    POS end := walk(faces, steps, st);

    INT sc := score(end);
    print((sc, new line))
END
