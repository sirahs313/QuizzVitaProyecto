﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuizzVitaProyecto.Principal
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NombreUsuario"] != null)
            {
                string nombreUsuario = Session["NombreUsuario"].ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "mostrarModal", $"mostrarModal('{nombreUsuario}');", true);
            }
        }
    }
}