using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Data.SqlClient;

namespace ADO.Project1

    {
        public partial class Login : System.Web.UI.Page
        {
        private string connectionString = "server=LAPTOP-7HL6VNO3;database=kaninibatch2;integrated security=true; trustservercertificate=true;";
        public static string Username;
            protected SqlConnection connection()
            {
                return new SqlConnection(connectionString);
            }
            protected void ClearPage()
            {
                txtusername.Text = "";
                txtpassword.Text = " ";
            }

            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    ClearPage();
                }

            }

            protected void btnLogin_Click(object sender, EventArgs e)
            {
                if (Page.IsValid)
                {
                    string username = txtusername.Text.Trim();
                    string password = txtpassword.Text;
                    Username = username;

                    try
                    {
                        using (SqlConnection conn = connection())
                        {
                            conn.Open();
                            string query = "select count(*) from Login where username = @Username and password = @Password";

                            using (SqlCommand cmd = new SqlCommand(query, conn))
                            {
                                cmd.Parameters.AddWithValue("@Username", username);
                                cmd.Parameters.AddWithValue("@Password", password);

                                int userCount = (int)cmd.ExecuteScalar();

                                if (userCount == 1)
                                {
                                    Session["username"] = username;

                                    if (username.ToLower() == "admin")
                                    {
                                        Response.Write("<script>alert('Admin login successful!'); window.location='CRUDAdmin.aspx';</script>");
                                    }
                                    else
                                    {
                                        Response.Write("<script>alert('User login successful!'); window.location='CRUD.aspx';</script>");
                                    }
                                }
                                else
                                {
                                    Response.Write("<script>alert('Invalid username or password.');</script>");
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
                    }
                }
            }

        }
    }
