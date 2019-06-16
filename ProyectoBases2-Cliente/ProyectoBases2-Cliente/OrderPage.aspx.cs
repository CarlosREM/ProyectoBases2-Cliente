using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBases2_Cliente
{
    public partial class OrderPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }
            else
            {
                lbl_user.Text += Session["username"].ToString();
            }
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogInScreen.aspx", false);
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("ClientMain.aspx", false);
        }

        protected void btn_order_Click(object sender, EventArgs e)
        {
            string marca = txtBx_marca.Text,
                   modelo = txtBx_modelo.Text,
                   anho = txtBx_anho.Text;

            if (marca.Equals("") | modelo.Equals("") | anho.Equals(""))
                MessageBox.Show("Todos los campos deben ser llenados.");
            else
            {
                try
                {
                    //codigo de SQL


                    string fechaEntrega = "";
                    MessageBox.Show_Redirect("Pedido registrado exitosamente.\nFecha de entrega estimada: " + fechaEntrega,
                                             "ClientMain.aspx");
                }
                catch
                {
                    MessageBox.Show("Ocurrió un error al registrar el pedido. Inténtelo nuevamente.");
                }
            }
        }
    }
}