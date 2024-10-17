using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace claims_part2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            //Checks  if a field is empty and displays an appropriate message
            if (string.IsNullOrEmpty(LectureIDTextBox.Text) || string.IsNullOrEmpty(LectureNameTextBox.Text) ||
                string.IsNullOrEmpty(ModuleCodeTextBox.Text) || string.IsNullOrEmpty(ModuleNameTextBox.Text) ||
                string.IsNullOrEmpty(HourTextBox.Text) || string.IsNullOrEmpty(SalaryTextBox.Text))
            {
                MessageBox.Show("Please fill in all fields.");
                return;
            }

            // Calculated (Hours_Worked * Salary_Rate) to get the Total
            decimal hoursWorked = Convert.ToDecimal(HourTextBox.Text);
            decimal salaryRate = Convert.ToDecimal(SalaryTextBox.Text);
            decimal total = hoursWorked * salaryRate;

            SqlCommand cmd = new SqlCommand
                ("INSERT INTO TBLLECTURECLAIM (LECTURE_ID, LECTURE_NAME, MODULE_ID, MODULE_NAME, HOURS, SALARY_RATE, TOTAL_AMOUNT) VALUES('"
                + LectureIDTextBox.Text + "', '"
                + LectureNameTextBox.Text + "', '"
                + ModuleCodeTextBox.Text + "', '"
                + ModuleNameTextBox.Text + "', '"
                + HourTextBox.Text + "', '"
                + SalaryTextBox.Text + "', '"
                + total + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();

            MessageBox.Show("Claim has been successfully created.");

            GridView1.DataBind();
            LectureIDTextBox.Text = "";
            LectureNameTextBox.Text = "";
            ModuleCodeTextBox.Text = "";
            ModuleNameTextBox.Text = "";
            HourTextBox.Text = "";
            SalaryTextBox.Text = "";

        }
    }
}