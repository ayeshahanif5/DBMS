using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace fyp
{
    public partial class start : Form
    {
        public start()
        {
            InitializeComponent();
        }

        private void btnas_Click(object sender, EventArgs e)
        {
            Form1 p = new Form1();
            this.Hide();
            p.Show();
        }

        private void btnadvisor_Click(object sender, EventArgs e)
        {
            Advisor a = new Advisor();
            this.Hide();
            a.Show();
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            evaluation x = new evaluation();
            this.Hide();
            x.Show();
        }
    }
}
