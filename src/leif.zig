pub usingnamespace @cImport({
    @cInclude("leif/leif.h");
});

const c = @cImport({
    @cInclude("leif/leif.h");
});
const std = @import("std");

pub inline fn lf_init(src: std.builtin.SourceLocation) void {
    c._lf_begin_loc(src.file, src.line);
}
