using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void NewPasswordBtn_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        string DBPassword = "";

        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT Password FROM Users WHERE Username = @Username"))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Username", Convert.ToString(Session["Username"]));
                cmd.Connection = con;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                DBPassword = Convert.ToString(reader["Password"]);
                con.Close();
            }
        }

        if (Global.VerifyHashedPassword(DBPassword, inputPasswordOld.Text) == false)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "script", "<script type='text/javascript'>var $span = $('<span/>'); $span.addClass('form-text').addClass('small'); $span.css('color', 'red'); $span.text('Паролата не съвпада'); $('#Content_inputPasswordOld').parent().append($span);</script>");
        }
        else if (inputPasswordNew.Text != inputPasswordNewVerify.Text || inputPasswordNew.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "script", "<script type='text/javascript'>var $span = $('<span/>'); $span.addClass('form-text').addClass('small'); $span.css('color', 'red'); $span.text('Новите пароли не съвпадат'); $('#Content_inputPasswordNew').parent().append($span);</script>");
        }
        else
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Users SET Password = @Password WHERE Username = @Username"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@Username", Session["Username"]);
                    cmd.Parameters.AddWithValue("@Password", Global.HashPassword(inputPasswordNew.Text));
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            Page.ClientScript.RegisterStartupScript(GetType(), "script", "<script type='text/javascript'>var $p = $('<p>').css('color', 'green').text('Успешно променихте паролата си.'); $('.l-pwd-container').append($p);</script>");
        }
        //Response.Redirect("~/Default.aspx");
    }
}