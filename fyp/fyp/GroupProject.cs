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
    public partial class GroupProject : Form
    {
        public GroupProject()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection(@"Data Source=HAIER-PC;Initial Catalog=ProjectA;Integrated Security=True");
        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            try
            {

                string q = "insert into GroupProject(ProjectId,GroupId,AssignmentDate) values( (select Id from Project where Title='" + comboBox1.Text + "'), (SELECT Id FROM [Group] WHERE Id='" + comboBox2.Text + "') ,'" + Convert.ToDateTime(dateTimePicker1.Value) + "' )";
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
            string cq = "SELECT Title FROM Project";

            using (SqlDataAdapter dr = new SqlDataAdapter(cq, con))
            {
                DataTable db = new DataTable();
                dr.Fill(db);
                DataRow s = db.NewRow();
                //s[0] = "choose";
                //db.Rows.InsertAt(s, 0);
                comboBox1.DataSource = db;
                comboBox1.DisplayMember = "Title";
                comboBox1.ValueMember = "Title";
                comboBox1.Text = " ";
            }

        }


       

        void fill()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlDataAdapter adr = new SqlDataAdapter("select ProjectId,GroupId,AssignmentDate from GroupProject ", con);

            DataTable tb = new DataTable();
            adr.Fill(tb);
            con.Close();
            dataGridView1.DataSource = tb;
        }

        private void GroupProject_Load(object sender, EventArgs e)
        {
            com1();
            com2();
            fill();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        void com2()
        {
            string cq = "SELECT Id FROM [Group]";

            using (SqlDataAdapter dr = new SqlDataAdapter(cq, con))
            {
                DataTable db = new DataTable();
                dr.Fill(db);
                DataRow s = db.NewRow();
                //s[0] = "choose";
                //db.Rows.InsertAt(s, 0);
                comboBox2.DataSource = db;
                comboBox2.DisplayMember = "Id";
                comboBox2.ValueMember = "Id";
                comboBox2.Text = " ";
            }

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            GroupEvaluation f = new GroupEvaluation();
            f.Show();
            this.Hide();
        }
    }

}
