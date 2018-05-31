using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moduls_InsertNews : System.Web.UI.UserControl
{
 
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox_Author.Text = Convert.ToString(Session["Username"]);
    }

    protected void ButtonInsert_Click(object sender, EventArgs e)
    {
        
        MyDB.Insert(TextBox_Title.Text, TextBox_Author.Text, TextBox_Content.Text, FU_Image);
        Response.Redirect("~/Default.aspx");
    }
}