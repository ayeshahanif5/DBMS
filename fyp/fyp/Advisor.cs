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
            string q1 = "(select id from Lookup where Value = '" + comboBox1.Text + "')";
            SqlCommand cm = new SqlCommand(q1, con);
            int s = Convert.ToInt32(cm.ExecuteScalar());

            string q = "insert into Advisor(Id,Designation, Salary) values('"+s+"',(select id from Lookup where Value  = '"+comboBox1.Text+"'), '"+ Convert.ToDecimal(txtsalary.Text)+ "')";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();
           
            MessageBox.Show("data insert sucessfuly");
            con.Close();

            
        }
    }
}
