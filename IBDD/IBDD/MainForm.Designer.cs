namespace IBDD
{
    partial class MainForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.Grid = new System.Windows.Forms.DataGridView();
            this.timeStamp = new System.Windows.Forms.Label();
            this.bLogOut = new System.Windows.Forms.Button();
            this.ExportButton = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.Grid)).BeginInit();
            this.SuspendLayout();
            // 
            // Grid
            // 
            this.Grid.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.Grid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Grid.Location = new System.Drawing.Point(13, 13);
            this.Grid.Name = "Grid";
            this.Grid.Size = new System.Drawing.Size(746, 388);
            this.Grid.TabIndex = 0;
            this.Grid.CancelRowEdit += new System.Windows.Forms.QuestionEventHandler(this.Grid_CancelRowEdit);
            this.Grid.CellEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.Grid_CellEnter);
            this.Grid.CellLeave += new System.Windows.Forms.DataGridViewCellEventHandler(this.Grid_CellEnter);
            this.Grid.CellValueChanged += new System.Windows.Forms.DataGridViewCellEventHandler(this.Grid_CellEnter);
            this.Grid.ColumnAdded += new System.Windows.Forms.DataGridViewColumnEventHandler(this.Grid_ColumnWidthChanged);
            this.Grid.ColumnRemoved += new System.Windows.Forms.DataGridViewColumnEventHandler(this.Grid_ColumnWidthChanged);
            this.Grid.ColumnWidthChanged += new System.Windows.Forms.DataGridViewColumnEventHandler(this.Grid_ColumnWidthChanged);
            this.Grid.CurrentCellChanged += new System.EventHandler(this.Update);
            this.Grid.RowEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.Grid_CellEnter);
            this.Grid.RowLeave += new System.Windows.Forms.DataGridViewCellEventHandler(this.Grid_CellEnter);
            this.Grid.RowsAdded += new System.Windows.Forms.DataGridViewRowsAddedEventHandler(this.Grid_RowsAdded);
            this.Grid.Click += new System.EventHandler(this.Update);
            this.Grid.DoubleClick += new System.EventHandler(this.Update);
            this.Grid.Enter += new System.EventHandler(this.Update);
            this.Grid.Leave += new System.EventHandler(this.Update);
            this.Grid.MouseDown += new System.Windows.Forms.MouseEventHandler(this.Update);
            this.Grid.MouseEnter += new System.EventHandler(this.Update);
            this.Grid.MouseLeave += new System.EventHandler(this.Update);
            this.Grid.MouseHover += new System.EventHandler(this.Update);
            this.Grid.MouseMove += new System.Windows.Forms.MouseEventHandler(this.Update);
            this.Grid.MouseUp += new System.Windows.Forms.MouseEventHandler(this.Update);
            // 
            // timeStamp
            // 
            this.timeStamp.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.timeStamp.AutoSize = true;
            this.timeStamp.Location = new System.Drawing.Point(239, 408);
            this.timeStamp.Name = "timeStamp";
            this.timeStamp.Size = new System.Drawing.Size(82, 13);
            this.timeStamp.TabIndex = 1;
            this.timeStamp.Text = "Время сеанса ";
            // 
            // bLogOut
            // 
            this.bLogOut.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.bLogOut.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(128)))));
            this.bLogOut.Cursor = System.Windows.Forms.Cursors.Hand;
            this.bLogOut.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.bLogOut.Location = new System.Drawing.Point(684, 403);
            this.bLogOut.Name = "bLogOut";
            this.bLogOut.Size = new System.Drawing.Size(75, 23);
            this.bLogOut.TabIndex = 2;
            this.bLogOut.Text = "Выход";
            this.bLogOut.UseVisualStyleBackColor = false;
            this.bLogOut.Click += new System.EventHandler(this.bLogOut_Click);
            // 
            // ExportButton
            // 
            this.ExportButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.ExportButton.Location = new System.Drawing.Point(13, 403);
            this.ExportButton.Name = "ExportButton";
            this.ExportButton.Size = new System.Drawing.Size(220, 23);
            this.ExportButton.TabIndex = 3;
            this.ExportButton.Text = "Экспортировать должников";
            this.ExportButton.UseVisualStyleBackColor = true;
            this.ExportButton.Click += new System.EventHandler(this.ExportButton_Click);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(771, 433);
            this.Controls.Add(this.ExportButton);
            this.Controls.Add(this.bLogOut);
            this.Controls.Add(this.timeStamp);
            this.Controls.Add(this.Grid);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "MainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Инспекция";
            this.Activated += new System.EventHandler(this.Update);
            this.Deactivate += new System.EventHandler(this.Deactivated);
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.Shown += new System.EventHandler(this.MainForm_Shown);
            this.Enter += new System.EventHandler(this.Update);
            this.Leave += new System.EventHandler(this.Update);
            this.MouseDown += new System.Windows.Forms.MouseEventHandler(this.Update);
            this.MouseEnter += new System.EventHandler(this.Update);
            this.MouseLeave += new System.EventHandler(this.Update);
            this.MouseHover += new System.EventHandler(this.Update);
            this.MouseMove += new System.Windows.Forms.MouseEventHandler(this.Update);
            this.MouseUp += new System.Windows.Forms.MouseEventHandler(this.Update);
            ((System.ComponentModel.ISupportInitialize)(this.Grid)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView Grid;
        private System.Windows.Forms.Label timeStamp;
        private System.Windows.Forms.Button bLogOut;
        private System.Windows.Forms.Button ExportButton;
    }
}