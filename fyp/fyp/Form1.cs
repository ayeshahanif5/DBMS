using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace fyp
{
    public partial class Form1 : Form
    {
        SqlConnection con = new SqlConnection(@"Data Source=HAIER-PC;Initial Catalog=ProjectA;Integrated Security=True");
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            //con.Open();
            //if (con.State == ConnectionState.Open)
            //{
            con.Open();
            string q = "insert into Person(FirstName, LastName, Contact, Email, DateOfBirth, Gender) values('" + txtfname.Text + "', '" + txtlname.Text + "', '" + txtcontact.Text + "', '" + txtemail.Text + "', '" + Convert.ToDateTime(dateTimePicker1.Text) + "', (select id from Lookup where Value = '" + combogender.Text + "'))";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();
            string q1 = "select IDENT_CURRENT('Person')";
            SqlCommand cm= new SqlCommand(q1, con);
           int s = Convert.ToInt32( cm.ExecuteScalar());
          //  var s = Convert.ToInt32(q1);
            string q3 = "insert into Student (Id, RegistrationNo) values('"+s+"','" + txtRegistrationNo.Text + "')";
            SqlCommand c = new SqlCommand(q3, con);
            c.ExecuteNonQuery();
            MessageBox.Show("data insert sucessfuly");
            con.Close() ;
            //    SqlCommand cmd = new SqlCommand(q, con);
            //    cmd.ExecuteNonQuery();
            //    MessageBox.Show("data insert sucessfuly");
            //    txtfname.Text = "";
            //    txtlname.Text = "";
            //}
            //con.Close();

            //con.Open();
            //if (con.State == ConnectionState.Open)
            //{


            //    SqlCommand cmd = new SqlCommand("new11", con);
            //    cmd.Parameters.AddWithValue("@RegistrationNo", txtRegistrationNo.Text.Trim());
            //    cmd.ExecuteNonQuery();


            //}
            // con.Close();

            registration g = new registration();
            g.Show();
            this.Hide();

        }
        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
