using System;
using System.Collections;
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
    public partial class ConsultorMain : System.Web.UI.Page
    {

        static string nombreSucursal;
        static int idSucursal;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbl_user.Text += Session["username"].ToString();
                if (Session["admin"].ToString().Equals("1"))
                {
                    btn_admMode.Visible = true;
                    pnl_sucursal.Visible = true;
                    pnl_adminActions.Visible = true;
                    btn_consultInvGlobal.Visible = true;
                    btn_consultVentasGlobal.Visible = true;
                    btn_consultVentasXTodo.Visible = true;
                    btn_consultVTP.Visible = true;
                    btn_consultAutosMasGlobal.Visible = true;
                    btn_consultAutosMenosGlobal.Visible = true;
                }

                loadSucursal();

                ArrayList arrayAnhos = new ArrayList();
                arrayAnhos.Add("-Año-");
                for (int i = 2019; i >= 1919; i--)
                    arrayAnhos.Add(i.ToString());
                cmBx_VxT_FI_anho.DataSource = arrayAnhos;
                cmBx_VxT_FI_anho.DataBind();
                cmBx_VxT_FF_anho.DataSource = arrayAnhos;
                cmBx_VxT_FF_anho.DataBind();

                cmBx_VTP_FI_anho.DataSource = arrayAnhos;
                cmBx_VTP_FI_anho.DataBind();
                cmBx_VTP_FF_anho.DataSource = arrayAnhos;
                cmBx_VTP_FF_anho.DataBind();

                cmBx_Mas_FI_anho.DataSource = arrayAnhos;
                cmBx_Mas_FI_anho.DataBind();
                cmBx_Mas_FF_anho.DataSource = arrayAnhos;
                cmBx_Mas_FF_anho.DataBind();

                cmBx_MasG_FI_anho.DataSource = arrayAnhos;
                cmBx_MasG_FI_anho.DataBind();
                cmBx_MasG_FF_anho.DataSource = arrayAnhos;
                cmBx_MasG_FF_anho.DataBind();

                cmBx_Menos_FI_anho.DataSource = arrayAnhos;
                cmBx_Menos_FI_anho.DataBind();
                cmBx_Menos_FF_anho.DataSource = arrayAnhos;
                cmBx_Menos_FF_anho.DataBind();

                cmBx_MenosG_FI_anho.DataSource = arrayAnhos;
                cmBx_MenosG_FI_anho.DataBind();
                cmBx_MenosG_FF_anho.DataSource = arrayAnhos;
                cmBx_MenosG_FF_anho.DataBind();
            }
        }

        protected void cmBx_mes_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList cmBx_dia = null,
                         cmBx_mes = null,
                         cmBx_anho = null;
            string[] tokensID = ((DropDownList)sender).ID.Split('_');
            switch (tokensID[1])
            {
                case "VxT":
                    if (tokensID[2].Equals("FI"))
                    {
                        cmBx_dia = cmBx_VxT_FI_dia;
                        cmBx_mes = cmBx_VxT_FI_mes;
                        cmBx_anho = cmBx_VxT_FI_anho;
                    }
                    else
                    {
                        cmBx_dia = cmBx_VxT_FF_dia;
                        cmBx_mes = cmBx_VxT_FF_mes;
                        cmBx_anho = cmBx_VxT_FF_anho;
                    }
                    break;

                case "VTP":
                    if (tokensID[2].Equals("FI"))
                    {
                        cmBx_dia = cmBx_VTP_FI_dia;
                        cmBx_mes = cmBx_VTP_FI_mes;
                        cmBx_anho = cmBx_VTP_FI_anho;
                    }
                    else
                    {
                        cmBx_dia = cmBx_VTP_FF_dia;
                        cmBx_mes = cmBx_VTP_FF_mes;
                        cmBx_anho = cmBx_VTP_FF_anho;
                    }
                    break;

                case "Mas":
                    if (tokensID[2].Equals("FI"))
                    {
                        cmBx_dia = cmBx_Mas_FI_dia;
                        cmBx_mes = cmBx_Mas_FI_mes;
                        cmBx_anho = cmBx_Mas_FI_anho;
                    }
                    else
                    {
                        cmBx_dia = cmBx_Mas_FF_dia;
                        cmBx_mes = cmBx_Mas_FF_mes;
                        cmBx_anho = cmBx_Mas_FF_anho;
                    }
                    break;

                case "MasG":
                    if (tokensID[2].Equals("FI"))
                    {
                        cmBx_dia = cmBx_MasG_FI_dia;
                        cmBx_mes = cmBx_MasG_FI_mes;
                        cmBx_anho = cmBx_MasG_FI_anho;
                    }
                    else
                    {
                        cmBx_dia = cmBx_MasG_FF_dia;
                        cmBx_mes = cmBx_MasG_FF_mes;
                        cmBx_anho = cmBx_MasG_FF_anho;
                    }
                    break;

                case "Menos":
                    if (tokensID[2].Equals("FI"))
                    {
                        cmBx_dia = cmBx_Menos_FI_dia;
                        cmBx_mes = cmBx_Menos_FI_mes;
                        cmBx_anho = cmBx_Menos_FI_anho;
                    }
                    else
                    {
                        cmBx_dia = cmBx_Menos_FF_dia;
                        cmBx_mes = cmBx_Menos_FF_mes;
                        cmBx_anho = cmBx_Menos_FF_anho;
                    }
                    break;

                case "MenosG":
                    if (tokensID[2].Equals("FI"))
                    {
                        cmBx_dia = cmBx_MenosG_FI_dia;
                        cmBx_mes = cmBx_MenosG_FI_mes;
                        cmBx_anho = cmBx_MenosG_FI_anho;
                    }
                    else
                    {
                        cmBx_dia = cmBx_MenosG_FF_dia;
                        cmBx_mes = cmBx_MenosG_FF_mes;
                        cmBx_anho = cmBx_MenosG_FF_anho;
                    }
                    break;
            }

            int mes = int.Parse(cmBx_mes.SelectedValue);
            if ((DropDownList)sender == cmBx_anho & mes != 2)
                return;

            switch (mes)
            {
                //31 dias
                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                case 10:
                case 12:
                    reload_dias(31, cmBx_dia);
                    break;
                case 4:
                case 6:
                case 9:
                case 11:
                    reload_dias(30, cmBx_dia);
                    break;
                case 2:
                    try
                    {
                        int year = int.Parse(cmBx_anho.SelectedValue);
                        if (year % 4 == 0 & ((year % 100 != 0) | (year % 100 == 0 & year % 400 == 0)))
                            reload_dias(29, cmBx_dia);
                        else
                            reload_dias(28, cmBx_dia);
                    }
                    catch { reload_dias(28, cmBx_dia); }
                    break;
            }
        }

        private void reload_dias(int max, DropDownList cmBx_dia)
        {
            int currentIndex = cmBx_dia.SelectedIndex;
            if (currentIndex > max)
                currentIndex = currentIndex - (currentIndex - max);
            ArrayList arrayDias = new ArrayList();
            arrayDias.Add("-Dia-");
            for (int i = 1; i <= max; i++)
                arrayDias.Add(i.ToString());

            cmBx_dia.DataSource = arrayDias;
            cmBx_dia.DataBind();
            cmBx_dia.SelectedIndex = currentIndex;
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogInScreen.aspx");
        }

        protected void btn_admMode_Click(object sender, EventArgs e)
        {
            Response.Redirect("FacturadorMain.aspx");
        }

        private void loadSucursal()
        {
            bool cambio = true;
            if (IsPostBack)
            {
                if (nombreSucursal == cmBx_sucursal.SelectedItem.Text)
                    cambio = false;
                else
                {
                    nombreSucursal = cmBx_sucursal.SelectedItem.Text;
                    idSucursal = int.Parse(cmBx_sucursal.SelectedValue);
                }
            }
            else
            {
                //aqui va cuando carga por primera vez. Podria ejecutarse como... averiguar cual es la mas cercana, basandose en la posicion del user
                cargarNombresSucursales();
                nombreSucursal = cmBx_sucursal.SelectedItem.Text; //se usa la sucursal del empleado como default
                idSucursal = int.Parse(cmBx_sucursal.SelectedValue);
            }
            if (cambio)
            {
                Debug.WriteLine("Nombre sucursal: " + nombreSucursal);
                //setDistancia(); supongo
                setInfoHorarios();
                setInfoEmpleados();
                loadInteres();
                Session["idSucursal"] = idSucursal;
            }
        }

        protected void btn_sucursal_Click(object sender, EventArgs e)
        {
            loadSucursal();
        }

        // ACCIONES DE ADMIN - - - - - - - - - -

        protected void btn_addAuto_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_addAuto.aspx", false);
        }

        protected void btn_editAuto_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_editAuto.aspx", false);
        }

        private void loadInteres()
        {
            string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
            string procedureName = "[Empresa].[dbo].[GetTasasInteresSucursal]";
            SqlConnection con = new SqlConnection(Constr);
            SqlCommand cmd = new SqlCommand(procedureName, con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idSucursal", idSucursal);

            con.Open();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dataSet = new DataTable();
            da.Fill(dataSet);

            con.Close();

            gv_interes.DataSource = dataSet;
            gv_interes.DataBind();

            da.Dispose();
        }

        protected void btn_addInteres_Click(object sender, EventArgs e)
        {
            string id = txtBx_idNewInteres.Text,
                   val = txtBx_valNewInteres.Text;

            if (id.Equals("") || int.Parse(id) < 1)
                MessageBox.Show("Agregar Interés: introduzca un ID válido.");

            else if (val.Equals("") || int.Parse(val) < 1 || int.Parse(val) > 100)
                MessageBox.Show("Agregar Interés: introduzca un Valor válido.");

            else
            {
                try
                {
                    string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
                    string procedureName = "[Empresa].[dbo].[CreateInteresSucursal]";
                    SqlConnection con = new SqlConnection(Constr);
                    SqlCommand cmd = new SqlCommand(procedureName, con);
                    SqlDataReader reader = null;

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@nombreSucursal", nombreSucursal);
                    cmd.Parameters.AddWithValue("@idInteres", int.Parse(id));
                    cmd.Parameters.AddWithValue("@porcentaje", (float)int.Parse(val) / 100);

                    SqlParameter returnParam = cmd.Parameters.Add("@return_value", SqlDbType.Int);
                    returnParam.Direction = ParameterDirection.ReturnValue;

                    con.Open();

                    reader = cmd.ExecuteReader();

                    int result = int.Parse(cmd.Parameters["@return_value"].Value.ToString());
                    con.Close();

                    switch (result)
                    {
                        case (-1):
                            MessageBox.Show("Agregar Interés: Uno o más parámetros son nulos");
                            break;
                        case (-2):
                            MessageBox.Show("Agregar Interés: ID de Interes ya existe");
                            break;
                        default:
                            MessageBox.Show("Agregar Interés: Interes agregado exitosamente");
                            txtBx_idNewInteres.Text = "";
                            txtBx_valNewInteres.Text = "";
                            loadInteres();
                            break;
                    }
                }
                catch (Exception ex)
                {
                    Debug.WriteLine("Agregar Interes: " + ex.ToString());
                    MessageBox.Show("Ocurrió un error al agregar Interés. Inténtelo de nuevo.");
                }
            }
        }

        protected void btn_editInteres_Click(object sender, EventArgs e)
        {
            string id = txtBx_idEditInteres.Text,
                   val = txtBx_valEditInteres.Text;
            if (id.Equals("") || int.Parse(id) < 1)
                MessageBox.Show("Editar Interés: introduzca un ID válido.");

            else if (val.Equals("") || int.Parse(val) < 1 || int.Parse(val) > 100)
                MessageBox.Show("Editar Interés: introduzca un Valor válido.");

            else
            {
                try
                {
                    string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
                    string procedureName = "[Empresa].[dbo].[UpdateInteresSucursal]";
                    SqlConnection con = new SqlConnection(Constr);
                    SqlCommand cmd = new SqlCommand(procedureName, con);
                    SqlDataReader reader = null;

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@nombreSucursal", nombreSucursal);
                    cmd.Parameters.AddWithValue("@idInteres", int.Parse(id));
                    cmd.Parameters.AddWithValue("@newPorcentaje", (float)int.Parse(val) / 100);

                    SqlParameter returnParam = cmd.Parameters.Add("@return_value", SqlDbType.Int);
                    returnParam.Direction = ParameterDirection.ReturnValue;

                    con.Open();

                    reader = cmd.ExecuteReader();

                    int result = int.Parse(cmd.Parameters["@return_value"].Value.ToString());
                    con.Close();

                    if (result == -1)
                    {
                        MessageBox.Show("Editar Interés: ID introducido no existe.");
                    }
                    else
                    {
                        MessageBox.Show("Editar Interés: Interes editado exitosamente.");
                        txtBx_idEditInteres.Text = "";
                        txtBx_valEditInteres.Text = "";
                        loadInteres();
                    }
                }
                catch (Exception ex)
                {
                    Debug.WriteLine("Agregar Interes: " + ex.ToString());
                    MessageBox.Show("Ocurrió un error al editar Interés. Inténtelo de nuevo.");
                }
            }
        }

        // CONSULTAS  - - - - - - - - - -

        protected void btn_consultInv_Click(object sender, EventArgs e)
        {
            if (pnl_consultInv.Visible)
                pnl_consultInv.Visible = false;
            else
            {
                pnl_consultInv.Visible = true;
                
                string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
                string procedureName = "[Empresa].[dbo].[FiltrarAutosSucursal]";
                SqlConnection con = new SqlConnection(Constr);
                SqlCommand cmd = new SqlCommand(procedureName, con);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@nombreSucursal", nombreSucursal);

                con.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet dataSet = new DataSet();
                da.Fill(dataSet);

                con.Close();

                gv_inventario.DataSource = dataSet;
                gv_inventario.DataBind();

                da.Dispose();
            }
        }

        protected void btn_consultInvGlobal_Click(object sender, EventArgs e)
        {
            if (pnl_consultInvGlobal.Visible)
                pnl_consultInvGlobal.Visible = false;
            else
            {
                pnl_consultInvGlobal.Visible = true;

                string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
                string procedureName = "[Empresa].[dbo].[FiltrarAutosGlobal]";
                SqlConnection con = new SqlConnection(Constr);
                SqlCommand cmd = new SqlCommand(procedureName, con);

                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet dataSet = new DataSet();
                da.Fill(dataSet);

                con.Close();

                gv_inventarioGlobal.DataSource = dataSet;
                gv_inventarioGlobal.DataBind();

                da.Dispose();
            }
        }

        protected void btn_consultVentas_Click(object sender, EventArgs e)
        {
            if (pnl_consultVentas.Visible)
                pnl_consultVentas.Visible = false;
            else
            {
                pnl_consultVentas.Visible = true;

                string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
                string procedureName = "[Empresa].[dbo].[GetComprasGlobal]";
                SqlConnection con = new SqlConnection(Constr);
                SqlCommand cmd = new SqlCommand(procedureName, con);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@nombreTargetSucursal", nombreSucursal);

                con.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet dataSet = new DataSet();
                da.Fill(dataSet);

                con.Close();

                gv_ventas.DataSource = dataSet;
                gv_ventas.DataBind();

                da.Dispose();
            }
        }

        protected void btn_consultVentasGlobal_Click(object sender, EventArgs e)
        {
            if (pnl_consultVentasGlobal.Visible)
                pnl_consultVentasGlobal.Visible = false;
            else
            {
                pnl_consultVentasGlobal.Visible = true;

                string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
                string procedureName = "[Empresa].[dbo].[GetComprasGlobal]";
                SqlConnection con = new SqlConnection(Constr);
                SqlCommand cmd = new SqlCommand(procedureName, con);

                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet dataSet = new DataSet();
                da.Fill(dataSet);

                con.Close();

                gv_ventasGlobal.DataSource = dataSet;
                gv_ventasGlobal.DataBind();

                da.Dispose();
            }
        }

        protected void btn_consultVentasXTodo_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            if (b == btn_consultVentasXTodo && pnl_consultVentasXTodo.Visible)
                pnl_consultVentasXTodo.Visible = false;
            else
            {
                pnl_consultVentasXTodo.Visible = true;

                string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
                string procedureName = "[Empresa].[dbo].[ConsultarVentasTipoAuto]";
                SqlConnection con = new SqlConnection(Constr);
                SqlCommand cmd = new SqlCommand(procedureName, con);

                cmd.CommandType = CommandType.StoredProcedure;
                if (b == btn_VxT_fechas)
                {
                    if (cmBx_VxT_FI_dia.SelectedIndex > 0 &&
                        cmBx_VxT_FI_mes.SelectedIndex > 0 &&
                        cmBx_VxT_FI_anho.SelectedIndex > 0)
                    {
                        string fechaI = cmBx_VxT_FI_anho.SelectedValue + "/" + cmBx_VxT_FI_mes.SelectedValue + "/" + cmBx_VxT_FI_dia.SelectedValue;
                        cmd.Parameters.AddWithValue("@fechaI", fechaI);
                    }
                    if (cmBx_VxT_FF_dia.SelectedIndex > 0 &&
                        cmBx_VxT_FF_mes.SelectedIndex > 0 &&
                        cmBx_VxT_FF_anho.SelectedIndex > 0)
                    {
                        string fechaF = cmBx_VxT_FF_anho.SelectedValue + "/" + cmBx_VxT_FF_mes.SelectedValue + "/" + cmBx_VxT_FF_dia.SelectedValue;
                        cmd.Parameters.AddWithValue("@fechaF", fechaF);
                    }
                }

                con.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet dataSet = new DataSet();
                da.Fill(dataSet);

                con.Close();

                gv_ventasXtodo.DataSource = dataSet;
                gv_ventasXtodo.DataBind();

                da.Dispose();
            }
        }

        protected void btn_consultVTP_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            if (b == btn_consultVTP && pnl_consultVTP.Visible)
                pnl_consultVTP.Visible = false;
            else
            {
                pnl_consultVTP.Visible = true;

                string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
                string procedureName = "[Empresa].[dbo].[ConsultarVentasTipoPago]";
                SqlConnection con = new SqlConnection(Constr);
                SqlCommand cmd = new SqlCommand(procedureName, con);

                cmd.CommandType = CommandType.StoredProcedure;
                if (b == btn_VTP_fechas)
                {
                    if (cmBx_VTP_FI_dia.SelectedIndex > 0 &&
                        cmBx_VTP_FI_mes.SelectedIndex > 0 &&
                        cmBx_VTP_FI_anho.SelectedIndex > 0)
                    {
                        string fechaI = cmBx_VTP_FI_anho.SelectedValue + "/" + cmBx_VTP_FI_mes.SelectedValue + "/" + cmBx_VTP_FI_dia.SelectedValue;
                        cmd.Parameters.AddWithValue("@fechaI", fechaI);
                    }
                    if (cmBx_VTP_FF_dia.SelectedIndex > 0 &&
                        cmBx_VTP_FF_mes.SelectedIndex > 0 &&
                        cmBx_VTP_FF_anho.SelectedIndex > 0)
                    {
                        string fechaF = cmBx_VTP_FF_anho.SelectedValue + "/" + cmBx_VTP_FF_mes.SelectedValue + "/" + cmBx_VTP_FF_dia.SelectedValue;
                        cmd.Parameters.AddWithValue("@fechaF", fechaF);
                    }
                }

                con.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet dataSet = new DataSet();
                da.Fill(dataSet);

                con.Close();

                gv_VTP.DataSource = dataSet;
                gv_VTP.DataBind();

                da.Dispose();
            }
        }

        protected void btn_consultAutosMas_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            if (b == btn_consultAutosMas && pnl_consultAutosMas.Visible)
                pnl_consultAutosMas.Visible = false;
            else
            {
                pnl_consultAutosMas.Visible = true;

                string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
                string procedureName = "[Empresa].[dbo].[ConsultarMasVendidosSucursales]";
                SqlConnection con = new SqlConnection(Constr);
                SqlCommand cmd = new SqlCommand(procedureName, con);

                cmd.CommandType = CommandType.StoredProcedure;
                if (b == btn_Mas_fechas)
                {
                    if (cmBx_Mas_FI_dia.SelectedIndex > 0 &&
                        cmBx_Mas_FI_mes.SelectedIndex > 0 &&
                        cmBx_Mas_FI_anho.SelectedIndex > 0)
                    {
                        string fechaI = cmBx_Mas_FI_anho.SelectedValue + "/" + cmBx_Mas_FI_mes.SelectedValue + "/" + cmBx_Mas_FI_dia.SelectedValue;
                        cmd.Parameters.AddWithValue("@fechaI", fechaI);
                    }
                    if (cmBx_Mas_FF_dia.SelectedIndex > 0 &&
                        cmBx_Mas_FF_mes.SelectedIndex > 0 &&
                        cmBx_Mas_FF_anho.SelectedIndex > 0)
                    {
                        string fechaF = cmBx_Mas_FF_anho.SelectedValue + "/" + cmBx_Mas_FF_mes.SelectedValue + "/" + cmBx_Mas_FF_dia.SelectedValue;
                        cmd.Parameters.AddWithValue("@fechaF", fechaF);
                    }
                }

                con.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet dataSet = new DataSet();
                da.Fill(dataSet);

                con.Close();

                gv_autosMas.DataSource = dataSet;
                gv_autosMas.DataBind();

                da.Dispose();
            }
        }

        protected void btn_consultAutosMasGlobal_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            if (b == btn_consultAutosMasGlobal && pnl_consultAutosMasGlobal.Visible)
                pnl_consultAutosMasGlobal.Visible = false;
            else
            {
                pnl_consultAutosMasGlobal.Visible = true;

                string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
                string procedureName = "[Empresa].[dbo].[ConsultarMasVendidosGlobal]";
                SqlConnection con = new SqlConnection(Constr);
                SqlCommand cmd = new SqlCommand(procedureName, con);

                cmd.CommandType = CommandType.StoredProcedure;
                if (b == btn_MasG_fechas)
                {
                    if (cmBx_MasG_FI_dia.SelectedIndex > 0 &&
                        cmBx_MasG_FI_mes.SelectedIndex > 0 &&
                        cmBx_MasG_FI_anho.SelectedIndex > 0)
                    {
                        string fechaI = cmBx_MasG_FI_anho.SelectedValue + "/" + cmBx_MasG_FI_mes.SelectedValue + "/" + cmBx_MasG_FI_dia.SelectedValue;
                        cmd.Parameters.AddWithValue("@fechaI", fechaI);
                    }
                    if (cmBx_MasG_FF_dia.SelectedIndex > 0 &&
                        cmBx_MasG_FF_mes.SelectedIndex > 0 &&
                        cmBx_MasG_FF_anho.SelectedIndex > 0)
                    {
                        string fechaF = cmBx_MasG_FF_anho.SelectedValue + "/" + cmBx_MasG_FF_mes.SelectedValue + "/" + cmBx_MasG_FF_dia.SelectedValue;
                        cmd.Parameters.AddWithValue("@fechaF", fechaF);
                    }
                }

                con.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet dataSet = new DataSet();
                da.Fill(dataSet);

                con.Close();

                gv_autosMasGlobal.DataSource = dataSet;
                gv_autosMasGlobal.DataBind();

                da.Dispose();
            }
        }

        protected void btn_consultAutosMenos_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            if (b == btn_consultAutosMenos && pnl_consultAutosMenos.Visible)
                pnl_consultAutosMenos.Visible = false;
            else
            {
                pnl_consultAutosMenos.Visible = true;

                string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
                string procedureName = "[Empresa].[dbo].[ConsultarSinSalidaSucursales]";
                SqlConnection con = new SqlConnection(Constr);
                SqlCommand cmd = new SqlCommand(procedureName, con);

                cmd.CommandType = CommandType.StoredProcedure;
                if (b == btn_Menos_fechas)
                {
                    if (cmBx_Menos_FI_dia.SelectedIndex > 0 &&
                        cmBx_Menos_FI_mes.SelectedIndex > 0 &&
                        cmBx_Menos_FI_anho.SelectedIndex > 0)
                    {
                        string fechaI = cmBx_Menos_FI_anho.SelectedValue + "/" + cmBx_Menos_FI_mes.SelectedValue + "/" + cmBx_Menos_FI_dia.SelectedValue;
                        cmd.Parameters.AddWithValue("@fechaI", fechaI);
                    }
                    if (cmBx_Menos_FF_dia.SelectedIndex > 0 &&
                        cmBx_Menos_FF_mes.SelectedIndex > 0 &&
                        cmBx_Menos_FF_anho.SelectedIndex > 0)
                    {
                        string fechaF = cmBx_Menos_FF_anho.SelectedValue + "/" + cmBx_Menos_FF_mes.SelectedValue + "/" + cmBx_Menos_FF_dia.SelectedValue;
                        cmd.Parameters.AddWithValue("@fechaF", fechaF);
                    }
                }

                con.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet dataSet = new DataSet();
                da.Fill(dataSet);

                con.Close();

                gv_autosMenos.DataSource = dataSet;
                gv_autosMenos.DataBind();

                da.Dispose();
            }
        }

        protected void btn_consultAutosMenosGlobal_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            if (b == btn_consultAutosMenosGlobal && pnl_consultAutosMenosGlobal.Visible)
                pnl_consultAutosMenosGlobal.Visible = false;
            else
            {
                pnl_consultAutosMenosGlobal.Visible = true;

                string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
                string procedureName = "[Empresa].[dbo].[ConsultarSinSalidaGlobal]";
                SqlConnection con = new SqlConnection(Constr);
                SqlCommand cmd = new SqlCommand(procedureName, con);

                cmd.CommandType = CommandType.StoredProcedure;
                if (b == btn_MenosG_fechas)
                {
                    if (cmBx_MenosG_FI_dia.SelectedIndex > 0 &&
                        cmBx_MenosG_FI_mes.SelectedIndex > 0 &&
                        cmBx_MenosG_FI_anho.SelectedIndex > 0)
                    {
                        string fechaI = cmBx_MenosG_FI_anho.SelectedValue + "/" + cmBx_MenosG_FI_mes.SelectedValue + "/" + cmBx_MenosG_FI_dia.SelectedValue;
                        cmd.Parameters.AddWithValue("@fechaI", fechaI);
                    }
                    if (cmBx_MenosG_FF_dia.SelectedIndex > 0 &&
                        cmBx_MenosG_FF_mes.SelectedIndex > 0 &&
                        cmBx_MenosG_FF_anho.SelectedIndex > 0)
                    {
                        string fechaF = cmBx_MenosG_FF_anho.SelectedValue + "/" + cmBx_MenosG_FF_mes.SelectedValue + "/" + cmBx_MenosG_FF_dia.SelectedValue;
                        cmd.Parameters.AddWithValue("@fechaF", fechaF);
                    }
                }

                con.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet dataSet = new DataSet();
                da.Fill(dataSet);

                con.Close();

                gv_autosMenosGlobal.DataSource = dataSet;
                gv_autosMenosGlobal.DataBind();

                da.Dispose();
            }
        }

        private void setInfoHorarios()
        {
            string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
            string procedureName = "[Empresa].[dbo].[spGetHorariosSucursal]";
            SqlConnection con = new SqlConnection(Constr);
            SqlCommand cmd = new SqlCommand(procedureName, con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nombreSucursal", nombreSucursal);

            con.Open();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();
            da.Fill(dataSet);

            con.Close();

            gridHorarios.DataSource = dataSet;
            gridHorarios.DataBind();

            da.Dispose();

        }

        private void setInfoEmpleados()
        {
            string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
            string procedureName = "[Empresa].[dbo].[spGetPersonasSucursal]";
            SqlConnection con = new SqlConnection(Constr);
            SqlCommand cmd = new SqlCommand(procedureName, con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nombreSucursal", nombreSucursal);

            con.Open();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();
            da.Fill(dataSet);

            con.Close();

            gridEmpleados.DataSource = dataSet;
            gridEmpleados.DataBind();

            da.Dispose();
        }

        private void cargarNombresSucursales()
        {
            string Constr = WebConfigurationManager.ConnectionStrings["ProyectoBases"].ConnectionString;
            string procedureName = "[Empresa].[dbo].[spGetNombresSucursales]";
            SqlConnection con = new SqlConnection(Constr);
            SqlCommand cmd = new SqlCommand(procedureName, con);

            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dataSet = new DataTable();
            da.Fill(dataSet);

            con.Close();

            cmBx_sucursal.DataSource = dataSet;
            cmBx_sucursal.DataBind();
            cmBx_sucursal.DataTextField = "nombreSucursal";
            cmBx_sucursal.DataValueField = "id";
            cmBx_sucursal.DataBind();

            cmBx_sucursal.SelectedIndex = 0;

            da.Dispose();
        }

        protected void btn_VxT_fechas_Click(object sender, EventArgs e)
        {
            btn_consultVentasXTodo_Click(sender, e);
        }

        protected void btn_VTP_fechas_Click(object sender, EventArgs e)
        {
            btn_consultVTP_Click(sender, e);
        }

        protected void btn_Mas_fechas_Click(object sender, EventArgs e)
        {
            btn_consultAutosMas_Click(sender, e);
        }

        protected void btn_MasG_fechas_Click(object sender, EventArgs e)
        {
            btn_consultAutosMasGlobal_Click(sender, e);
        }

        protected void btn_Menos_fechas_Click(object sender, EventArgs e)
        {
            btn_consultAutosMenos_Click(sender, e);
        }

        protected void btn_MenosG_fechas_Click(object sender, EventArgs e)
        {
            btn_consultAutosMenosGlobal_Click(sender, e);
        }
    }
}