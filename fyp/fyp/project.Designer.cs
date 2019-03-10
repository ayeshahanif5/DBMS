namespace fyp
{
    partial class project
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
            this.txtdes = new System.Windows.Forms.TextBox();
            this.txttitle = new System.Windows.Forms.TextBox();
            this.btnadd = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(97, 80);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(60, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Description";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(97, 119);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(27, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Title";
            // 
            // txtdes
            // 
            this.txtdes.Location = new System.Drawing.Point(274, 73);
            this.txtdes.Name = "txtdes";
            this.txtdes.Size = new System.Drawing.Size(136, 20);
            this.txtdes.TabIndex = 2;
            this.txtdes.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtdes_KeyPress);
            // 
            // txttitle
            // 
            this.txttitle.Location = new System.Drawing.Point(274, 116);
            this.txttitle.Name = "txttitle";
            this.txttitle.Size = new System.Drawing.Size(136, 20);
            this.txttitle.TabIndex = 3;
            this.txttitle.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txttitle_KeyPress);
            // 
            // btnadd
            // 
            this.btnadd.Location = new System.Drawing.Point(318, 159);
            this.btnadd.Name = "btnadd";
            this.btnadd.Size = new System.Drawing.Size(92, 34);
            this.btnadd.TabIndex = 4;
            this.btnadd.Text = "add";
            this.btnadd.UseVisualStyleBackColor = true;
            this.btnadd.Click += new System.EventHandler(this.btnadd_Click);
            // 
            // project
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(523, 282);
            this.Controls.Add(this.btnadd);
            this.Controls.Add(this.txttitle);
            this.Controls.Add(this.txtdes);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "project";
            this.Text = "Description";
            this.Load += new System.EventHandler(this.project_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtdes;
        private System.Windows.Forms.TextBox txttitle;
        private System.Windows.Forms.Button btnadd;
    }
}