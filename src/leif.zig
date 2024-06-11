pub usingnamespace @cImport({
    @cInclude("leif/leif.h");
});

const c = @cImport({
    @cInclude("leif/leif.h");
});
const std = @import("std");
const SourceLocation = std.builtin.SourceLocation;

/// Inline implementation of Leif's lf_begin macro using std.builtin.SourceLocation
pub inline fn zlf_begin(src: SourceLocation) void {
    c._lf_begin_loc(src.file, src.line);
}

pub inline fn zlf_div_begin(pos: c.vec2s, size: c.vec2s, scrollable: bool, src: SourceLocation) *c.LfDiv {
    const scroll_info = struct {
        var scroll: f32 = 0.0;
        var scroll_velocity: f32 = 0.0;
    };

    return c._lf_div_begin_loc(pos, size, scrollable, *scroll_info.scroll, *scroll_info.scroll_velocity, src.file, src.line);
}
