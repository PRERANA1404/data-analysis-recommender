using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace data_Analysis_ad_Recommender_System
{
    public partial class ProductPage : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["shop"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string pid = Request.QueryString["Pid"];

                if (Session["UID"] != null && !string.IsNullOrEmpty(pid))
                {
                    int uid = int.Parse(Session["UID"].ToString());

                    // Use the Pid and UID for further processing
                    LoadProductDetails(pid, uid);
                }
                else
                {
                    // Redirect to login if session or Pid is invalid
                    Response.Redirect("loginPage.aspx");
                }
            }
        }

        private void LoadProductDetails(string pid, int uid)
        {
            string query = @"SELECT Photo1 ,Photo2,Photo3 FROM Product WHERE Pid=@PID";
            string query2 = @"SELECT pname,Brand,Price,Cat,Subcat  FROM Product WHERE Pid=@PID";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                using (SqlCommand cmd2 = new SqlCommand(query2, con))
                {
                    cmd.Parameters.AddWithValue("@PID", pid);
                    cmd2.Parameters.AddWithValue("@PID", pid);
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    using (SqlDataAdapter da2 = new SqlDataAdapter(cmd2))
                    {
                        DataTable dt = new DataTable();
                        DataTable dt2 = new DataTable();
                        da.Fill(dt);
                        da2.Fill(dt2);

                        // Bind the DataTable to the DataList
                        DataList1.DataSource = dt;
                        DataList1.DataBind();
                        DataList2.DataSource = dt2;
                        DataList2.DataBind();
                    }
                }
            }
        }
    }
}