using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using System.Windows.Forms;

namespace IBDD
{
    public class Driver
    {
        private
            float id;
            string Name, LName, PhotoPath, Passport;
            int FineAmount;
            DateTime FineDate;
            DateTime BirthDate;
            Button button;

        public Driver(float GUID, string Name, string LastName, string PhotoPath, int FineAmount)
        {
            this.id = GUID;
            this.Name = Name;
            this.LName = LastName;
            this.PhotoPath = PhotoPath;
            this.FineAmount = FineAmount;
        }
        public Driver(float GUID, string Name, string LastName, string PhotoPath, int FineAmount, DateTime date)
        {
            this.id = GUID;
            this.Name = Name;
            this.LName = LastName;
            this.PhotoPath = PhotoPath;
            this.FineAmount = FineAmount;
            this.FineDate = date;
        }

        public float GetID()
        {
            return id;
        }
        public string GetName()
        {
            return Name;
        }
        public string GetLastName()
        {
            return LName;
        }
        public string GetPhotoPath()
        {
            return PhotoPath;
        }
        public Bitmap GetPhoto()
        {
            return new Bitmap(new Bitmap(PhotoPath), new Size(128, 128));
        }
        public int GetFines()
        {
            return FineAmount;
        }
        public DateTime GetFineDate()
        {
            return FineDate;
        }
        public void SetButton(Button button)
        {
            this.button = button;
        }
        public Button GetButton()
        {
            return button;
        }
    }
}
