using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace data_Analysis_ad_Recommender_System
{
    public partial class loginPage : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["shop"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_Click(object sender, EventArgs e)
        {
            if ((email.Text != "") && (pass.Text != ""))
            {
                string query = @"Select UID from [User] Where Email=@username AND Password=@Password";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters securely
                        cmd.Parameters.AddWithValue("@username", email.Text);
                        cmd.Parameters.AddWithValue("@Password", pass.Text);

                        con.Open();

                        // Execute the query and retrieve UID
                        object result = cmd.ExecuteScalar();

                        if (result != null)
                        {
                            // Store UID in session
                            Session["UID"] = result.ToString();

                            // Redirect to another page
                            Response.Redirect("RecommendePage.aspx");
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Login successful.');", true);
                        }
                        else
                        {
                            // Credentials are incorrect, show an error message
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid username or password.');", true);
                        }

                        con.Close();
                    }
                }
            }
            else if ((email.Text == "") && (pass.Text != ""))
            {
                string script = "alert('Enter your email Id');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", script, true);
            }
            else if ((email.Text != "") && (pass.Text == ""))
            {
                string script = "alert('Enter the Password');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", script, true);
            }
            else
            {
                string script = "alert('Enter your Email and password');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", script, true);
            }
        }
    }
}