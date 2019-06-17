﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBases2_Cliente
{
    public partial class ClientMain : System.Web.UI.Page
    {
        IPLocation location; //aqui se guarda la ubicacion (lat y long) del user

        static string sucursalName;
        static bool sucursalFlag = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                rdBtn_Check();
                if (sucursalFlag)
                    loadSucursal();
            }
            else
            {
                lbl_user.Text += Session["username"].ToString();
                //location = IPLocation.GetIPLocation();
                loadSucursal();
            }
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogInScreen.aspx", false);
        }

        private void loadSucursal()
        {
            if (IsPostBack)
            {
                //aqui va el codigo al seleccionar una sucursal
                sucursalName = cmBx_sucursal.SelectedValue;
                sucursalFlag = false;
            }
            else 
            {
                //aqui va cuando carga por primera vez (sucursalName esta vacio)
                //Podria ejecutarse como... averiguar cual es la mas cercana, basandose en la posicion del user

                sucursalName = "default"; // funcion para sacar sucursal mas cercana
            }
            Debug.WriteLine("sucursalName: " + sucursalName);
            //setDistancia(); supongo
            //setInfoHorarios();
            //setInfoEmpleados();
        }

        protected void btn_sucursal_Click(object sender, EventArgs e)
        {
            sucursalFlag = true;
        }

        protected void btn_usarFiltro_Click(object sender, EventArgs e)
        {
            if (pnl_filtro.Visible)
                pnl_filtro.Visible = false;
            else
                pnl_filtro.Visible = true;
        }

        private void rdBtn_Check()
        {
            if (rdBtn_marca.Checked)
            {
                txtBx_marca.Enabled = true;
                txtBx_modelo.Enabled = false;
                txtBx_anho.Enabled = false;
                txtBx_tipo.Enabled = false;
                txtBx_precioMin.Enabled = false;
                txtBx_precioMax.Enabled = false;
                txtBx_caractName.Enabled = false;
                txtBx_caractValue.Enabled = false;
            }
            else if (rdBtn_modelo.Checked)
            {
                txtBx_marca.Enabled = false;
                txtBx_modelo.Enabled = true;
                txtBx_anho.Enabled = false;
                txtBx_tipo.Enabled = false;
                txtBx_precioMin.Enabled = false;
                txtBx_precioMax.Enabled = false;
                txtBx_caractName.Enabled = false;
                txtBx_caractValue.Enabled = false;
            }
            else if (rdBtn_anho.Checked)
            {
                txtBx_marca.Enabled = false;
                txtBx_modelo.Enabled = false;
                txtBx_anho.Enabled = true;
                txtBx_tipo.Enabled = false;
                txtBx_precioMin.Enabled = false;
                txtBx_precioMax.Enabled = false;
                txtBx_caractName.Enabled = false;
                txtBx_caractValue.Enabled = false;
            }
            else if (rdBtn_tipo.Checked)
            {
                txtBx_marca.Enabled = false;
                txtBx_modelo.Enabled = false;
                txtBx_anho.Enabled = false;
                txtBx_tipo.Enabled = true;
                txtBx_precioMin.Enabled = false;
                txtBx_precioMax.Enabled = false;
                txtBx_caractName.Enabled = false;
                txtBx_caractValue.Enabled = false;
            }
            else if (rdBtn_precio.Checked)
            {
                txtBx_marca.Enabled = false;
                txtBx_modelo.Enabled = false;
                txtBx_anho.Enabled = false;
                txtBx_tipo.Enabled = false;
                txtBx_precioMin.Enabled = true;
                txtBx_precioMax.Enabled = true;
                txtBx_caractName.Enabled = false;
                txtBx_caractValue.Enabled = false;
            }
            else if (rdBtn_caracteristica.Checked)
            {
                txtBx_marca.Enabled = false;
                txtBx_modelo.Enabled = false;
                txtBx_anho.Enabled = false;
                txtBx_tipo.Enabled = false;
                txtBx_precioMin.Enabled = false;
                txtBx_precioMax.Enabled = false;
                txtBx_caractName.Enabled = true;
                txtBx_caractValue.Enabled = true;
            }
        }

        private string getFiltro()
        {
            string filtro = "";
            if (rdBtn_marca.Checked) filtro = "Marca@" + txtBx_marca.Text;
            else if (rdBtn_modelo.Checked) filtro = "Modelo@" + txtBx_modelo.Text;
            else if (rdBtn_anho.Checked) filtro = "Año@" + txtBx_anho.Text;
            else if (rdBtn_tipo.Checked) filtro = "Tipo@" + txtBx_tipo.Text;
            else if (rdBtn_precio.Checked) filtro = "Precio@" + txtBx_precioMin.Text + "@" + txtBx_precioMax.Text;
            else if (rdBtn_caracteristica.Checked) filtro = "Caracteristica@" + txtBx_caractName.Text + "@" + txtBx_caractValue.Text;

            return filtro;
        }

        protected void btn_filtro_Click(object sender, EventArgs e)
        {
            string[] filtro = getFiltro().Split('@');
            bool noData = false;
            switch (filtro.Length)
            {
                case 2:
                    if (filtro[1].Equals(""))
                        noData = true;
                    break;
                case 3:
                    if (filtro[1].Equals("") | filtro[2].Equals(""))
                        noData = true;
                    break;
            }
            Console.Write(filtro);

            if (noData)
                MessageBox.Show("Faltan datos en el filtro.");

            else
            {
                //supongo que aqui podria aplicarse el filtro en SQL

                string msg = "El filtro es " + filtro[0] + ":" + filtro[1];

                if (filtro.Length > 2)
                    msg += ":" + filtro[2];

                MessageBox.Show(msg);
            }

        }


    }
}