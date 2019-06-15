using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBases2_Cliente
{
    public partial class RegisterScreen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                if (!chkBx_password.Checked)
                {
                    string text = txtBx_password.Text;
                    txtBx_password.TextMode = TextBoxMode.Password;
                    txtBx_password.Attributes["value"] = text;
                }
                else
                    txtBx_password.TextMode = TextBoxMode.SingleLine;
            }

            else {
                txtBx_password.TextMode = TextBoxMode.Password;

                ArrayList arrayAnhos = new ArrayList();
                arrayAnhos.Add("-Año-");
                for (int i = 2019; i >= 1919; i--)
                    arrayAnhos.Add(i.ToString());
                cmBx_anho.DataSource = arrayAnhos;
                cmBx_anho.DataBind();
            }
        }

        protected void cmBx_mes_SelectedIndexChanged(object sender, EventArgs e)
        {
            int mes = int.Parse(cmBx_mes.SelectedValue);
            if ((DropDownList)sender == cmBx_anho & mes != 2)
                return;

            switch(mes)
            {
                //31 dias
                case 1: case 3: case 5: case 7: case 8: case 10: case 12:
                    reload_dias(31);
                    break;
                case 4: case 6: case 9: case 11:
                    reload_dias(30);
                    break;
                case 2:
                    try
                    {
                        int year = int.Parse(cmBx_anho.SelectedValue);
                        if (year % 4 == 0 & ((year % 100 != 0) | (year % 100 == 0 & year % 400 == 0)))
                            reload_dias(29);
                        else
                            reload_dias(28);
                    }
                    catch { reload_dias(28); }
                    break;
            }
        }

        private void reload_dias(int max)
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

        protected void btn_register_Click(object sender, EventArgs e)
        {
            if (checkEmptySpaces())
            {
                MessageBox.Show("Todos los campos deben estar llenos.");
                return;
            }
            string strDoB = cmBx_dia.SelectedValue + "/" + cmBx_mes.SelectedValue + "/" + cmBx_anho.SelectedValue;
            DateTime DoB = Convert.ToDateTime(strDoB),
                     today = DateTime.Today;

            if ((today - DoB).TotalDays < 6570 /* 365*18 */ )
            {
                MessageBox.Show("El cliente debe tener un mínimo de edad de 18 años.");
                return;
            }

            try
            {
                //aqui va todo lo de SQL

                MessageBox.Show("Usuario registrado exitosamente.");
                Response.Redirect("LogInScreen.aspx");
            }
            catch
            {
                MessageBox.Show("Ha ocurrido un error al tratar de registrar el usuario. Inténtelo más tarde.");
            }
        }

        private bool checkEmptySpaces()
        {
            bool check = false,
                 nombre =   txtBx_nombre.Text.Equals(""),
                 apellido = txtBx_apellido.Text.Equals(""),
                 cedula =   txtBx_cedula.Text.Equals(""),
                 DoB = (cmBx_dia.SelectedIndex == 0) & (cmBx_mes.SelectedIndex == 0) & (cmBx_anho.SelectedIndex == 0),
                 correo =   txtBx_cedula.Text.Equals(""),
                 telefono = txtBx_telefono.Text.Equals(""),
                 username = txtBx_username.Text.Equals(""),
                 password = txtBx_password.Text.Equals("");

            if (nombre | apellido | cedula | DoB | correo | telefono | username | password)
                check = true;

            return check;
        }

        protected void btn_atras_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogInScreen.aspx");
        }
    }
}