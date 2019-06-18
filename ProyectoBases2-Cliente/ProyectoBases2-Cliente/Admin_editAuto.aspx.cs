using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBases2_Cliente
{
    public partial class Admin_editAuto : System.Web.UI.Page
    {
        static string nombreSucursal;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbl_user.Text += Session["username"].ToString();
                btn_admMode.Visible = true;
                nombreSucursal = Session["nombreSucursal"].ToString();
            }
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogInScreen.aspx");
        }

        protected void btn_admMode_Click(object sender, EventArgs e)
        {
            Response.Redirect("FacturadorMain.aspx");
        }

        protected void btn_atras_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConsultorMain.aspx", false);
        }

        protected void btn_findAuto_Click(object sender, EventArgs e)
        {
            string id = txtBx_autoID.Text;

            if (id.Equals(""))
                MessageBox.Show("Introduzca una ID de inventario válida.");
            else
            {
                try
                {
                    string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
                    string procedureName = "[Empresa].[dbo].[FiltrarAutosSucursal]";
                    SqlConnection con = new SqlConnection(Constr);
                    SqlCommand cmd = new SqlCommand(procedureName, con);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@nombreSucursal", nombreSucursal);
                    cmd.Parameters.AddWithValue("@idTargetInventario", int.Parse(id));

                    SqlParameter returnParam = cmd.Parameters.Add("@return_value", SqlDbType.Int);
                    returnParam.Direction = ParameterDirection.ReturnValue;

                    con.Open();

                    using (SqlDataReader read = cmd.ExecuteReader())
                    {
                        while (read.Read())
                            txtBx_caracteristicas.Text = (read["caracteristicas"].ToString());
                    }
                    con.Close();
                }
                catch(Exception ex)
                {
                    Debug.WriteLine("findAuto: " + ex.ToString());
                }
            }
        }

        protected void btn_toAgregar_Click(object sender, EventArgs e)
        {
            pnl_agregar.Visible = (pnl_agregar.Visible) ? false : true;
        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {

        }

        protected void btn_toEditar_Click(object sender, EventArgs e)
        {
            pnl_editar.Visible = (pnl_editar.Visible) ? false : true;
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {

        }

        protected void btn_toBorrar_Click(object sender, EventArgs e)
        {
            pnl_borrar.Visible = (pnl_borrar.Visible) ? false : true;
        }

        protected void btn_borrar_Click(object sender, EventArgs e)
        {

        }



        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            MessageBox.Show_Redirect("Cambios guardados exitosamente.", "Admin_editAuto.aspx");
        }
    }
}