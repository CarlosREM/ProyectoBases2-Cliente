﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBases2_Cliente
{
    public partial class Facturador_Credito : System.Web.UI.Page
    {
        int clientID;

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

        protected void btn_switchScreen_Click(object sender, EventArgs e)
        {
            Response.Redirect("FacturadorMain.aspx", false);
        }

        protected void btn_findClient_Click(object sender, EventArgs e)
        {
            string cedula = txtBx_cedula.Text;

            if (cedula.Equals(""))
            {
                MessageBox.Show("Debe llenar el campo [Cédula]");
                return;
            }

            //procesa query de SQL
            // consigue ID, nombre y apellido
            
            //si no se encuentra el cliente, se muestra un mensaje. Si hay info en los txtBx's, se vacian.
            if (cedula.Equals("0"))
            {
                clientID = 0;
                txtBx_nombre.Text = "";
                txtBx_apellido.Text = "";
                pnl_noCreditos.Visible = false;
                pnl_creditos.Visible = false;
                pnl_pago.Visible = false;
                MessageBox.Show("No se encontró un usuario con la cédula introducida");
            }
            //si sí encuentra el cliente, se ponen los datos en los txtBx
            else
            {
                clientID = 1; //id encontrado
                txtBx_nombre.Text = "nombre"; //nombre encontrado
                txtBx_apellido.Text = "apellido"; //apellido encontrado

                //busca los creditos en SQL

                //si no hay creditos, se pone pnl_noCreditos
                if (cedula.Equals("-1"))
                {
                    pnl_creditos.Visible = false;
                    pnl_noCreditos.Visible = true;
                    pnl_pago.Visible = false;
                }
                //si sí, se pone pnl_creditos 
                else
                {
                    pnl_noCreditos.Visible = false;
                    pnl_creditos.Visible = true;
                    pnl_pago.Visible = false;

                    //Se cargan creditos en la tabla

                    //--ESTO ES DE PRUEBA--
                    // para poder desplegar la info de pago
                    if (cedula.Equals("2"))
                    {
                        pnl_pago.Visible = true;
                    }
                }
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
            if (metodoIndex == 0)
                MessageBox.Show("Seleccione un Método de Pago.");

            else if (metodoIndex == 1 & (txtBx_numTarjeta.Text.Equals("") | txtBx_codSeg.Text.Equals("") | txtBx_fechaVenc.Text.Equals("")))
                MessageBox.Show("Faltan uno o más datos de la tarjeta.");

            else if (metodoIndex == 1 && (!check_codSeg() || !check_FechaVenc()))
                return;

            else
            {
                try
                {
                    //registra pago en SQL

                    MessageBox.Show_Redirect("Pago de crédito procesado exitosamente.", "FacturadorMain.aspx");
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
            txtBx_cedula.Text = "";
            txtBx_nombre.Text = "";
            txtBx_apellido.Text = "";

            pnl_noCreditos.Visible = false;
            pnl_creditos.Visible = false;
            hide_pnl_pago();
        }

        private void hide_pnl_pago()
        {
            txtBx_numTarjeta.Text = "";
            txtBx_codSeg.Text = "";
            txtBx_fechaVenc.Text = "";
            pnl_pago.Visible = false;
        }
    }
}