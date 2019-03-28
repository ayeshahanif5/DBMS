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
    public partial class assingrple : Form
    {
        SqlConnection con = new SqlConnection(@"Data Source=HAIER-PC;Initial Catalog=ProjectA;Integrated Security=True");
        public assingrple()
        {
            InitializeComponent();
        }

        private void assingrple_Load(object sender, EventArgs e)
        {
            com1();
            com2();
            fill();
        }


        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();

            try
            {
                string q = "insert into ProjectAdvisor(AdvisorId,ProjectId,AdvisorRole,AssignmentDate) values( (select Id from Lookup WHERE Value='" + comboBox2.Text + "'),(select Id from Project where Title='" + comboBox1.Text + "'),(select Id from Lookup WHERE Value='" + comboBox2.Text + "'),'" + Convert.ToDateTime(dateTimePicker1.Value) + "')";
                SqlCommand c = new SqlCommand(q, con);
                c.ExecuteNonQuery();
                MessageBox.Show("added");
            }
            catch(Exception ex)
            {
                MessageBox.Show("already exist");
            }
            con.Close();
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

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


        void com2()
        {
            string cq1 = "select Lookup.Value from Lookup inner join Advisor on Advisor.Designation=Lookup.Id";
            using (SqlDataAdapter dr = new SqlDataAdapter(cq1, con))
            {
                DataTable a = new DataTable();
                dr.Fill(a);
                DataRow s = a.NewRow();
                //s[0] = "Please choose";
                //a.Rows.InsertAt(s, 0);

                comboBox2.DataSource = a;
                comboBox2.DisplayMember = "Value";
                comboBox2.ValueMember = "Value";
                comboBox2.Text = " ";
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        void fill()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlDataAdapter adr = new SqlDataAdapter("select AdvisorId,ProjectId,AdvisorRole,AssignmentDate from ProjectAdvisor ", con);

            DataTable tb = new DataTable();
            adr.Fill(tb);
            con.Close();
            dataGridView1.DataSource = tb;
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            project p = new project();
            this.Hide();
            p.Show();
        }

        private void dataGridView1_CellContentDoubleClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            int i = e.RowIndex;
            DataGridViewRow tr = dataGridView1.Rows[i];
           // label3.Text = tr.Cells[0].Value.ToString();
            comboBox1.Text = tr.Cells[0].Value.ToString();
            comboBox2.Text = tr.Cells[1].Value.ToString();
            dateTimePicker1.Value =Convert.ToDateTime( tr.Cells[3].Value.ToString());
        }
    }

}
