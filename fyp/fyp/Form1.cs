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
            con.Open();
            try
            {
                string q = "insert into Person(FirstName, LastName, Contact, Email, DateOfBirth, Gender) values('" + txtfname.Text + "', '" + txtlname.Text + "', '" + txtcontact.Text + "', '" + txtemail.Text + "', '" + Convert.ToDateTime(dateTimePicker1.Text) + "', (select id from Lookup where Value = '" + combogender.Text + "'))";
                SqlCommand cmd = new SqlCommand(q, con);
                cmd.ExecuteNonQuery();
                string q1 = "select IDENT_CURRENT('Person')";
                SqlCommand cm= new SqlCommand(q1, con);
                int s = Convert.ToInt32( cm.ExecuteScalar());
                string q3 = "insert into Student (Id, RegistrationNo) values('"+s+"','" + txtRegistrationNo.Text + "')";
                SqlCommand c = new SqlCommand(q3, con);
                c.ExecuteNonQuery();
                MessageBox.Show("data insert sucessfuly");
                txtfname.Text = " ";
                txtlname.Text = " ";
                txtcontact.Text = " ";
                txtemail.Text = " ";
                txtRegistrationNo.Text = " ";

              
                registration g = new registration();
                g.Show();
                this.Hide();
            }
            catch (Exception ex)
            {
                MessageBox.Show("sorry");
            }
            con.Close();

        }
        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            //registration g = new registration();
            //g.Show();
            //this.Hide();

        }

        private void Form1_KeyPress(object sender, KeyPressEventArgs e)
        {
           
        }

        private void txtcontact_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtcontact_KeyPress(object sender, KeyPressEventArgs e)
        {
            if ((e.KeyChar >= 48 && e.KeyChar <= 57) || e.KeyChar == 8)
            {


                e.Handled = false;

            }
            else
            {
                MessageBox.Show("Please Enter only Number.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Stop);
                e.Handled = true;

            }
        }

        private void txtfname_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!(char.IsLetter(e.KeyChar) || e.KeyChar == (char)Keys.Back || e.KeyChar == (char)Keys.Space))
            {

                e.Handled = true;
                MessageBox.Show("Please Enter only character.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }
           
        }
        private void txtlname_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!(char.IsLetter(e.KeyChar) || e.KeyChar == (char)Keys.Back || e.KeyChar == (char)Keys.Space))
            {

                e.Handled = true;
                MessageBox.Show("Please Enter only character.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }
        }
    }
}
