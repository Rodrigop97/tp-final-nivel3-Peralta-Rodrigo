﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Maestra : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                
            }
            if (Request.Url.ToString().Contains("Inicio"))
                aInicio.Attributes["class"] = "nav-link active";
            if (Request.Url.ToString().Contains("Catalogo"))
                aCatalogo.Attributes["class"] = "nav-link active";
            if (Request.Url.ToString().Contains("Inicio"))
                aPerfil.Attributes["class"] = "nav-link active";
        }

        protected void txbBusqueda_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txbBusqueda.Text))
            {
                Response.Redirect("Catalogo.aspx?busqueda=" + txbBusqueda.Text);
                txbBusqueda.Text = "";
            }
        }
    }
}