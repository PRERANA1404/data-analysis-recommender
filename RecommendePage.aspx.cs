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
    public partial class RecommendePage : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["shop"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindHistory();
                BindOrder();
            }
        }

        //private void BindOrder()
        //{
        //    // Retrieve UID from the session and ensure it is valid
        //    if (Session["UID"] != null && int.TryParse(Session["UID"].ToString(), out int userId))
        //    {
        //        string query = @" SELECT pname,Photo1 As Photo,Price, Cat FROM product WHERE cat IN ( SELECT cat FROM product WHERE pid IN (SELECT pid FROM orderitems WHERE oid IN (SELECT oid FROM User_Order WHERE uid = @UID ))) AND Subcat IN ( SELECT Subcat FROM product WHERE pid IN (SELECT pid FROM orderitems WHERE oid IN (SELECT oid FROM User_Order WHERE uid = @UID )))AND brand IN (SELECT Brand FROM product WHERE pid IN (SELECT pid FROM orderitems WHERE oid IN ( SELECT oid FROM User_Order  WHERE uid = @UID)));";

        //        using (SqlConnection con = new SqlConnection(connectionString))
        //        {
        //            using (SqlCommand cmd = new SqlCommand(query, con))
        //            {
        //                cmd.Parameters.AddWithValue("@UID", userId);

        //                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        //                {
        //                    DataTable dt = new DataTable();
        //                    da.Fill(dt);

        //                    if (dt.Rows.Count > 0)
        //                    {
        //                        // Bind data if there are orders
        //                        DataList2.DataSource = dt;
        //                        DataList2.DataBind();
        //                        OrderContainer.Visible = true; // Show the container
        //                    }
        //                    else
        //                    {
        //                        // Hide the container if no data
        //                        OrderContainer.Visible = false;
        //                    }
        //                }
        //            }
        //        }
        //    }
        //    else
        //    {
        //        // Redirect to login page if session is invalid
        //        Response.Redirect("loginPage.aspx");
        //    }
        //}


        private void BindOrder()
        {
            // Retrieve UID from the session and ensure it is valid
            if (Session["UID"] != null && int.TryParse(Session["UID"].ToString(), out int userId))
            {
                string query1 = @" SELECT pname,Photo1 As Photo,Price, Cat,Pid FROM product WHERE cat IN ( SELECT cat FROM product WHERE pid IN (SELECT pid FROM orderitems WHERE oid IN (SELECT oid FROM User_Order WHERE uid = @UID ))) AND Subcat IN ( SELECT Subcat FROM product WHERE pid IN (SELECT pid FROM orderitems WHERE oid IN (SELECT oid FROM User_Order WHERE uid = @UID )))AND brand IN (SELECT Brand FROM product WHERE pid IN (SELECT pid FROM orderitems WHERE oid IN ( SELECT oid FROM User_Order  WHERE uid = @UID)));";

                string query2 = @"SELECT pname,Photo1 As Photo,Price,Cat,Pid FROM Product WHERE Pid IN (SELECT pid FROM Orderitems WHERE oid IN (SELECT oid FROM User_Order WHERE TotalItems >= 2 AND uid != @UID));";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd1 = new SqlCommand(query1, con))
                    using (SqlCommand cmd2 = new SqlCommand(query2, con))
                    {
                        cmd1.Parameters.AddWithValue("@UID", userId);
                        cmd2.Parameters.AddWithValue("@UID", userId);

                        using (SqlDataAdapter da1 = new SqlDataAdapter(cmd1))
                        using (SqlDataAdapter da2 = new SqlDataAdapter(cmd2))
                        {
                            DataTable dt1 = new DataTable();
                            DataTable dt2 = new DataTable();

                            da1.Fill(dt1);
                            da2.Fill(dt2);

                            // Combine both DataTables, ensuring no duplicate rows
                            var combinedData = dt1.AsEnumerable()
                                .Union(dt2.AsEnumerable(), DataRowComparer.Default);

                            DataTable finalTable = combinedData.CopyToDataTable();

                            if (finalTable.Rows.Count > 0)
                            {
                                // Bind combined data to DataList2
                                DataList2.DataSource = finalTable;
                                DataList2.DataBind();
                                OrderContainer.Visible = true; // Show the container
                            }
                            else
                            {
                                // Hide the container if no data
                                OrderContainer.Visible = false;
                            }
                        }
                    }
                }
            }
            else
            {
                // Redirect to login page if session is invalid
                Response.Redirect("loginPage.aspx");
            }
        }

        private void BindHistory()
        {
            // Retrieve UID from the session and ensure it is valid
            if (Session["UID"] != null && int.TryParse(Session["UID"].ToString(), out int userId))
            {
                string query = @"SELECT p.pname,p.Photo1 As Photo,p.Price, p.Cat,p.Pid FROM product p WHERE EXISTS (SELECT 1 FROM product ps WHERE ps.pid IN (SELECT us.pid FROM User_search us WHERE us.uid = @UID) AND p.subcat = ps.subcat AND p.cat = ps.cat);";
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@UID", userId);

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            // Bind the DataTable to the DataList
                            DataList1.DataSource = dt;
                            DataList1.DataBind();
                        }
                    }
                }
            }
            else
            {
                // Redirect to login page if session is invalid
                Response.Redirect("loginPage.aspx");
            }
        }
    }
}