const expect = @import("std").testing.expect;

// エラーは宣言してconst変数に入れて使う（名前を付ける）
const FileOpenError = error {
    AccessDenied,
    OutOfMemory,
    FileNotFound,
};


// エラーセットはスーパーセットにキャストできる。
// ↓の例でいうと、FileOpenError.OutOfMemoryを抽出した
// AllocationErrorをerrに代入する際にキャストされている。
const AllocationError = error{OutOfMemory};

test "coerce error from a subset to a superset" {
    const err: FileOpenError = AllocationError.OutOfMemory;
    try expect(err == FileOpenError.OutOfMemory);
    try expect(@TypeOf(err) == FileOpenError);
}