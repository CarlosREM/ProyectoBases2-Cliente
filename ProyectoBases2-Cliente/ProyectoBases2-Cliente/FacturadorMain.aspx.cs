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
    public partial class FacturadorMain : System.Web.UI.Page
    {
        static string sucursalName;
        static int clientID;
        static int inventarioID;
        static bool descuentoFlag = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                // para calcular el valor a cobrar por el interes
                if (cmBx_interes.SelectedIndex > 0)
                    txtBx_montoPago.Text = "1";
                else
                    txtBx_montoPago.Text = "10";
            }
            else
            {
                sucursalName = "default"; // la que corresponda al empleado, pasado por Session
                clientID = -1;
                inventarioID = -1;
                txtBx_codSeg.Attributes.Add("maxlength", "3");
                lbl_user.Text += Session["username"].ToString();
                if (Session["admin"].ToString().Equals("1"))
                {
                    btn_admMode.Visible = true;
                    pnl_sucursal.Visible = true;
                }
            }
        }

        protected void btn_admMode_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConsultorMain.aspx");
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogInScreen.aspx");
        }

        private void loadSucursal()
        {
            if (cmBx_sucursal.SelectedIndex > 0 && cmBx_sucursal.SelectedValue != sucursalName)
            {
                sucursalName = cmBx_sucursal.SelectedValue;
                btn_cancel_Click(null, null);
            }
        }

        protected void btn_sucursal_Click(object sender, EventArgs e)
        {
            loadSucursal();
        }

        protected void btn_switchScreen_Click(object sender, EventArgs e)
        {
            Response.Redirect("Facturador_Credito.aspx", false);
        }

        protected void btn_findClient_Click(object sender, EventArgs e)
        {
            string cedula = txtBx_cedula.Text;

            if (cedula.Equals(""))
            {
                MessageBox.Show("Debe llenar el campo [Cédula]");
                return;
            }
            lbl_elegible.Visible = false;
            lbl_descuento.Visible = false;
            txtBx_descuento.Text = "";
            txtBx_descuento.Visible = false;

            int idCliente;
            string nombre;
            string apellido;

            string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
            string procedureName = "[Empresa].[dbo].[spBuscarClienteCedula]";
            SqlConnection con = new SqlConnection(Constr);
            SqlCommand cmd = new SqlCommand(procedureName, con);
            SqlDataReader reader = null;

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@cedula", cedula);
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

            int count = int.Parse(cmd.Parameters["@return_value"].Value.ToString());
            con.Close();

            //si no se encuentra el cliente, se muestra un mensaje. Si hay info en los txtBx's, se vacian.
            if (count == 0)
            {
                clientID = -1;
                txtBx_nombre.Text = "";
                txtBx_apellido.Text = "";
                MessageBox.Show("No se encontró un usuario con la cédula introducida");
            }
            //si sí encuentra el cliente, se ponen los datos en los txtBx
            else
            {
                nombre = cmd.Parameters["@nombre"].Value.ToString();
                apellido = cmd.Parameters["@apellido"].Value.ToString();
                idCliente = int.Parse(cmd.Parameters["@idCliente"].Value.ToString());

                descuentoFlag = buscarClienteDescuento(idCliente);

                //si es elegible para descuento, muestra los campos
                if (descuentoFlag)
                {
                    lbl_elegible.Visible = true;
                    lbl_descuento.Visible = true;
                    txtBx_descuento.Visible = true;
                }

                clientID = idCliente; //id encontrado
                txtBx_nombre.Text = nombre; //nombre encontrado
                txtBx_apellido.Text = apellido; //apellido encontrado
            }
        }

        protected void btn_findAuto_Click(object sender, EventArgs e)
        {
            string autoID = txtBx_autoID.Text;

            if (autoID.Equals(""))
            {
                MessageBox.Show("Debe llenar el campo [ID Inventario]");
                return;
            }

            //procesa query de SQL
            // consigue ID, marca, modelo, año, tipo, caracteristicas y se calcula el precio (?

            //si no se encuentra el auto, se muestra un mensaje. Si hay info en los txtBx's, se vacian.
            if (autoID.Equals("0"))
            {
                inventarioID = -1;
                txtBx_marca.Text = "";
                txtBx_modelo.Text = "";
                txtBx_anho.Text = "";
                txtBx_tipo.Text = "";
                txtBx_caracteristicas.Text = "";
                txtBx_precioTotal.Text = "";
                MessageBox.Show("No se encontró un auto con el ID introducido");
            }
            //si sí encuentra el auto, se ponen los datos en los txtBx
            else
            {
                inventarioID = 1; //id encontrado
                txtBx_marca.Text = "marca"; //marca encontrada
                txtBx_modelo.Text = "modelo"; //modelo encontrado
                txtBx_anho.Text = "0000"; //año encontrado
                txtBx_tipo.Text = "tipo"; //tipo encontrado
                txtBx_caracteristicas.Text = "nombre: valor \n" +
                                             "nombre: valor \n" +
                                             "nombre: valor \n" +
                                             "nombre: valor, valor, valor"; //caracteristicas encontradas
                txtBx_precioTotal.Text = "10"; //precio total calculado (base + extras, supongo)
            }
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

        protected void btn_procesar_Click(object sender, EventArgs e)
        {
            int metodoIndex = cmBx_metodoPago.SelectedIndex;
            Debug.WriteLine("clientID: " + clientID.ToString());
            Debug.WriteLine("inventarioID: " + inventarioID.ToString());
            if (clientID < 0)
                MessageBox.Show("Introduzca un Cliente válido.");

            else if (inventarioID < 0)
                MessageBox.Show("Introduzca un ID de Auto válido.");

            else if (metodoIndex == 0)
                MessageBox.Show("Seleccione un Método de Pago.");

            else if (metodoIndex == 1 && (txtBx_numTarjeta.Text.Equals("") || txtBx_codSeg.Text.Equals("") || txtBx_fechaVenc.Text.Equals("")))
                MessageBox.Show("Faltan uno o más datos de la tarjeta.");

            else if (metodoIndex == 1 && (!check_codSeg() || !check_FechaVenc()))
                return;

            else if (chkBx_credito.Checked && cmBx_interes.SelectedIndex == 0)
                MessageBox.Show("Seleccione un % de interés para el crédito.");

            else
            {
                try
                {
                    //registra pago en SQL

                    MessageBox.Show_Redirect("Venta de auto procesada exitosamente.", "FacturadorMain.aspx");
                }
                catch (Exception ex)
                {
                    Debug.WriteLine(ex.ToString());
                    MessageBox.Show("Ocurrió un error al procesar la transacción. Inténtelo nuevamente.");
                }
            }
        }

        private bool check_codSeg()
        {
            bool result = false;
            string codSeg = txtBx_codSeg.Text;
            try
            {
                if (codSeg.Length < 3)
                    throw new Exception();

                int i = int.Parse(codSeg);
                result = true;
            }
            catch
            {
                MessageBox.Show("Introduzca un Código de Seguridad válido");
            }
            return result;
        }

        private bool check_FechaVenc()
        {
            bool result = false;
            string fechaVenc = txtBx_fechaVenc.Text;
            
            try
            {
                if (fechaVenc.Length < 5)
                    throw new Exception();

                string[] tokens = fechaVenc.Split('/');
                if (tokens.Length < 2)
                    throw new Exception();

                int m = int.Parse(tokens[0]),
                    y = int.Parse(tokens[1]);

                if (m <= 0 || m > 12)
                    MessageBox.Show("Fecha de Venc. - Num. de mes inválido.");
                else if (y < 19)
                    MessageBox.Show("Fecha de Venc. - Num. de año inválido.");
                else if (y == 19 && m < 6)
                    MessageBox.Show("Fecha de Venc. inválida.");
                else
                    result = true;
            }
            catch
            {
                MessageBox.Show("Utilice el formato correcto para la Fecha de Vencimiento de la tarjeta: (mm/yy).");
            }
            return result;
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("FacturadorMain.aspx", false);
        }

        private Boolean buscarClienteDescuento(int idCliente)
        {
            string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
            string procedureName = "[Empresa].[dbo].[GetCantidadCompras]";
            SqlConnection con = new SqlConnection(Constr);
            SqlCommand cmd = new SqlCommand(procedureName, con);
            SqlDataReader reader = null;

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idCliente", idCliente);
            
            SqlParameter returnParam = cmd.Parameters.Add("@return_value", SqlDbType.Int);
            returnParam.Direction = ParameterDirection.ReturnValue;

            con.Open();

            reader = cmd.ExecuteReader();

            int count = int.Parse(cmd.Parameters["@return_value"].Value.ToString());

            con.Close();

            return (count>=3);
        }
    }
}