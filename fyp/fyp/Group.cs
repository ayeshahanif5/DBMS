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
    public partial class Group : Form
    {
       
        public Group()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection(@"Data Source=HAIER-PC;Initial Catalog=ProjectA;Integrated Security=True");
        private void Group_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
             dataGridView2.Rows.Clear();
            foreach (DataGridViewRow item in dataGridView1.Rows)
            {
                if ((bool)item.Cells[0].Value == true)
                {
                    int n = dataGridView2.Rows.Add();
                    dataGridView2.Rows[n].Cells[0].Value = item.Cells[1].Value.ToString();
                   
                
                }

            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlDataAdapter add = new SqlDataAdapter("Select * From Student", con);
            DataTable b = new DataTable();
            add.Fill(b);
            dataGridView1.Rows.Clear();
            foreach (DataRow item in b.Rows)
            {
                int n = dataGridView1.Rows.Add();
                dataGridView1.Rows[n].Cells[0].Value = false;
                dataGridView1.Rows[n].Cells[1].Value = item["RegistrationNo"].ToString();
               
               
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_MouseClick(object sender, MouseEventArgs e)
        {
            if ((bool)dataGridView1.SelectedRows[0].Cells[0].Value == false)
            {
               dataGridView1.SelectedRows[0].Cells[0].Value = true;
            }
            else
            {
              dataGridView1.SelectedRows[0].Cells[0].Value = false;
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btnADD_Click(object sender, EventArgs e)
        {
            con.Open();
            try
            {
                string query = "insert into [Group](Created_On) values ('" + Convert.ToDateTime(dateTimePicker1.Text).ToString() + "') ";
                SqlDataAdapter dt = new SqlDataAdapter(query, con);
                dt.SelectCommand.ExecuteNonQuery();

            for (int i = 0; i < dataGridView2.Rows.Count - 1; i++)
            {
                string q1 = "(select Id from[Group] where Created_On = '" + Convert.ToDateTime(dateTimePicker1.Text).ToString() + "')";
                SqlCommand cm = new SqlCommand(q1, con);
                int s = Convert.ToInt32(cm.ExecuteScalar());

                string q = "(select Id from Student where RegistrationNo='" + dataGridView2.Rows[i].Cells[0].Value + "')";
                SqlCommand c = new SqlCommand(q, con);
                int s1 = Convert.ToInt32(c.ExecuteScalar());


                SqlCommand cmd = new SqlCommand("insert into GroupStudent(GroupId,StudentId,Status,AssignmentDate) Values('"+s+"', '"+s1+"', (Select Id from Lookup where Value='" + comboBox1.Text + "'),'" + Convert.ToDateTime(dateTimePicker2.Text).ToString() + "')", con);


                cmd.ExecuteNonQuery();
            }
            MessageBox.Show("added successfuly");
        }
            catch (Exception ex)
            {
                MessageBox.Show("already exist");
            }
    con.Close();
                dataGridView2.Rows.Clear();
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            registration r = new registration();
            this.Hide();
            r.Show();
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
