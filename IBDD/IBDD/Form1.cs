using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
//using System.Timers;

namespace IBDD
{
    public partial class FormAuth : Form
    {
        private int Attempts = 3, seconds = 60;
        private static Timer timer = new Timer(), secondTimer = new Timer();
        private bool PrevAttemptSuccessful;
        private MainForm parent;

        private const string filename = "log.dat";

        public FormAuth(MainForm parent)
        {
            this.parent = parent;
            InitializeComponent();
        }
        public FormAuth()
        {
            InitializeComponent();
        }

        private void Cancel_Click(object sender, EventArgs e)
        {
            parent.Close();
            this.Close();
            Environment.Exit(0);
        }

        private void ToggleBlock()
        {
            LoginBox.Enabled = !LoginBox.Enabled;
            PassBox.Enabled = !PassBox.Enabled;
            OK.Enabled = !OK.Enabled;
        }
        private void ToggleBlock(bool block)
        {
            LoginBox.Enabled = !block;
            PassBox.Enabled = !block;
            OK.Enabled = !block;
        }

        private void OK_Click(object sender, EventArgs e)
        {
            if (LoginBox.Text == "inspector" && LoginBox.Text == PassBox.Text)
            {
                // открыть главное окно
                PrevAttemptSuccessful = true;

                parent.Show();
                parent.SetAuthed();
                parent.DBConnect();
                if (parent.GetAuthed()) parent.Update();
                else MessageBox.Show("Добро пожаловать, инспектор!");

                this.Close();
            } else
            {
                PrevAttemptSuccessful = false;
                Attempts--;
                AttemptsLabel.Text = "Осталось попыток: " + Attempts;

                PassBox.Text = "";
                if (Attempts <= 0)
                {
                    MessageBox.Show("Слишком много попыток входа. Повторите попытку через 60 секунд");
                    // заблокировать ввод данных
                    ToggleBlock(true);

                    timer.Interval = 60000;
                    timer.Start();
                    secondTimer.Interval = 1000;
                    secondTimer.Start();

                    AttemptsLabel.Text = "Подождите 60 секунд";
                } else
                {
                    MessageBox.Show($"Неправильный логин или пароль. Повторите ввод данных. (Осталось {Attempts} попыток)");
                }
            }
        }
        private void TimerProcess(Object iObject, EventArgs args)
        {
            timer.Stop();
            
            // разблокировать ввод
            Attempts = 3;
            ToggleBlock(false);
            AttemptsLabel.Text = "Осталось попыток: " + Attempts;
        }
        private void SecondTimer(Object iObject, EventArgs args)
        {
            if (seconds > 0)
            {
                seconds--;
                AttemptsLabel.Text = "Подождите " + seconds + " секунд";
            }
            else
            {
                seconds = 60;
                secondTimer.Stop();
                AttemptsLabel.Text = "Осталось попыток: " + Attempts;
            }
        }

        // Первоначальная загрузка формы – Проверка на недобросовестность в прошлой жизни (в предыдущем сеансе);
        private void FormAuth_Load(object sender, EventArgs e)
        {
            timer.Tick += new EventHandler(TimerProcess);
            secondTimer.Tick += new EventHandler(SecondTimer);

            if (!File.Exists(filename))
            {
                using (BinaryWriter writer = new BinaryWriter(File.Open(filename, FileMode.Create)))
                {
                    // записать оставшееся время и попытки, а также успешность предыдущей попытки
                    writer.Write((int)(60));
                    writer.Write(true);
                    writer.Write((int)(3));

                    writer.Close();
                }
            }
            else
            {
                using (BinaryReader reader = new BinaryReader(File.Open(filename, FileMode.Open)))
                {
                    seconds = reader.ReadInt32();
                    PrevAttemptSuccessful = reader.ReadBoolean();
                    Attempts = reader.ReadInt32();

                    reader.Close();
                }

                if (seconds < 60)
                {
                    ToggleBlock(true);

                    timer.Interval = seconds * 1000;
                    timer.Start();
                    secondTimer.Interval = 1000;
                    secondTimer.Start();

                    AttemptsLabel.Text = "Подождите " + seconds + " секунд";
                } else
                {
                    if (PrevAttemptSuccessful) Attempts = 3;
                    AttemptsLabel.Text = "Осталось попыток: " + Attempts;
                }
            }
        }

        // Закрытие формы – Проверка на недобросовестность
        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            //e.Cancel = (e.CloseReason == CloseReason.UserClosing);

            using (BinaryWriter writer = new BinaryWriter(File.Open(filename, FileMode.Create)))
            {
                // записать оставшееся время и попытки, а также успешность предыдущей попытки
                writer.Write(seconds);
                writer.Write(PrevAttemptSuccessful);
                writer.Write(Attempts);

                writer.Close();
            }
        }

        private void FormAuth_FormClosed(object sender, FormClosedEventArgs e)
        {
            if (e.CloseReason == CloseReason.UserClosing && !(parent.GetAuthed()))
            {
                Environment.Exit(0);
            }
        }

        // Показать пароль
        private void button3_MouseDown(object sender, MouseEventArgs e)
        {
            PassBox.PasswordChar = '\0';
        }

        private void button3_MouseUp(object sender, MouseEventArgs e)
        {
            PassBox.PasswordChar = '*';
        }
    }
}
