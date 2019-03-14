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
    public partial class creategroup : Form
    {
        SqlConnection con = new SqlConnection(@"Data Source=HAIER-PC;Initial Catalog=ProjectA;Integrated Security=True");
        public creategroup()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void creategroup_Load(object sender, EventArgs e)
        {
            selectstudents(); 
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //label3.Text = " ";
            //foreach(object i in SelectStudents.SelectedItems)
            //{

            //    MessageBox.Show(i.ToString() );
            //    //label3.Text = (label3.Text == "" ? "":",");
            //}
            var selected = SelectStudents.GetItemText(SelectStudents.SelectedValue);
            label3.Text = selected;
        }

        private void SelectStudents_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        void selectstudents()
        {
            string cq = "(select RegistrationNo from Student )";

            using (SqlDataAdapter dr = new SqlDataAdapter(cq, con))
            {
                DataTable db = new DataTable();
                dr.Fill(db);
                DataRow s = db.NewRow();
                db.Rows.InsertAt(s, 0);
                SelectStudents.DataSource = db;
                SelectStudents.DisplayMember = "RegistrationNo";
                SelectStudents.ValueMember = "RegistrationNo";
            }
        }
    }
}
