using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;

namespace ProyectoBases2_Cliente
{
    public partial class LogInScreen : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            if (!verificarDatosCompletos())
            {
                MessageBox.Show("Faltan datos.");
                return;
            }
            string user = txtBx_username.Text,
                   password = txtBx_password.Text,
                   userType = cmBx_userType.Text;

            int userResult = LogIn(user, password, userType); //aqui va la funcion de LogIn (esta mas abajo)

            //de aqui en adelante se puede cambiar la parte de los codigos
            //para que correspondan al tipo de usuario que es.

            if (userResult > 0)
            {
                Session["username"] = user;
                if (userResult == 2)
                    Session["admin"] = "1";
                else
                    Session["admin"] = "0";
            }

            switch (userResult)
            {
                case 1:
                    Response.Redirect("ClientMain.aspx",false);
                    break;

                case 2:
                    Response.Redirect("ConsultorMain.aspx", false); //aqui es la pantalla del admin
                    break;

                case 3:
                    Response.Redirect("FacturadorMain.aspx", false);
                    break;

                case 4:
                    Response.Redirect("ConsultorMain.aspx", false);
                    break;

                default:
                    lbl_credError.Text = "! Error de credenciales ! Verifique e intente de nuevo.";
                    break;
            }

            if (!lbl_credError.Visible)
                lbl_credError.Visible = true;
        }

        private int temp_LogIn(string user, string password, string userType)
        {
            int result = 0;
            if (userType.Equals("Cliente") & user.Equals("cliente") & password.Equals("C"))
                result = 1;

            else if (userType.Equals("Empleado"))
            {
                if (user.Equals("admin") & password.Equals("a"))
                    result = 2;

                else if (user.Equals("facturador") & password.Equals("f"))
                    result = 3;

                else if (user.Equals("consulta") & password.Equals("c"))
                    result = 4;
            }

            return result;
        }

        private int LogIn(string user, string password, string userType)
        {
            int typeID = 0;
            string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
            if (userType.Equals("Cliente"))
            {
                string procedureName = "[Empresa].[dbo].[spVerificarCliente]";
                SqlConnection con = new SqlConnection(Constr);
                SqlCommand cmd = new SqlCommand(procedureName, con);
                SqlDataReader reader = null;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@username", user);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.Add(new SqlParameter("@idCliente", SqlDbType.Int));
                cmd.Parameters["@idCliente"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add(new SqlParameter("@nombre", SqlDbType.VarChar, 50));
                cmd.Parameters["@nombre"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add(new SqlParameter("@apellido", SqlDbType.VarChar, 50));
                cmd.Parameters["@apellido"].Direction = ParameterDirection.Output;

                SqlParameter returnParam = cmd.Parameters.Add("@return_value", SqlDbType.Int);
                returnParam.Direction = ParameterDirection.ReturnValue;

                con.Open();

                reader = cmd.ExecuteReader();

                typeID = int.Parse(cmd.Parameters["@return_value"].Value.ToString());
                con.Close();

                if(typeID == 1)
                {
                    string nombre = cmd.Parameters["@nombre"].Value.ToString();
                    string apellido = cmd.Parameters["@apellido"].Value.ToString();
                    int idCliente = int.Parse(cmd.Parameters["@idCliente"].Value.ToString());

                    Session["nombreCliente"] = nombre;
                    Session["apellidoCliente"] = apellido;
                    Session["idCliente"] = idCliente;
                }

                Debug.WriteLine("Return value: " + typeID);

            }
            else if (userType.Equals("Empleado"))
            {
                string procedureName = "[Empresa].[dbo].[spVerificarEmpleado]";
                SqlConnection con = new SqlConnection(Constr);
                SqlCommand cmd = new SqlCommand(procedureName, con);
                SqlDataReader reader = null;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@username", user);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.Add(new SqlParameter("@idEmpleado", SqlDbType.Int));
                cmd.Parameters["@idEmpleado"].Direction = ParameterDirection.Output;
               
                SqlParameter returnParam = cmd.Parameters.Add("@return_value", SqlDbType.Int);
                returnParam.Direction = ParameterDirection.ReturnValue;

                con.Open();

                reader = cmd.ExecuteReader();

                typeID = int.Parse(cmd.Parameters["@return_value"].Value.ToString());
                con.Close();

                if(typeID > 0)
                {
                    Session["idEmpleado"] = typeID;
                }

                Debug.WriteLine("Return value: " + typeID);
            }

            return typeID;
        }

        private Boolean verificarDatosCompletos()
        {
            if (txtBx_username.Text.Equals("") || txtBx_password.Text.Equals(""))
            {
                return false;
            }
            return true;
        }
    }
}