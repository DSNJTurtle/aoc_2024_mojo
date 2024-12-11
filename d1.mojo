from testing import assert_equal
from commons import read_input, read_test, input_lines_to_ints
from collections import Dict


fn partA(lines: List[String]) raises -> Int:
    var int_lines = input_lines_to_ints(lines)
    var lhs = List[Int]()
    var rhs = List[Int]()
    for x in int_lines:
        lhs.append(x[][0])
        rhs.append(x[][1])

    sort(lhs)
    sort(rhs)

    var res: Int = 0
    for i in range(len(lhs)):
        var x = lhs[i]
        var y = rhs[i]
        res += max(x, y) - min(x, y)

    return res


fn partB(lines: List[String]) raises -> Int:
    # var lr = get_input(lines)
    var int_lines = input_lines_to_ints(lines)

    var d = Dict[Int, Int]()
    for x in int_lines:
        d[x[][0]] = 0

    for x in int_lines:
        var _x = x[][0]
        var _y = x[][1]
        var y = d.get(_y)
        if y:
            d[_y] = y.value() + 1
        else:
            d[_y] = 1

    var res: Int = 0
    for n in int_lines:
        res += n[][0] * d[n[][0]]

    return res


fn main() raises:
    print("part A")
    assert_equal(partA(read_input()), 1889772)
    assert_equal(partA(read_test()), 11)

    print("part B")
    assert_equal(partB(read_input()), 23228917)
    assert_equal(partB(read_test()), 31)
