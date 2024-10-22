using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP9__Login_Usando_JS__Clean_IT.Models;

namespace TP9__Login_Usando_JS__Clean_IT.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }
}
