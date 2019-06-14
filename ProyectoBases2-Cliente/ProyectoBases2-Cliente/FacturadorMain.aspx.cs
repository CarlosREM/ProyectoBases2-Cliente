using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBases2_Cliente
{
    public partial class FacturadorMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_user.Text += Session["username"].ToString();
            if (Session["admin"].ToString().Equals("1"))
                btn_admMode.Visible = true;
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogInScreen.aspx");
        }

        protected void btn_admMode_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConsultorMain.aspx");
        }
    }
}