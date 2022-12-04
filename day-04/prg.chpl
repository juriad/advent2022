use FileSystem;
use IO;
use List;

proc readLines(filename: string) {
    var f = open(filename, iomode.r);

    var lines: list(2*range, parSafe=true);
    for line in f.lines() {
        // write("Read line: ", line);
        var (e1, c, e2) = line.partition(",");
        var (e1l, d1, e1u) = e1.partition("-");
        var (e2l, d2, e2u) = e2.partition("-");
        lines.append((e1l:int .. e1u:int, e2l:int .. e2u:int));
    }
    f.close();

    return lines;
}

proc main(args: [] string) {
    var lines = readLines(args[1]);

    var contained = 0;
    var intersected = 0;

    coforall (e1, e2) in lines with (+ reduce contained, + reduce intersected) {
        if (e1[e2] == e1 || e2[e1] == e2) {
            // write("Contained: ", e1, " and ", e2, "\n");
            contained += 1;
        }
        if (! e1[e2].isEmpty()) {
            // write("Intersected: ", e1, " and ", e2, "\n");
            intersected += 1;
        }
    }

    write("Contained: ", contained, "\n");
    write("Intersected: ", intersected, "\n");
}
