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
    public partial class registration : Form
    {
        SqlConnection con = new SqlConnection(@"Data Source=HAIER-PC;Initial Catalog=ProjectA;Integrated Security=True");
        public registration()
        {
            InitializeComponent();
        }

        void fill()
        {
            if (con.State == ConnectionState.Closed)
            con.Open();
           
            SqlDataAdapter adr = new SqlDataAdapter("select Person.Id,Person.FirstName, Person.LastName, Person.Contact, Person.Email, Person.DateOfBirth,Lookup.Value as Gender, Student.RegistrationNo from(( Person INNER JOIN Lookup on Lookup.Id=Person.Gender )  inner join Student on Person.Id = Student.Id)",con);
      
            DataTable tb = new DataTable();
            adr.Fill(tb);
            con.Close();
            dataGridView1.DataSource = tb;
        }
        private void registration_Load(object sender, EventArgs e)
        {
            fill();
            
        }

        private void btncreate_Click(object sender, EventArgs e)
        {
            //Advisor a = new Advisor();
            //this.Hide();
            //a.Show();
            creategroup c = new creategroup();
            this.Hide();
            c.Show();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            ////int i = e.RowIndex;
            ////DataGridViewRow select = dataGridView1.Rows[i];
            ////if (e.ColumnIndex == 8 && e.RowIndex == i)
            ////{
            ////    con.Open();
            ////    SqlDataAdapter dr = new SqlDataAdapter("", con);
            ////    DataTable tr = new DataTable();
            ////    dr.Fill(tr);
            ////    con.Close();
            ////    textBox1.Text = tr.Rows[0]["FirstName"].ToString();
            ////    textBox2.Text = tr.Rows[1]["LastName"].ToString();
            ////    textBox3.Text = tr.Rows[2]["Contact"].ToString();
            ////    textBox4.Text = tr.Rows[3]["Email"].ToString();
            ////    dateTimePicker1.Text = tr.Rows[4]["DateOfBirth"].ToString();
            ////    textBox5.Text = tr.Rows[5]["RegistrationNo"].ToString();
            ////    comboBox1.Text = tr.Rows[6]["Gender"].ToString();


            ////}



        }

        protected void update(object sender, DataGridViewCellEventArgs e)
        {
           
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            project p = new project();
            this.Hide();
            p.Show();

        }

        private void bindingNavigator1_RefreshItems(object sender, EventArgs e)
        {

        }

        private void bindingNavigatorDeleteItem_Click(object sender, EventArgs e)
        {

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            creategroup c = new creategroup();
            this.Hide();
            c.Show();
        }

        private void linkLabel2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            creategroup g = new creategroup();
            this.Hide();
            g.Show();
        }

        private void linkLabel3_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Form1 p = new Form1();
            this.Hide();
            p.Show();
        }

        private void registration_DoubleClick(object sender, EventArgs e)
        {

        }
        
        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            int i = e.RowIndex;
            DataGridViewRow tr = dataGridView1.Rows[i];
            textBox6.Text = tr.Cells[0].Value.ToString();
            textBox1.Text = tr.Cells[1].Value.ToString();
            textBox2.Text = tr.Cells[2].Value.ToString();
            textBox3.Text = tr.Cells[3].Value.ToString();
            textBox4.Text = tr.Cells[4].Value.ToString();

            dateTimePicker1.Value =DateTime.Parse( tr.Cells[5].Value.ToString());

            comboBox1.Text = tr.Cells[6].Value.ToString();
            textBox5.Text = tr.Cells[7].Value.ToString();
        }

        private void btnedit_Click_1(object sender, EventArgs e)
        {
            con.Open();
            try
            {
                string s = "select Id from Lookup where Value = '" + comboBox1.Text + "'";
                SqlCommand c = new SqlCommand(s, con);
                int b = Convert.ToInt32(c.ExecuteScalar());
                string q = "update Person set FirstName='" + textBox1.Text + "', LastName='" + textBox2.Text + "', Contact='" + textBox3.Text + "', Email='" + textBox4.Text + "',DateOfBirth='" + Convert.ToDateTime(dateTimePicker1.Value) + "',Gender = '" + b + "' where Person.Id='" + Convert.ToInt32(textBox6.Text) + "'";
                SqlCommand c1 = new SqlCommand(q, con);
                c1.ExecuteNonQuery();
                string q1 = "update Student set RegistrationNo='" + textBox5.Text + "' where Id='" + Convert.ToInt32(textBox6.Text) + "' ";
                SqlCommand c2 = new SqlCommand(q1, con);
                c2.ExecuteNonQuery();
                MessageBox.Show("data insert sucessfuly");
                textBox1.Text = " ";
                textBox2.Text = " ";
                textBox3.Text = " ";
                textBox4.Text = " ";
                textBox5.Text = " ";
                comboBox1.Text = " ";
                dataGridView1.DataSource = null;
                fill();
            }
            catch(Exception ex)
            {
                MessageBox.Show("sorry");
            }
            con.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            try
            {
                
                string q = "delete from Student where Id = '"+textBox6.Text+"'";
                SqlCommand c1 = new SqlCommand(q, con);
                c1.ExecuteNonQuery();
                string q1 = "delete from Person where Id= '" + textBox6.Text + "' ";
                SqlCommand c2 = new SqlCommand(q1, con);
                c2.ExecuteNonQuery();
                MessageBox.Show("data deleted sucessfuly");
                textBox1.Text = " ";
                textBox2.Text = " ";
                textBox3.Text = " ";
                textBox4.Text = " ";
                textBox5.Text = " ";
                comboBox1.Text = " ";
                dataGridView1.DataSource = null;
                fill();
            }
            catch (Exception ex)
            {
                MessageBox.Show("sorry");
            }
            con.Close();
        }
    }
}
