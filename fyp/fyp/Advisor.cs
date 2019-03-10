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
    public partial class Advisor : Form
    {
        SqlConnection con = new SqlConnection(@"Data Source=HAIER-PC;Initial Catalog=ProjectA;Integrated Security=True");
        public Advisor()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void btnadd_Click(object sender, EventArgs e)
        {
            con.Open();
            try
            {
                string q1 = "(select id from Lookup where Value = '" + comboBox1.Text + "')";
                SqlCommand cm = new SqlCommand(q1, con);
                int s = Convert.ToInt32(cm.ExecuteScalar());
                string q = "insert into Advisor(Id,Designation, Salary) values('" + s + "',(select id from Lookup where Value  = '" + comboBox1.Text + "'), '" + Convert.ToDecimal(txtsalary.Text) + "')";
                SqlCommand cmd = new SqlCommand(q, con);
                cmd.ExecuteNonQuery();
                MessageBox.Show("data insert sucessfuly");
                comboBox1.Text = " ";
                txtsalary.Text = " ";
            }
            catch (Exception ex)
            {
                MessageBox.Show("alreadyexist");

            }

                con.Close();

            
        }

        private void Advisor_Load(object sender, EventArgs e)
        {

        }

        private void txtsalary_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtsalary_KeyPress(object sender, KeyPressEventArgs e)
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
    }
}
