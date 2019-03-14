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
    public partial class evaluation : Form
    {
        SqlConnection con = new SqlConnection(@"Data Source=HAIER-PC;Initial Catalog=ProjectA;Integrated Security=True");
        public evaluation()
        {
            InitializeComponent();
        }

        private void evaluation_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string q = "insert into Evaluation(Name,TotalMarks ,TotalWeightage) values('" +textBox1.Text+"', '"+Convert.ToInt32(textBox2.Text)+ "','" + Convert.ToInt32(textBox3.Text) + "' )";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();
            MessageBox.Show("data insert sucessfuly");
            textBox1.Text = " ";
            textBox2.Text = " ";
            textBox3.Text = " ";
            con.Close();
        }
    }
}
