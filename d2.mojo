from testing import assert_equal
from commons import read_input, read_test, input_lines_to_ints
from collections import Dict


fn is_report_safe(report: List[Int]) -> Bool:
    # consecutive differences
    var diff = List[Int]()
    for i in range(1, len(report)):
        diff.append(report[i] - report[i - 1])

    # check for same montonous behaviour
    var all_negative = True
    var all_positive = True
    var all_in_range = True
    for x in diff:
        all_negative &= x[] < 0
        all_positive &= x[] > 0
        all_in_range &= (abs(x[]) >= 1) and (abs(x[]) <= 3)

    return (all_negative or all_positive) and all_in_range


fn partA(lines: List[String]) raises -> Int:
    var int_lines = input_lines_to_ints(lines)

    var n_safe_levels = 0
    for report in int_lines:
        if is_report_safe(report[]):
            n_safe_levels += 1

    return n_safe_levels


fn partB(lines: List[String]) raises -> Int:
    var int_lines = input_lines_to_ints(lines)

    var n_safe_levels = 0
    for report in int_lines:
        var safe_reports = List(is_report_safe(report[]))

        # array without one element
        for i in range(len(report[])):
            var new_report = List[Int]()
            for j in range(len(report[])):
                if i != j:
                    new_report.append(report[][j])

            safe_reports.append(is_report_safe(new_report))

        var any_safe = False
        for x in safe_reports:
            any_safe |= x[]

        if any_safe:
            n_safe_levels += 1

    return n_safe_levels


fn main() raises:
    print("part A")
    assert_equal(partA(read_input()), 411)
    assert_equal(partA(read_test()), 2)

    print("part B")
    assert_equal(partB(read_input()), 465)
    assert_equal(partB(read_test()), 4)
