const std = @import("std");
const leif = @import("leif.zig");
const c = @import("c.zig");

pub fn main() !void {
    _ = c.glfwInit();
    defer c.glfwTerminate();

    const window = c.glfwCreateWindow(800, 600, "Hello", null, null);
    defer c.glfwDestroyWindow(window);

    c.glfwMakeContextCurrent(window);

    leif.lf_init_glfw(800, 600, window);
    defer leif.lf_terminate();

    while (c.glfwWindowShouldClose(window) != c.GLFW_TRUE) {
        c.glClear(c.GL_COLOR_BUFFER_BIT);
        c.glClearColor(0.1, 0.1, 0.1, 1.0);

        leif.zlf_begin(@src());
        leif.lf_text("Hello, ZigLeif!");

        leif.lf_end();

        c.glfwSwapBuffers(window);
        c.glfwPollEvents();
    }
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
