using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBases2_Cliente
{
    public partial class Client_Historial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbl_user.Text += Session["username"].ToString();

                loadHistorial();
            }
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogInScreen.aspx", false);
        }

        protected void btn_atras_Click(object sender, EventArgs e)
        {
            Response.Redirect("ClientMain.aspx", false);
        }

        private void loadHistorial()
        {
            int id = int.Parse(Session["idCliente"].ToString());
            /*
            string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
            string procedureName = "[Empresa].[dbo].[GetCantidadCompras]";
            SqlConnection con = new SqlConnection(Constr);
            SqlCommand cmd = new SqlCommand(procedureName, con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idCliente", id);

            con.Open();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();
            da.Fill(dataSet);

            con.Close();

            gv_historial.DataSource = dataSet;
            gv_historial.DataBind();

            da.Dispose();
            */
        }
    }
}