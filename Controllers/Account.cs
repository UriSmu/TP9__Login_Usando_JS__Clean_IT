using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP9__Login_Usando_JS__Clean_IT.Models;

namespace TP9__Login_Usando_JS__Clean_IT.Controllers;

public class Account : Controller
{
    private readonly ILogger<Account> _logger;

    public Account(ILogger<Account> logger)
    {
        _logger = logger;
    }

    [HttpGet]
    public IActionResult Registrar()
    {
        return View();
    }

    [HttpPost]
    public IActionResult Registrar(string username, string nombre, string apellido, string email, string telefono, string documento, string contraseña)
    {
        int resultado = BD.InsertarUsuario(username, nombre, apellido, email, telefono, documento, contraseña);

        if (resultado == 1)
        {
            ViewBag.MensajeExito = "Registro exitoso. Ahora puedes iniciar sesión.";
            return RedirectToAction("IniciarSesion");
        }
        else
        {
            ViewBag.MensajeError = "El correo electrónico ya está registrado.";
            return View();
        }
    }

    [HttpGet]
    public IActionResult IniciarSesion()
    {
        return View();
    }

    [HttpPost]
    public IActionResult IniciarSesion(string inicio, string contraseña)
    {
        int resultado = BD.IniciarSesion(inicio, contraseña);

        if (resultado == 1)
        {
            ViewBag.MensajeExito = "Inicio de sesión exitoso.";
            return RedirectToAction("Index", "HomeController");
        }
        else
        {
            ViewBag.MensajeError = "Credenciales incorrectas.";
            return View();
        }
    }

    [HttpGet]
    public IActionResult OlvideMiContraseña()
    {
        return View();
    }

    [HttpPost]
    public IActionResult OlvideMiContraseña(string inicio)
    {
        string preguntaSeguridad = BD.ObtenerPreguntaDeSeguridad(inicio);

        if (preguntaSeguridad != null)
        {
            ViewBag.PreguntaSeguridad = preguntaSeguridad;
            ViewBag.Inicio = inicio;
            return RedirectToAction("ResponderPreguntaSeguridad", new { inicio = inicio, pregunta = preguntaSeguridad });
        }
        else
        {
            ViewBag.MensajeError = "No se encontró un usuario con esas credenciales.";
            return View();
        }
    }

    [HttpGet]
    public IActionResult ResponderPreguntaSeguridad(string inicio, string pregunta)
    {
        ViewBag.PreguntaSeguridad = pregunta;
        ViewBag.Inicio = inicio;
        return View();
    }

    [HttpPost]
    public IActionResult ResponderPreguntaSeguridad(string inicio, string respuestaSeguridad, string nuevaContraseña)
    {
        bool resultado = BD.RestablecerContraseña(inicio, respuestaSeguridad, nuevaContraseña);

        if (resultado)
        {
            ViewBag.MensajeExito = "Contraseña restablecida con éxito.";
            return RedirectToAction("IniciarSesion");
        }
        else
        {
            ViewBag.MensajeError = "La respuesta de seguridad es incorrecta.";
            return View();
        }
    }
}