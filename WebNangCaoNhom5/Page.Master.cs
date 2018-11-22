using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebNangCaoNhom5
{
    public partial class Page : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void on_click_login()
        {

        }

        protected void on_click_signin()
        {
            using(SqlConnection connection = new SqlConnection())
            {
                connection.ConnectionString = "";
                using(SqlCommand command = new SqlCommand())
                {
                    connection.Open();
                    command.Connection = connection;

                }
            }
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {

        }
    }
}