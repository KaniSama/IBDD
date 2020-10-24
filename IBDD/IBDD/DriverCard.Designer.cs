namespace IBDD
{
    partial class DriverCard
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
            this.CloseButton = new System.Windows.Forms.Button();
            this.PhotoBox = new System.Windows.Forms.PictureBox();
            this.NameLabel = new System.Windows.Forms.Label();
            this.ParentLabel = new System.Windows.Forms.Label();
            this.PassportLabel = new System.Windows.Forms.Label();
            this.NameText = new System.Windows.Forms.TextBox();
            this.ParentText = new System.Windows.Forms.TextBox();
            this.PassportText = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.PhotoBox)).BeginInit();
            this.SuspendLayout();
            // 
            // CloseButton
            // 
            this.CloseButton.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.CloseButton.FlatAppearance.BorderColor = System.Drawing.SystemColors.ButtonShadow;
            this.CloseButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.CloseButton.Location = new System.Drawing.Point(0, 166);
            this.CloseButton.Name = "CloseButton";
            this.CloseButton.Size = new System.Drawing.Size(491, 26);
            this.CloseButton.TabIndex = 0;
            this.CloseButton.Text = "Закрыть";
            this.CloseButton.UseVisualStyleBackColor = true;
            this.CloseButton.Click += new System.EventHandler(this.CloseButton_Click);
            // 
            // PhotoBox
            // 
            this.PhotoBox.Location = new System.Drawing.Point(13, 13);
            this.PhotoBox.Name = "PhotoBox";
            this.PhotoBox.Size = new System.Drawing.Size(128, 128);
            this.PhotoBox.TabIndex = 1;
            this.PhotoBox.TabStop = false;
            // 
            // NameLabel
            // 
            this.NameLabel.AutoSize = true;
            this.NameLabel.Location = new System.Drawing.Point(147, 13);
            this.NameLabel.Name = "NameLabel";
            this.NameLabel.Size = new System.Drawing.Size(35, 13);
            this.NameLabel.TabIndex = 2;
            this.NameLabel.Text = "Имя: ";
            // 
            // ParentLabel
            // 
            this.ParentLabel.AutoSize = true;
            this.ParentLabel.Location = new System.Drawing.Point(147, 71);
            this.ParentLabel.Name = "ParentLabel";
            this.ParentLabel.Size = new System.Drawing.Size(60, 13);
            this.ParentLabel.TabIndex = 3;
            this.ParentLabel.Text = "Отчество: ";
            // 
            // PassportLabel
            // 
            this.PassportLabel.AutoSize = true;
            this.PassportLabel.Location = new System.Drawing.Point(147, 128);
            this.PassportLabel.Name = "PassportLabel";
            this.PassportLabel.Size = new System.Drawing.Size(56, 13);
            this.PassportLabel.TabIndex = 4;
            this.PassportLabel.Text = "Паспорт: ";
            // 
            // NameText
            // 
            this.NameText.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.NameText.Location = new System.Drawing.Point(221, 10);
            this.NameText.Name = "NameText";
            this.NameText.ReadOnly = true;
            this.NameText.Size = new System.Drawing.Size(257, 20);
            this.NameText.TabIndex = 5;
            // 
            // ParentText
            // 
            this.ParentText.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.ParentText.Location = new System.Drawing.Point(221, 68);
            this.ParentText.Name = "ParentText";
            this.ParentText.ReadOnly = true;
            this.ParentText.Size = new System.Drawing.Size(257, 20);
            this.ParentText.TabIndex = 6;
            // 
            // PassportText
            // 
            this.PassportText.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.PassportText.Location = new System.Drawing.Point(221, 125);
            this.PassportText.Name = "PassportText";
            this.PassportText.ReadOnly = true;
            this.PassportText.Size = new System.Drawing.Size(257, 20);
            this.PassportText.TabIndex = 7;
            // 
            // DriverCard
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(491, 192);
            this.Controls.Add(this.PassportText);
            this.Controls.Add(this.ParentText);
            this.Controls.Add(this.NameText);
            this.Controls.Add(this.PassportLabel);
            this.Controls.Add(this.ParentLabel);
            this.Controls.Add(this.NameLabel);
            this.Controls.Add(this.PhotoBox);
            this.Controls.Add(this.CloseButton);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "DriverCard";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Карточка водителя";
            this.Deactivate += new System.EventHandler(this.DriverCard_Deactivate);
            ((System.ComponentModel.ISupportInitialize)(this.PhotoBox)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button CloseButton;
        private System.Windows.Forms.PictureBox PhotoBox;
        private System.Windows.Forms.Label NameLabel;
        private System.Windows.Forms.Label ParentLabel;
        private System.Windows.Forms.Label PassportLabel;
        private System.Windows.Forms.TextBox NameText;
        private System.Windows.Forms.TextBox ParentText;
        private System.Windows.Forms.TextBox PassportText;
    }
}