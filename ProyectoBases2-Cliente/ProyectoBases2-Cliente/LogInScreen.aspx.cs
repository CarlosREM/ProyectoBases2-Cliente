using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;

namespace ProyectoBases2_Cliente
{
    public partial class LogInScreen : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            string user = txtBx_username.Text,
                   password = txtBx_password.Text,
                   userType = cmBx_userType.Text;

            int userResult = temp_LogIn(user, password, userType); //aqui va la funcion de LogIn (esta mas abajo)

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
                    Response.Redirect("ClientMain.aspx");
                    break;

                case 2:
                    Response.Redirect("ConsultorMain.aspx");
                    break;

                case 3:
                    Response.Redirect("FacturadorMain.aspx");
                    break;

                case 4:
                    Response.Redirect("ConsultorMain.aspx");
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
            //aqui va todo lo de SQL

            return 0;
        }
    }
}