using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Razor;
using MVCReizen.Repositories;
using MVCReizen.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddTransient<BoekingService>();
builder.Services.AddTransient<ReisService>();
builder.Services.AddTransient<WerelddeelService>();
builder.Services.AddTransient<IKlantRepository,
 SQLKlantRepository>();
builder.Services.AddTransient<IBestemmingRepository,
 SQLBestemmingRepository>();
builder.Services.AddTransient<IBoekingsRepository,
 SQLBoekingRepository>();
builder.Services.AddTransient<IReisRepository,
 SQLReisRepository>();
builder.Services.AddTransient<IWerelddeelRepository,
 WerelddeelRepository>();
builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<ReizenContext>(options =>
 options.UseSqlServer(
 builder.Configuration.GetConnectionString("ReizenConnection")));
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
