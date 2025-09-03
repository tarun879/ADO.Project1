using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Data.SqlClient;

namespace ADO.Project1
{
        public partial class SignIn : System.Web.UI.Page
        {

            private string connectionString = "server=LAPTOP-7HL6VNO3;database=kaninibatch2;integrated security=true; trustservercertificate=true;";

            protected SqlConnection connection()
            {
                return new SqlConnection(connectionString);
            }

            protected void ClearPage()
            {
                txtUsername.Text = " ";
                txtPassword.Text = " ";
                txtEmail.Text = " ";
                txtConfirmPassword.Text = " ";
            }

            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    ClearPage();
                }
            }

            protected void Button1_Click(object sender, EventArgs e)
            {
                if (Page.IsValid && hdnJSValid.Value == "true")
                {
                    try
                    {
                        using (SqlConnection conn = connection())
                        {
                            SqlCommand cmd = new SqlCommand("select count(*) from Login where username=@username and password = @password", conn);
                            conn.Open();
                            cmd.Parameters.AddWithValue("@username", txtUsername.Text.Trim());
                            cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                            int count = (int)cmd.ExecuteScalar();
                            conn.Close();

                            if (count == 1)
                            {
                                Response.Write("<script>alert('User is already there so login');window.location='Login.aspx';</script>");
                            }
                            else
                            {
                                using (SqlConnection conn1 = connection())
                                {
                                    conn1.Open();
                                    using (SqlCommand cmd1 = new SqlCommand("insert into SignIn (username, password, confirmpassword, email) values (@username, @password, @confirmpassword, @email)", conn1))
                                    {
                                        cmd1.Parameters.AddWithValue("@username", txtUsername.Text.Trim());
                                        cmd1.Parameters.AddWithValue("@password", txtPassword.Text);
                                        cmd1.Parameters.AddWithValue("@confirmpassword", txtConfirmPassword.Text);
                                        cmd1.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                                        cmd1.ExecuteNonQuery();
                                    }
                                }
                                Response.Write("<script>alert('Registration successful!'); window.location='Login.aspx';</script>");
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
