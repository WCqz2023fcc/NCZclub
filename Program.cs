var builder = WebApplication.CreateBuilder(args);

// 注意：这里不要添加 AddRazorPages()，避免默认页面和隐私协议
var app = builder.Build();

// 启用静态文件中间件，让 wwwroot 下的 HTML、CSS、图片等可以被访问
app.UseStaticFiles();

// 配置默认路由：访问网站根目录时，自动跳转到 index.html
app.MapGet("/", async context =>
{
    context.Response.Redirect("/index.html");
});

app.Run();
