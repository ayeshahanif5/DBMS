namespace fyp
{
    partial class start
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
            this.btnas = new System.Windows.Forms.Button();
            this.btnadvisor = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnas
            // 
            this.btnas.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.btnas.Location = new System.Drawing.Point(37, 72);
            this.btnas.Name = "btnas";
            this.btnas.Size = new System.Drawing.Size(206, 23);
            this.btnas.TabIndex = 0;
            this.btnas.Text = "ADD STUDENT";
            this.btnas.UseVisualStyleBackColor = true;
            this.btnas.Click += new System.EventHandler(this.btnas_Click);
            // 
            // btnadvisor
            // 
            this.btnadvisor.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.btnadvisor.Location = new System.Drawing.Point(37, 116);
            this.btnadvisor.Name = "btnadvisor";
            this.btnadvisor.Size = new System.Drawing.Size(206, 23);
            this.btnadvisor.TabIndex = 1;
            this.btnadvisor.Text = "ADVISOR";
            this.btnadvisor.UseVisualStyleBackColor = true;
            this.btnadvisor.Click += new System.EventHandler(this.btnadvisor_Click);
            // 
            // button1
            // 
            this.button1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.button1.Location = new System.Drawing.Point(37, 162);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(206, 23);
            this.button1.TabIndex = 3;
            this.button1.Text = "EVALUATION";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // panel1
            // 
            this.panel1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panel1.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.panel1.Controls.Add(this.btnas);
            this.panel1.Controls.Add(this.button1);
            this.panel1.Controls.Add(this.btnadvisor);
            this.panel1.Location = new System.Drawing.Point(50, 110);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(285, 245);
            this.panel1.TabIndex = 4;
            // 
            // start
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(403, 412);
            this.Controls.Add(this.panel1);
            this.Name = "start";
            this.Text = "start";
            this.panel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnas;
        private System.Windows.Forms.Button btnadvisor;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Panel panel1;
    }
}