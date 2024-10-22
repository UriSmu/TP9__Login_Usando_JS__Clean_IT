using System;
using System.Data.SqlClient;
using Dapper;

namespace TP9__Login_Usando_JS__Clean_IT.Models;

static public class BD
{
    private static string _connectionString = @"Server=localhost; DataBase=Clean_IT; Trusted_Connection=True;";

    public static int InsertarUsuario(string usuario, string nombre, string apellido, string email, string telefono, string documento, string contraseña)
    {
        string sql = @"
            IF (SELECT COUNT(1) FROM Usuarios WHERE Email = @pEmail) = 0
            BEGIN
                INSERT INTO Usuarios (Username, Nombre, Apellido, Email, Telefono, Documento, Contrasenia)
                VALUES (@pUsuario, @pNombre, @pApellido, @pEmail, @pTelefono, @pDocumento, @pContrasenia)
                SELECT 1
            END
            ELSE
            BEGIN
                SELECT 0
            END";

        int resultado;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            resultado = db.QueryFirstOrDefault<int>(sql, new {pUsuario = usuario, pNombre = nombre, pApellido = apellido, pEmail = email, pTelefono = telefono, pDocumento = documento, pContrasenia = contraseña});
        }
        return resultado;
    }

    public static int IniciarSesion(string inicio, string contraseña)
    {
        string sql = @"
            IF EXISTS (SELECT 1 FROM Usuarios WHERE (Email = @pInicio OR Username = @pInicio) AND Contrasenia = @pContrasenia)
            BEGIN
                SELECT 1
            END
            ELSE
            BEGIN
                SELECT 0
            END";

        int resultado;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            resultado = db.QueryFirstOrDefault<int>(sql, new{pInicio = inicio, pContrasenia = contraseña});
        }
        return resultado;
    }


    public static string ObtenerPreguntaDeSeguridad(string inicio)
    {
        string sql = @"
            SELECT ps.Texto_Pregunta 
            FROM PreguntasDeSeguridad ps
            INNER JOIN UsuariosPreguntas up ON ps.IdPregunta = up.IdPregunta
            INNER JOIN Usuarios u ON u.IdUsuario = up.IdUsuario
            WHERE u.Email = @pInicio OR u.Username = @pInicio";

        string preguntaSeguridad;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            preguntaSeguridad = db.QueryFirstOrDefault<string>(sql, new { pInicio = inicio });
        }

        return preguntaSeguridad;
    }


    public static bool RestablecerContraseña(string inicio, string respuestaSeguridad, string nuevaContraseña)
        {
            string sqlVerificarRespuesta = @"
                SELECT COUNT(1) 
                FROM RespuestasPreguntas rp
                INNER JOIN Usuarios u ON u.IdUsuario = rp.IdUsuario
                WHERE (u.Email = @pInicio OR u.Username = @pInicio) 
                AND rp.Texto_Respuesta = @pRespuestaSeguridad";

            bool esRespuestaCorrecta;
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                esRespuestaCorrecta = db.QueryFirstOrDefault<int>(sqlVerificarRespuesta, new
                {
                    pInicio = inicio,
                    pRespuestaSeguridad = respuestaSeguridad
                }) == 1;
            }

            if (esRespuestaCorrecta)
            {
                string sqlActualizarContraseña = @"
                    UPDATE Usuarios
                    SET Contrasenia = @pNuevaContrasenia
                    WHERE Email = @pInicio OR Username = @pInicio";

                using (SqlConnection db = new SqlConnection(_connectionString))
                {
                    db.Execute(sqlActualizarContraseña, new
                    {
                        pNuevaContrasenia = nuevaContraseña,
                        pInicio = inicio
                    });
                }
                return true;
            }
            return false;
        }

}
