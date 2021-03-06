﻿using System;
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
    public partial class evaluation : Form
    {
        SqlConnection con = new SqlConnection(@"Data Source=HAIER-PC;Initial Catalog=ProjectA;Integrated Security=True");
        public evaluation()
        {
            InitializeComponent();
        }

        private void evaluation_Load(object sender, EventArgs e)
        {
            fill();
        }

        void fill()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlDataAdapter adr = new SqlDataAdapter("select Id, Name, TotalMarks, TotalWeightage from Evaluation", con);

            DataTable tb = new DataTable();
            adr.Fill(tb);
            con.Close();
            dataGridView1.DataSource = tb;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string q = "insert into Evaluation(Name,TotalMarks ,TotalWeightage) values('" +txtname.Text+"', '"+Convert.ToInt32(txtmarks.Text)+ "','" + Convert.ToInt32(txtweightage.Text) + "' )";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();
            MessageBox.Show("data insert sucessfuly");
            txtname.Text = " ";
            txtmarks.Text = " ";
            txtweightage.Text = " ";
            con.Close();
        }

        private void btnedit_Click(object sender, EventArgs e)
        {
            con.Open();
            string q = "update Evaluation set Name='" + txtname.Text + "', TotalMarks='" + txtmarks.Text + "',TotalWeightage='" + txtweightage.Text + "' where Evaluation.Id= '" + Convert.ToInt32(label5.Text) + "'";
            SqlCommand c1 = new SqlCommand(q, con);
            c1.ExecuteNonQuery();
            MessageBox.Show("data edit sucessfuly");
            txtname.Text = " ";
            txtmarks.Text = " ";
            txtweightage.Text = " ";
            dataGridView1.DataSource = null;
            fill();
            con.Close();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
          
        }

        private void btndelete_Click(object sender, EventArgs e)
        {
            con.Open();
            string q1 = "delete from Evaluation where Id= '" + Convert.ToInt32(label5.Text) + "' ";
            SqlCommand c2 = new SqlCommand(q1, con);
            c2.ExecuteNonQuery();
            MessageBox.Show("data deleted sucessfuly");
            txtname.Text = " ";
            txtmarks.Text = " ";
            txtweightage.Text = " ";
            dataGridView1.DataSource = null;
            fill();
            con.Close();
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            int i = e.RowIndex;
            DataGridViewRow tr = dataGridView1.Rows[i];
            label5.Text = tr.Cells[0].Value.ToString();
            txtname.Text = tr.Cells[1].Value.ToString();
            txtmarks.Text = tr.Cells[2].Value.ToString();
            txtweightage.Text = tr.Cells[3].Value.ToString();
        }

        private void linkLabel2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            start s = new start();
            this.Hide();
            s.Show();
        }

        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!(char.IsLetter(e.KeyChar) || e.KeyChar == (char)Keys.Back || e.KeyChar == (char)Keys.Space))
            {

                e.Handled = true;
                MessageBox.Show("Please Enter only character.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }

        }

        private void textBox2_KeyPress(object sender, KeyPressEventArgs e)
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

        private void textBox3_KeyPress(object sender, KeyPressEventArgs e)
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

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtmarks_TextChanged(object sender, EventArgs e)
        {

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            GroupEvaluation g = new GroupEvaluation();
            g.Show();
            this.Hide();
        }
    }
}
