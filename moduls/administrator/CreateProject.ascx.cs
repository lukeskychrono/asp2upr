using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moduls_administrator_CreateProject : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateButtonOnClick(object sender, EventArgs e)
    {
        MyDB.CreateProject(TextBox_Title.Text, TextBox_Subheading.Text, TextBox_Description.Text, TextBox_Details.Text, FU_Image);
        Response.Redirect("~/Default.aspx");
    }
}