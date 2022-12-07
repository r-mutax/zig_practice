const expect = @import("std").testing.expect;

var data: u32 = 0;

fn getData(x: bool) error{Oops} ! u32 {
    // 関数からエラーで帰るときに評価される
    errdefer data = 1;

    // 引数がfalseならエラーを返す
    if(x){
        return 5;
    } else {
        return error.Oops;
    }
}

test "errdefer" {
    // 正常終了なのでerrdeferは評価されず、
    // data == 0
    const nmlptn = getData(true) catch 0;
    try expect(data == 0);
    try expect(nmlptn == 5);

    // エラーを返したので、errdeferが評価され、
    // data == 1
    const errptn = getData(false) catch 0;
    try expect(data == 1);
    try expect(errptn == 0);
}

const FileError = error { NotFound, WriteError };
const MemoryError = error { AccessDenied, CannotAllocate };
const AllError = FileError || MemoryError;