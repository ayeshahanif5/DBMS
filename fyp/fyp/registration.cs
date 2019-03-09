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
            SqlDataAdapter adr = new SqlDataAdapter("select FirstName, LastName, Contact, Email, DateOfBirth, RegistrationNo from Person INNER JOIN Student on Person.Id = Student.Id",con);
      
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
            Advisor a = new Advisor();
            this.Hide();
            a.Show();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
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

     
       
    }
}
