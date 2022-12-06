const expect = @import("std").testing.expect;

// 関数はcamelCaseで書く慣習らしい
fn add(x: u32, y: u32) u32 {
    // 関数の引数はimmutableなので変更するとコンパイルエラー
    // x = 5;
    return x + y;
}

test "function" {
    const y = add(3, 5);

    // 関数の戻り値は破棄できない。
    // 破棄したい場合は'_' に代入する。
    _ = add(3, 5);

    try expect(@TypeOf(y) == u32);
    try expect(y == 8);
}
