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

        }

        void filcombox()
        {
           
            string q = "select Title from Project;";
            SqlCommand cmd = new SqlCommand(q, con);
            SqlDataReader myreader;
            try
            {
                con.Open();
                myreader = cmd.ExecuteReader();
                while (myreader.Read())
                {
                    string name = myreader.GetString("s");
                    comboBox1.Items.Add(s);
                }


            }
            

            con.Close();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}
