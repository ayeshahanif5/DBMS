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

        void fill()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlDataAdapter adr = new SqlDataAdapter("select Id,Designation,Salary from Advisor ", con);

            DataTable tb = new DataTable();
            adr.Fill(tb);
            con.Close();
            dataGridView1.DataSource = tb;
        }

        private void Advisor_Load(object sender, EventArgs e)
        {
            fill();
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

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            start p = new start();
            this.Hide();
            p.Show();
        }

        private void linkLabel2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            project p = new project();
            this.Hide();
            p.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string q1 = " update ProjectAdvisor set AdvisorId = '" + Convert.ToInt32(label3.Text) + "' where ProjectId= '" + Convert.ToInt32(label3.Text) + "'";
            SqlCommand c = new SqlCommand(q1, con);
            c.ExecuteNonQuery();
            string q = "update Advisor set Salary='" + txtsalary.Text + "' where Advisor.Id= '" + Convert.ToInt32(label3.Text) + "'";
            SqlCommand c1 = new SqlCommand(q, con);
            c1.ExecuteNonQuery();

            MessageBox.Show("data edit sucessfuly");
            comboBox1.Text = " ";
            txtsalary.Text = " ";
            dataGridView1.DataSource = null;
            fill();
            con.Close();
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            int i = e.RowIndex;
            DataGridViewRow tr = dataGridView1.Rows[i];
            label3.Text = tr.Cells[0].Value.ToString();
            comboBox1.Text = tr.Cells[1].Value.ToString();
            txtsalary.Text = tr.Cells[2].Value.ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            string q = "delete from ProjectAdvisor where AdvisorId = '" + Convert.ToInt32(label3.Text) + "' ";
            SqlCommand c = new SqlCommand(q, con);
            c.ExecuteNonQuery();
            string q1 = "delete from Advisor where Id= '" + Convert.ToInt32(label3.Text) + "' ";
            SqlCommand c2 = new SqlCommand(q1, con);
            c2.ExecuteNonQuery();
            MessageBox.Show("data deleted sucessfuly");
            comboBox1.Text = " ";
            txtsalary.Text = " ";
            dataGridView1.DataSource = null;
            fill();
            con.Close();
        }
    }
}
