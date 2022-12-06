const expect = @import("std").testing.expect;

test "For statement" {
   const string = [_]u8 {'a', 'b', 'c'};


    // forは配列をイテレートする。range based forみたいなもの？
    // もう少し読み進めると違うタイプが紹介される
    // | data, index | -> dataが配列の要素、indexに添字をキャプチャできる
    for (string) |character, index| {
        _ = character;
        _ = index;
    }

    // indexは省略できる
    for (string) |character| {
        _ = character;
    }

    // dataの方は省略できない。省略したいなら、'_'で捨てる必要がある。
    for(string) |_, index | {
        _ = index;
    }

    // dataもindexも両方捨てることもできる
    for(string) |_| {}
}