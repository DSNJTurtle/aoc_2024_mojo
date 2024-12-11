from pathlib import Path, cwd
from os.path import join


fn read_file(filename: String) -> List[String]:
    try:
        var p = join(cwd().path, filename)
        with open(p, "r") as f:
            return f.read().splitlines()
    except e:
        print(e)

    return List[String]()


fn read_input() -> List[String]:
    return read_file("input.txt")


fn read_test() -> List[String]:
    return read_file("test.txt")


fn input_lines_to_ints(lines: List[String], split_at: String = " ") raises -> List[List[Int]]:
    var res = List[List[Int]]()
    for l in lines:
        var p = List[Int]()
        for x in str(l[]).split(split_at):
            if str(x[]) != split_at.strip():
                p.append(atol(str(x[])))

        res.append(p)

    return res
