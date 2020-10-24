using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace IBDD
{
    public partial class DriverCard : Form
    {
        public DriverCard(Driver driver)
        {
            InitializeComponent();

            NameText.Text = driver.GetName();
            ParentText.Text = driver.GetLastName();
            PhotoBox.Image = driver.GetPhoto();
        }
        public DriverCard()
        {
            InitializeComponent();
        }

        private void CloseButton_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void DriverCard_Deactivate(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
