using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_ActivationPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var page = HttpContext.Current.CurrentHandler as Page;

        if (MyDB.CheckActivation(Request["ActivationCode"]))
        {
            page.ClientScript.RegisterStartupScript(page.GetType(),
                                                            "activation();",
                                                            "function activationStatus() { $('.l-act').hide(); $('.l-activation-success').show(); }" +
                                                            "$(document).ready(activationStatus());",
                                                            true);
        }
        else
        {
            page.ClientScript.RegisterStartupScript(page.GetType(),
                                                                        "activation();",
                                                                        "function activationStatus() { $('.l-act').hide(); $('.l-activation-failure').show(); }" +
                                                                        "$(document).ready(activationStatus());",
                                                                        true);
        }
    }
}