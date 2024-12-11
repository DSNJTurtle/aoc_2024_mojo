from testing import assert_equal
from commons import read_input, read_test, input_lines_to_ints
from collections import Dict
from python import Python


def partA(lines: List[String]) -> Int:
    var line: String = ""
    for x in lines:
        line += x[]

    re = Python.import_module("re")
    p = re.compile(r"mul\([0-9]{1,3},[0-9]{1,3}\)")
    res = List[Int]()
    for x in p.findall(line):
        _x = str(x)
        _x = _x.replace("mul(", "").replace(")", "").replace(",", "*")
        parts = _x.split("*")
        prod = int(parts[0]) * int(parts[1])

        res.append(prod)

    sum = 0
    for x in res:
        sum += x[]

    return sum


fn partB(lines: List[String]) raises -> Int:
    var line: String = ""
    for x in lines:
        line += x[]

    re = Python.import_module("re")
    p = re.compile(r"mul\([0-9]{1,3},[0-9]{1,3}\)|do\(\)|don't\(\)")
    res = List[Int]()
    include = True
    for x in p.findall(line):
        _x = str(x)
        if _x.startswith("mul") and include:
            _x = _x.replace("mul(", "").replace(")", "").replace(",", "*")
            parts = _x.split("*")
            prod = int(parts[0]) * int(parts[1])
            res.append(prod)
        elif _x == "do()":
            include = True
        elif _x == "don't()":
            include = False
        else:
            continue

    sum = 0
    for x in res:
        sum += x[]

    return sum


fn main() raises:
    print("part A")
    assert_equal(partA(read_input()), 179571322)
    # assert_equal(partA(read_test()), 161)

    print("part B")
    assert_equal(partB(read_input()), 103811193)
    assert_equal(partB(read_test()), 48)
