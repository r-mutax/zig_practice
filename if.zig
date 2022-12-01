const expect = @import("std").testing.expect;

test "if statement" {
    const a = true;
    var x: u16 = 0;

    // if文にはbool値しかわたせない。
    // if (!x) {
    //     try expect(false);
    // }

    if(a) {
        x = 10;
    } else {
        x = 20;
    }

    try expect(x == 10);

    // if式も使える。
    var y: u16 = if(a) 1 else 2;
    try expect(y == 1);
}