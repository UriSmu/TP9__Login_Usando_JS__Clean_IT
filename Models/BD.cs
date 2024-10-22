using System;
using System.Data.SqlClient;
using Dapper;

namespace TP9__Login_Usando_JS__Clean_IT.Models;

static public class BD
{
    private static string _connectionString = @"Server=localhost; DataBase=Clean_IT; Trusted_Connection=True;";

    public static int InsertarUsuario(string usuario, string nombre, string apellido, string email, string telefono, string documento, string contraseña)
    {
        string sql = "IF (SELECT COUNT(Email) FROM Usuarios WHERE Email = @pEmail) != 0 begin SELECT 0 end; ELSE (INSERT INTO Usuarios(Username, Nombre, Apellido, Email, Telefono, Documento, Contrasenia) VALUES (@pUsuario, @pNombre, @pApellido, @pEmail, @pTelefono, @pDocumento, @pContrasenia)) and (SELECT 1)"; 
        
        int verificacion;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            verificacion = db.QueryFirstOrDefault<int>(sql, new{pUsuario = usuario, pNombre = nombre, pApellido = apellido, pEmail = email, pTelefono = telefono, pDocumento = documento, pContrasenia = contraseña});
        }       
        return verificacion;
    }

    public static int IniciarSesion(string inicio, string contraseña)
    {
        string sql = "IF (SELECT COUNT(Username) FROM Usuarios WHERE )"
    }
}
