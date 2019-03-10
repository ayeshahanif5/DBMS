namespace fyp
{
    partial class Advisor
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtsalary = new System.Windows.Forms.TextBox();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.btnadd = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(112, 61);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(63, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Designation";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(112, 104);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(36, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Salary";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // txtsalary
            // 
            this.txtsalary.Location = new System.Drawing.Point(256, 97);
            this.txtsalary.Name = "txtsalary";
            this.txtsalary.Size = new System.Drawing.Size(141, 20);
            this.txtsalary.TabIndex = 2;
            this.txtsalary.TextChanged += new System.EventHandler(this.txtsalary_TextChanged);
            this.txtsalary.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtsalary_KeyPress);
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Items.AddRange(new object[] {
            "Professor",
            "Associate Professor",
            "Assisstant Professor",
            "Lecturer"});
            this.comboBox1.Location = new System.Drawing.Point(256, 58);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(141, 21);
            this.comboBox1.TabIndex = 3;
            // 
            // btnadd
            // 
            this.btnadd.Location = new System.Drawing.Point(307, 145);
            this.btnadd.Name = "btnadd";
            this.btnadd.Size = new System.Drawing.Size(90, 35);
            this.btnadd.TabIndex = 4;
            this.btnadd.Text = "add";
            this.btnadd.UseVisualStyleBackColor = true;
            this.btnadd.Click += new System.EventHandler(this.btnadd_Click);
            // 
            // Advisor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(515, 276);
            this.Controls.Add(this.btnadd);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.txtsalary);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Advisor";
            this.Text = "Advisor";
            this.Load += new System.EventHandler(this.Advisor_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtsalary;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Button btnadd;
    }
}