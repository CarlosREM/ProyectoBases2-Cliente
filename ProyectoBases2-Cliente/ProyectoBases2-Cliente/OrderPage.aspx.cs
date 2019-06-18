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
    public partial class OrderPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarNombresModelos();
                lbl_user.Text += Session["username"].ToString();
                cbmBox_modelos.SelectedIndex = 0;
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
            int idModelo = int.Parse(cbmBox_modelos.SelectedValue);
            int idSucursal = int.Parse(Session["idSucursal"].ToString());
            string fechaEntrega = "";

            int returnValue;
            try
            {
                string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBasesFabrica"].ConnectionString;
                string procedureName = "[Fabrica].[dbo].[spCrearPedido]";
                SqlConnection con = new SqlConnection(Constr);
                SqlCommand cmd = new SqlCommand(procedureName, con);
                SqlDataReader reader = null;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@fk_sucursal", idSucursal);
                cmd.Parameters.AddWithValue("@fk_modelo", idModelo);
                cmd.Parameters.AddWithValue("@cantidad", 1);
                cmd.Parameters.Add(new SqlParameter("@fechaEntrega", SqlDbType.VarChar,50));
                cmd.Parameters["@fechaEntrega"].Direction = ParameterDirection.Output;

                SqlParameter returnParam = cmd.Parameters.Add("@return_value", SqlDbType.Int);
                returnParam.Direction = ParameterDirection.ReturnValue;

                con.Open();

                reader = cmd.ExecuteReader();

                returnValue = int.Parse(cmd.Parameters["@return_value"].Value.ToString());

                con.Close();
                

                if (returnValue == -1)
                {
                    MessageBox.Show("El ID de la sucursal es nulo");
                }
                else if(returnValue == 0)
                {
                    fechaEntrega = cmd.Parameters["@fechaEntrega"].Value.ToString();
                    txtBx_fecha.Text = fechaEntrega;
                }
            }catch (Exception ex)
            {
                Debug.WriteLine(ex.ToString());
            }
                /*string marca = txtBx_marca.Text,
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
                }*/
            }

        private void cargarNombresModelos()
        {
            string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBasesFabrica"].ConnectionString;
            string procedureName = "[Fabrica].[dbo].[getNombresModelos]";
            SqlConnection con = new SqlConnection(Constr);
            SqlCommand cmd = new SqlCommand(procedureName, con);

            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dataSet = new DataTable();
            da.Fill(dataSet);

            con.Close();

            cbmBox_modelos.DataSource = dataSet;
            cbmBox_modelos.DataBind();
            cbmBox_modelos.DataTextField = "nombre";
            cbmBox_modelos.DataValueField = "id";
            cbmBox_modelos.DataBind();

            da.Dispose();
        }
    }
}