const expect = @import("std").testing.expect;

test "defer" {
    var x: f32 = 5;
    {

        // 同一のブロック内で複数のdeferがあった場合、逆順に処理をする。
        defer x += 2;
        defer x /= 2;
        
        // deferをつけた式は、ブロックを抜けるまで評価されない
        try expect(x == 5);
    }

    // ここでは(5 + 2) / 2 = 3.5 ではなく、
    // (5 / 2) + 2 = 4.5として評価される
    try expect(x == 4.5);
}