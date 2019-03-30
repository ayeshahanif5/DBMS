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
    public partial class GroupEvaluation : Form
    {
        public GroupEvaluation()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection(@"Data Source=HAIER-PC;Initial Catalog=ProjectA;Integrated Security=True");
        private void GroupEvaluation_Load(object sender, EventArgs e)
        {
            com1();
            com2();
            fill();
        }


        private void btnadd_Click(object sender, EventArgs e)
        {
            con.Open();
            try
            {

                string q = "insert into GroupEvaluation(GroupId,EvaluationId,ObtainedMarks,EvaluationDate) values( (SELECT Id FROM [Group] WHERE Id='" + comboBox1.Text + "'),(SELECT Id FROM Evaluation WHERE Name='" + comboBox2.Text + "'),'" + Convert.ToInt32(textBox1.Text) + "' ,'" + Convert.ToDateTime(dateTimePicker1.Value) + "' )";
                SqlCommand c = new SqlCommand(q, con);
                c.ExecuteNonQuery();
                MessageBox.Show("added");
            }
            catch (Exception ex)
            {
                MessageBox.Show("already exist");
            }

            con.Close();
        }


        void com1()
        {
            string cq = "SELECT Id FROM [Group]";

            using (SqlDataAdapter dr = new SqlDataAdapter(cq, con))
            {
                DataTable db = new DataTable();
                dr.Fill(db);
                DataRow s = db.NewRow();
                //s[0] = "choose";
                //db.Rows.InsertAt(s, 0);
                comboBox1.DataSource = db;
                comboBox1.DisplayMember = "Id";
                comboBox1.ValueMember = "Id";
                comboBox1.Text = " ";
            }

        }


        void com2()
        {
            string cq1 = "select Name from Evaluation";
            using (SqlDataAdapter dr = new SqlDataAdapter(cq1, con))
            {
                DataTable a = new DataTable();
                dr.Fill(a);
                DataRow s = a.NewRow();
                //s[0] = "Please choose";
                //a.Rows.InsertAt(s, 0);

                comboBox2.DataSource = a;
                comboBox2.DisplayMember = "Name";
                comboBox2.ValueMember = "Name";
                comboBox2.Text = " ";
            }
        }


        void fill()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlDataAdapter adr = new SqlDataAdapter("select GroupId,EvaluationId,ObtainedMarks,EvaluationDate from GroupEvaluation ", con);

            DataTable tb = new DataTable();
            adr.Fill(tb);
            con.Close();
            dataGridView1.DataSource = tb;
        }

        private void linkLabel2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            GroupProject p = new GroupProject();
            p.Show();
            this.Hide();

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            evaluation ex = new evaluation();
            ex.Show();
            this.Hide();
        }

        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
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
