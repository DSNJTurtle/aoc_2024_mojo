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
