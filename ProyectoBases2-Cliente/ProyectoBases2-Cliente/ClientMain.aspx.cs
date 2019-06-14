using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBases2_Cliente
{
    public partial class ClientMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_user.Text += Session["username"].ToString();
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogInScreen.aspx");
        }
    }
}