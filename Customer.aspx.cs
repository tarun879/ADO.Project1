using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Data.SqlClient;

namespace ADO.Project1
{
    public partial class Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.Visible = false;
            }
        }

        private void LoadCustomers()
        {
            using (SqlConnection conn = new SqlConnection("server=LAPTOP-7HL6VNO3;database=kaninibatch2;integrated security=true;trustservercertificate=true;"))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM customer", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void display_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            LoadCustomers();
        }

        protected void insert_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection("server=LAPTOP-7HL6VNO3;database=kaninibatch2;integrated security=true;trustservercertificate=true;"))
            {
                conn.Open();

                int customerid = Convert.ToInt32(CustomerId.Text);
                string name = Name.Text;
                string email = Email.Text;
                string phone = Phone.Text;
                DateTime dob = Convert.ToDateTime(DateOfBirth.Text);
                DateTime joindate = Convert.ToDateTime(JoinDate.Text);

                SqlCommand cmd = new SqlCommand("INSERT INTO customer VALUES (@id, @name, @email, @phone, @dob, @joindate)", conn);
                cmd.Parameters.AddWithValue("@id", customerid);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@dob", dob);
                cmd.Parameters.AddWithValue("@joindate", joindate);

                cmd.ExecuteNonQuery();
            }

            LoadCustomers();
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection("server=LAPTOP-7HL6VNO3;database=k    ;integrated security=true;trustservercertificate=true;"))
            {
                conn.Open();

                int customerid = Convert.ToInt32(CustomerId.Text);

                SqlCommand cmd = new SqlCommand("DELETE FROM customer WHERE customerid = @id", conn);
                cmd.Parameters.AddWithValue("@id", customerid);

                cmd.ExecuteNonQuery();
            }

            LoadCustomers();
        }

        protected void update_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection("server=LAPTOP-7HL6VNO3;database=kaninibatch2;integrated security=true;trustservercertificate=true;"))
            {
                conn.Open();

                int customerid = Convert.ToInt32(CustomerId.Text);
                string name = Name.Text;
                string email = Email.Text;
                string phone = Phone.Text;
                DateTime dob = Convert.ToDateTime(DateOfBirth.Text);
                DateTime joindate = Convert.ToDateTime(JoinDate.Text);

                SqlCommand cmd = new SqlCommand("UPDATE customer SET name = @name, email = @email, phone = @phone, dateofbirth = @dob, joindate = @joindate WHERE customerid = @id", conn);
                cmd.Parameters.AddWithValue("@id", customerid);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@dob", dob);
                cmd.Parameters.AddWithValue("@joindate", joindate);

                cmd.ExecuteNonQuery();
            }

            LoadCustomers();
        }

        protected void search_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection("server=LAPTOP-7HL6VNO3;database=kaninibatch2;integrated security=true;trustservercertificate=true;"))
            {
                conn.Open();

                int customerid = Convert.ToInt32(CustomerId.Text);

                SqlCommand cmd = new SqlCommand("SELECT * FROM customer WHERE customerid = @id", conn);
                cmd.Parameters.AddWithValue("@id", customerid);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void count_Click(object sender, EventArgs e)
        {
            int count = 0;
            using (SqlConnection conn = new SqlConnection("server=LAPTOP-7HL6VNO3;database=kaninibatch2;integrated security=true;trustservercertificate=true;"))
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM customer", conn);

                conn.Open();
                count = (int)cmd.ExecuteScalar();
            }

            string script = "window.onload = function() { alert('Total number of customers: " + count + "'); };";
            ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
        }

        protected void clear_Click(object sender, EventArgs e)
        {
            CustomerId.Text = "";
            Name.Text = "";
            Email.Text = "";
            Phone.Text = "";
            DateOfBirth.Text = "";
            JoinDate.Text = "";
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
