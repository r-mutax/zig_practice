const expect = @import("std").testing.expect;

test "while" {
    var i: u8 = 2;
    while (i < 10){
        i *= 2;
    }
    try expect(i == 16);

    i = 1;
    var sum: u8 = 0;
    // 継続式もかける。
    while (i <= 10) : (i += 1){
        sum += i;
    }
    try expect(sum == 55);

    i = 1;
    sum = 0;
    while(i < 10) : (i += 1){
        // breakも使える
        if(i == 3) break;
        sum += i;
    }
    try expect(sum == 3);

    i = 1;
    sum = 0;
    while(i < 10) : (i += 1){
        // continueも使える
        if (i % 2 == 0) continue;
        sum += i;
    }
    try expect(sum == 25);
}
