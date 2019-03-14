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
            this.linkLabel1 = new System.Windows.Forms.LinkLabel();
            this.SuspendLayout();
            // 
            // btnas
            // 
            this.btnas.Location = new System.Drawing.Point(246, 62);
            this.btnas.Name = "btnas";
            this.btnas.Size = new System.Drawing.Size(123, 23);
            this.btnas.TabIndex = 0;
            this.btnas.Text = "ADD STUDENT";
            this.btnas.UseVisualStyleBackColor = true;
            this.btnas.Click += new System.EventHandler(this.btnas_Click);
            // 
            // btnadvisor
            // 
            this.btnadvisor.Location = new System.Drawing.Point(246, 106);
            this.btnadvisor.Name = "btnadvisor";
            this.btnadvisor.Size = new System.Drawing.Size(123, 23);
            this.btnadvisor.TabIndex = 1;
            this.btnadvisor.Text = "ADVISOR";
            this.btnadvisor.UseVisualStyleBackColor = true;
            this.btnadvisor.Click += new System.EventHandler(this.btnadvisor_Click);
            // 
            // linkLabel1
            // 
            this.linkLabel1.AutoSize = true;
            this.linkLabel1.Location = new System.Drawing.Point(313, 207);
            this.linkLabel1.Name = "linkLabel1";
            this.linkLabel1.Size = new System.Drawing.Size(56, 13);
            this.linkLabel1.TabIndex = 2;
            this.linkLabel1.TabStop = true;
            this.linkLabel1.Text = "evaluation";
            this.linkLabel1.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabel1_LinkClicked);
            // 
            // start
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(553, 261);
            this.Controls.Add(this.linkLabel1);
            this.Controls.Add(this.btnadvisor);
            this.Controls.Add(this.btnas);
            this.Name = "start";
            this.Text = "start";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnas;
        private System.Windows.Forms.Button btnadvisor;
        private System.Windows.Forms.LinkLabel linkLabel1;
    }
}