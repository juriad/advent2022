tree = [`dirs = [], `files = [], `size = 0]
inside = tree

fn file(line) {
    for i=0, line(i) != 32, i++ {
        1
        # print line(i)
    }
    return [`size=atoi(line(0, i)), `name=line(i+1,len(line))]
}

while line = get() {
    print line
    if line(0,1) == "$" {
	    print line

	    if line == "$ cd /" {
	        # print "> cd /"
	        inside = tree
	    } line == "$ cd .." {
	        # print "> cd .."
            inside = inside.parent
	    } line(0, 5) == "$ cd " {
	        # print "> cd x"
	        d = line(5, len(line))
            inside = inside.dirs(d)
	    } line == "$ ls" {
	        print "> ls"
            1
	    } {
	        print "error"
	    }
    } line(0,4) == "dir " {
        # print ". dir"
        d = line(4, len(line))
        inside.dirs(d) = [`dirs = [], `files = [], `size = 0, `parent=inside]
        # print d
    } {
        # print ". file"
        f = file(line)
        inside.files(f.name) = f.size

        for d = inside, d, d = d.parent {
            d.size += f.size
        }
    }
    print "next"
}

# print tree

fn sum_small(tr, max) {
    sum = 0

    if tr.size <= max {
        sum += tr.size
    }

    foreach d tr.dirs {
        sum += sum_small(d, max)
    }

    return sum
}

print sum_small(tree, 100000)

fn smallest_delete(tr, missing) {
    if tr.size < missing {
        return -1
    } {
        smallest = tr.size
        foreach d tr.dirs {
            s = smallest_delete(d, missing)
            if s > missing && s < smallest {
                smallest = s
            }
        }
        return smallest
    }
}

print smallest_delete(tree, tree.size + 30000000 - 70000000)
