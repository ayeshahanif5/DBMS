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
    public partial class project : Form
    {
        SqlConnection con = new SqlConnection(@"Data Source=HAIER-PC;Initial Catalog=ProjectA;Integrated Security=True");
        public project()
        {
            InitializeComponent();
        }

        private void project_Load(object sender, EventArgs e)
        {
            fill();
        }

        private void btnadd_Click(object sender, EventArgs e)
        {
            con.Open();
            try
            {
                string q = "insert into Project(Description,Title) values( '" + txtdes.Text + "','" + txttitle.Text + "')";
                SqlCommand cmd = new SqlCommand(q, con);
                cmd.ExecuteNonQuery();
                MessageBox.Show("data insert sucessfuly");
                txtdes.Text = " ";
                txttitle.Text = " ";

                assingrple a = new assingrple();
                this.Hide();
                a.Show();
            }

            catch (Exception ex)
            {
                MessageBox.Show("alreadyexist");
            }
            con.Close();
        }

        private void txtdes_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!(char.IsLetter(e.KeyChar) || e.KeyChar == (char)Keys.Back || e.KeyChar == (char)Keys.Space))
            {

                e.Handled = true;
                MessageBox.Show("Please Enter only character.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }
        }

        private void txttitle_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!(char.IsLetter(e.KeyChar) || e.KeyChar == (char)Keys.Back || e.KeyChar == (char)Keys.Space))
            {

                e.Handled = true;
                MessageBox.Show("Please Enter only character.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            assingrple s = new assingrple();
            this.Hide();
            s.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string q1 = " update ProjectAdvisor set ProjectId = '" + Convert.ToInt32(lblId.Text) + "' where ProjectId= '" + Convert.ToInt32(lblId.Text) + "'";
            SqlCommand c = new SqlCommand(q1, con);
            c.ExecuteNonQuery();
            string q = "update Project set Description='" + txtdes.Text + "', Title='" + txttitle.Text + "' where Project.Id= '"+ Convert.ToInt32( lblId.Text)+"'";
            SqlCommand c1 = new SqlCommand(q, con);
            c1.ExecuteNonQuery();
            
            MessageBox.Show("data edit sucessfuly");
            txtdes.Text = " ";
            txttitle.Text = " ";
            dataGridView1.DataSource = null;
            fill();
            con.Close();
        }

        void fill()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlDataAdapter adr = new SqlDataAdapter("select Id,Description,Title from Project ", con);

            DataTable tb = new DataTable();
            adr.Fill(tb);
            con.Close();
            dataGridView1.DataSource = tb;
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            int i = e.RowIndex;
            DataGridViewRow tr = dataGridView1.Rows[i];
            lblId.Text = tr.Cells[0].Value.ToString();
            txtdes.Text = tr.Cells[1].Value.ToString();
            txttitle.Text = tr.Cells[2].Value.ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            string q = "delete from ProjectAdvisor where ProjectId = '" + Convert.ToInt32(lblId.Text) + "' ";
            SqlCommand c = new SqlCommand(q, con);
            c.ExecuteNonQuery();
            string q1 = "delete from Project where Id= '" +Convert.ToInt32( lblId.Text )+ "' ";
            SqlCommand c2 = new SqlCommand(q1, con);
            c2.ExecuteNonQuery();
            MessageBox.Show("data deleted sucessfuly");
            txtdes.Text = " ";
            txttitle.Text = " ";
            dataGridView1.DataSource = null;
            fill();
            con.Close();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void linkLabel2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Advisor a = new Advisor();
            this.Hide();
            a.Show();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
