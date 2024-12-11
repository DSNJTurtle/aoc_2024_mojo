from testing import assert_equal
from commons import read_input, read_test
from collections import Dict


fn get_input(lines: List[String]) raises -> Tuple[List[Int], List[Int]]:
    var lhs = List[Int]()
    var rhs = List[Int]()
    for l in lines:
        var p = List[Int]()
        for x in str(l[]).split(" "):
            if str(x[]) != "":
                p.append(atol(str(x[])))

        lhs.append(p[0])
        rhs.append(p[1])

    sort(lhs)
    sort(rhs)

    return Tuple(lhs, rhs)


fn partA(lines: List[String]) raises -> Int:
    var lr = get_input(lines)

    var res: Int = 0
    for i in range(len(lr[0])):
        var x = lr[0][i]
        var y = lr[1][i]
        res += max(x, y) - min(x, y)

    return res


fn partB(lines: List[String]) raises -> Int:
    var lr = get_input(lines)

    var d = Dict[Int, Int]()
    for x in lr[0]:
        d[x[]] = 0

    for x in lr[1]:
        var _x = x[]
        var y = d.get(_x)
        if y:
            d[_x] = y.value() + 1
        else:
            d[_x] = 1

    var res: Int = 0
    for n in lr[0]:
        res += n[] * d[n[]]

    return res


fn main() raises:
    print("part A")
    assert_equal(partA(read_input()), 1889772)
    assert_equal(partA(read_test()), 11)

    print("part B")
    assert_equal(partB(read_input()), 23228917)
    assert_equal(partB(read_test()), 31)
