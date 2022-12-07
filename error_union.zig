const expect = @import("std").testing.expect;

const TestError = error {
    Error_1,
};

test "error union" {
    // ! で連結することでError Unionにできる。
    const not_err : TestError ! u16 = 16;
    const err : TestError ! u16 = TestError.Error_1;

    // A catch B 構文は、AがエラーならBとして評価される。
    // AがエラーじゃないならAとして評価される。
    const not_catch_err = not_err catch 0;
    const catch_err = err catch 10;

    try expect(not_catch_err == 16);
    try expect(catch_err == 10);
}

fn returnErrorUnion() error {Ooops} ! void {
    return error.Ooops;
}

test "return error" {
    // Error Unionを返す関数で |err| でエラーの値を受け取れる。
    returnErrorUnion() catch |err| {

        // try は x catch |err| return err の短縮形
        // tryとcatchはよくあるtry-catch構文とは違う。
        try expect(err == error.Ooops);
    };
}