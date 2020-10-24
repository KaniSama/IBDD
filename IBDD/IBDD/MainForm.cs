using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.Json;

namespace IBDD
{
    public partial class MainForm : Form
    {
        private Boolean authed = false;
        Timer timer = new Timer(), secondTimer = new Timer();
        private int seconds = 60;
        private bool on_timer = false;

        private Driver[] drivers;
        private Button[] buttons;

        public MainForm()
        {
            InitializeComponent();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            timer.Tick += new EventHandler(TimerProcess);
            secondTimer.Tick += new EventHandler(SecondTimerProcess);
            timer.Interval = 60000;
            secondTimer.Interval = 1000;

            FormAuth formAuth = new FormAuth(this);
            formAuth.Show();
        }

        public void GridSetup() // Добавление штук в таблицу
        {
            GridInsertColumn("GUID", "GUID");
            GridInsertColumn("Name", "Имя");
            GridInsertColumn("Parents", "Отчество");
            GridInsertColumn("Fines", "Наличие задолженностей");
            Grid.Columns[3].DefaultCellStyle.BackColor = Color.Green;
            Grid.Columns[3].DefaultCellStyle.ForeColor = Color.White;
            Grid.Columns[3].Width = 128;

            DataGridViewButtonColumn btnColumn = new DataGridViewButtonColumn();
            btnColumn.Text = "Открыть карточку";
            btnColumn.UseColumnTextForButtonValue = true;
            btnColumn.FlatStyle = FlatStyle.Flat;
            btnColumn.DefaultCellStyle.BackColor = Color.Beige;

            btnColumn.Width = 128;
            btnColumn.Name = "Card";
            btnColumn.HeaderText = "Карточка водителя";

            Grid.CellContentClick += new DataGridViewCellEventHandler(OpenCard);

            Grid.Columns.Insert(4, btnColumn);
        }

        // Подключение к базе данных
        public void DBConnect()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                
                const string sql = "SELECT [Водители_Main].[Вод_GUID], [Водители_Main].[Вод_Имя], [Водители_Main].[Вод_Отчество],"+
                                     "[Водители_Main].[Вод_Фото], [Санкции].[Санкций_РазмерШтрафа], [Нарушения].[Наруш_Дата]"+
                                    "FROM [Водители_Main] LEFT JOIN [Нарушения] ON [Водители_Main].[Вод_GUID]=[Нарушения].[Вод_GUID]"+
                                    "LEFT JOIN [Санкции] ON[Нарушения].[Санкций_Номер]=[Санкции].[Санкций_Номер];";

                GridSetup();

                SqlCommand command = new SqlCommand(sql, connection);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    int i = 1; while (reader.Read()) i++;
                    drivers = new Driver[i];
                    buttons = new Button[i];
                    reader.Close();
                    reader = command.ExecuteReader();
                } else
                {
                    throw new Exception("В результате запроса нет строк. Критическая ошибка.");
                }

                if (reader.HasRows)
                {
                    int i = 0;
                    while (reader.Read())
                    {
                        string id = reader.GetValue(0).ToString();
                        string name = reader.GetValue(1).ToString();
                        string parents = reader.GetValue(2).ToString();
                        int fine = reader.IsDBNull(4)? 0: reader.GetInt32(4);
                        DateTime date = reader.IsDBNull(5)? new DateTime(9999, 12, 31) : reader.GetDateTime(5);

                        string imgPath = "../../../../photo/" + reader.GetValue(3).ToString();

                        Bitmap image = new Bitmap(new Bitmap(imgPath), new Size(128, 128));

                        drivers[i] = new Driver(int.Parse(id), name, parents, imgPath, fine, date);

                        //GridInsertRow(new object[] { id, name, parents, image});
                        GridInsertRow(drivers[i]);

                        i++;
                    }
                }

                reader.Close();
            }
            Console.WriteLine("Подключение закрыто...");
        }

        // Работа с DataGridView
        private void GridInsertRow()
        {
            Grid.Rows.Add();
        }
        private void GridInsertRow(object[] row)
        {
            Grid.Rows.Add(row);
        }
        private void GridInsertRow(Driver row)
        {
            Button temp = new Button();
            //temp.CellContentClick += new EventHandler(OpenCard);

            int i;
            for (i = 0; i < drivers.Length; i++) if (drivers[i].Equals(row)) break;
            temp.Name = "Driver " + i;
            temp.Text = "Открыть карточку водителя для водителя " + i;

            row.SetButton(temp);
            if (row.GetFineDate().Year == 9999)
            {
                Grid.Rows.Add(row.GetID(), row.GetName(), row.GetLastName(), "✘ Нет", row.GetButton()/*, row/*row.GetPhoto()*/);
            } else
            {
                Grid.Rows.Add(row.GetID(), row.GetName(), row.GetLastName(), "☑ Сумма: " + row.GetFines() + "% ЗП", row.GetButton()/*, row/*row.GetPhoto()*/);
                Grid.Rows[i].Cells[3].Style.BackColor = Color.DarkRed;
            }
        }
        private void GridInsertColumn(string name, string DisplayName)
        {
            Grid.Columns.Add(name, DisplayName);
        }
        private void GridInsertCell(int row, int column, object Object)
        {
            Grid.Rows[row].Cells[column].Value = Object;
        }

        public void OpenCard(object sender, DataGridViewCellEventArgs e)
        {
            var senderGrid = (DataGridView)sender;

            if (senderGrid.Columns[e.ColumnIndex] is DataGridViewButtonColumn &&
                e.RowIndex >= 0)
            {
                int index = e.RowIndex;
                DriverCard card = new DriverCard(drivers[index]);
                card.Show();
            }
        }

        // Скрывать форму при первом показе
        private void MainForm_Shown(object sender, EventArgs e)
        {
            this.Hide();
        }

        // Обработка таймеров
        private void SecondTimerProcess(Object iObject, EventArgs args)
        {
            if (seconds > 0)
            {
                secondTimer.Stop();
                seconds--;
                timeStamp.Text = "Время сеанса: " + seconds + " секунд.";
                secondTimer.Start();
            } else
            {
                secondTimer.Stop();
            }
        }
        private void TimerProcess(Object iObject, EventArgs args)
        {
            if (authed)
            {
                LogOut();
            }
            else
            {
                timer.Stop();
            }
        }
        private void Deactivated(object sender, EventArgs e)
        {
            if (authed && !on_timer)
            {
                seconds = 60;
                timeStamp.Text = "Время сеанса: " + seconds + " секунд.";
                secondTimer.Stop();
                secondTimer.Start();
                timer.Stop();
                timer.Start();

                on_timer = true;
            }
        }
        public void Update(object sender, EventArgs e)
        {
            if (authed)
            {
                seconds = 60;
                timeStamp.Text = "";// "Время сеанса: " + seconds + " секунд.";
                secondTimer.Stop();
                secondTimer.Start();
                timer.Stop();
                timer.Start();

                on_timer = true;
            }
        }
        public void Update(object sender, MouseEventArgs e)
        {
            Update();
        }
        private void Grid_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            Update();
        }
        private void Grid_ColumnWidthChanged(object sender, DataGridViewColumnEventArgs e)
        {
            Update();
        }
        private void Grid_CancelRowEdit(object sender, QuestionEventArgs e)
        {
            Update();
        }
        private void Grid_RowsAdded(object sender, DataGridViewRowsAddedEventArgs e)
        {
            Update();
        }

        // Выход на экран авторизации
        private void LogOut()
        {
            timer.Stop();
            this.authed = false;
            this.Hide();
            FormAuth formAuth = new FormAuth(this);
            formAuth.Show();
        }
        private void bLogOut_Click(object sender, EventArgs e)
        {
            LogOut();
        }

        // Геттеры и сеттеры
        public void SetAuthed()
        {
            authed = true;
        }

        private void ExportButton_Click(object sender, EventArgs e)
        {
            SaveFileDialog sfd = new SaveFileDialog();
            if (sfd.ShowDialog() == DialogResult.OK)
            {
                using (System.IO.StreamWriter sw = new System.IO.StreamWriter(sfd.FileName))
                {

                    DataGridViewSelectedRowCollection rows = Grid.SelectedRows;
                    for (int i = 0; i < Grid.Rows.Count; i++)
                    {
                        if (drivers[i]!=null && drivers[i].GetFines() > 0)
                        {
                            if (DateTime.Today.Month - drivers[i].GetFineDate().Month > 6 &&
                                DateTime.Today.Year == drivers[i].GetFineDate().Year
                                || DateTime.Today.Year > drivers[i].GetFineDate().Year ||
                                DateTime.Today.Month - drivers[i].GetFineDate().Month == 6 && DateTime.Today.Year == drivers[i].GetFineDate().Year && DateTime.Today.Day > drivers[i].GetFineDate().Day)
                            {
                                string exportString = drivers[i].GetID() + "; " + drivers[i].GetName() + "; " + drivers[i].GetLastName() + "; " + drivers[i].GetFines() + "; " + drivers[i].GetFineDate().ToString();
                                sw.WriteLine(exportString);
                            }
                        }

                        /*if (rows.Contains(Grid.Rows[i]))
                        {
                            string exportString = Grid.Rows[i].Cells[0].Value.ToString() + "; " + Grid.Rows[i].Cells[1].Value.ToString() + "; " + Grid.Rows[i].Cells[2].Value.ToString();
                            sw.WriteLine(exportString);

                            //ExportJSON(exportString).GetAwaiter
                        }*/
                    }

                    sw.Close();
                }
            }
        }
        
        private static async Task ExportJSON(string Object)
        {
            using (System.IO.FileStream sw = new System.IO.FileStream("ExportJSON.json", System.IO.FileMode.OpenOrCreate))
            {
                await JsonSerializer.SerializeAsync<string>(sw, Object);
                MessageBox.Show("Экспорт удачен!");
            }
        }

        public bool GetAuthed()
        {
            return authed;
        }
    }
}
