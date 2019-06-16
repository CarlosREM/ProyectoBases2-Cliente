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
            if (!IsPostBack)
            {
                lbl_user.Text += Session["username"].ToString();
                if (Session["admin"].ToString().Equals("1"))
                    btn_admMode.Visible = true;
            }
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogInScreen.aspx");
        }

        protected void btn_admMode_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConsultorMain.aspx");
        }

        protected void chkBx_credito_CheckedChanged(object sender, EventArgs e)
        {
            if (chkBx_credito.Checked)
            {
                lbl_interes.Visible = true;
                cmBx_interes.Visible = true;
            }
            else
            {
                lbl_interes.Visible = false;
                cmBx_interes.Visible = false;
            }
        }

        protected void cmBx_metodoPago_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmBx_metodoPago.SelectedIndex == 1)
            {
                lbl_numTarjeta.Visible = true;
                txtBx_numTarjeta.Visible = true;
                lbl_codSeg.Visible = true;
                txtBx_codSeg.Visible = true;
                lbl_fechaVenc.Visible = true;
                txtBx_fechaVenc.Visible = true;
            }
            else
            {
                lbl_numTarjeta.Visible = false;
                txtBx_numTarjeta.Visible = false;
                lbl_codSeg.Visible = false;
                txtBx_codSeg.Visible = false;
                lbl_fechaVenc.Visible = false;
                txtBx_fechaVenc.Visible = false;
            }
        }
    }
}