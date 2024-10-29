using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace claims_part2
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        // Initialize SQL connection using connection string from Web.config
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load data on first page load
                disp_data();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            // Validate input lengths and other fields...

            int hoursWorked = Convert.ToInt32(HourTextBox.Text);
            int salaryRate = Convert.ToInt32(SalaryTextBox.Text);
            int total = hoursWorked * salaryRate;

            try
            {
                // Prepare SQL command to insert data into the databas
                using (SqlCommand cmd = new SqlCommand("INSERT INTO TBLLECTURECLAIM (LectureID, LectureName, ModuleCode, ModuleName, HOURS, SalaryRate, TotalAmount, FileName, FileLocation) VALUES (@LectureID, @LectureName, @ModuleCode, @ModuleName, @Hours, @SalaryRate, @TotalAmount, @FileName, @FileLocation)", con))
                {
                    cmd.Parameters.AddWithValue("@LectureID", Convert.ToInt32(LectureIDTextBox.Text));
                    cmd.Parameters.AddWithValue("@LectureName", LectureNameTextBox.Text);
                    cmd.Parameters.AddWithValue("@ModuleCode", Convert.ToInt32(ModuleCodeTextBox.Text));
                    cmd.Parameters.AddWithValue("@ModuleName", ModuleNameTextBox.Text);
                    cmd.Parameters.AddWithValue("@Hours", hoursWorked);
                    cmd.Parameters.AddWithValue("@SalaryRate", salaryRate);
                    cmd.Parameters.AddWithValue("@TotalAmount", total);

                    // Ensure connection is open
                    con.Open();
                    cmd.ExecuteNonQuery();
                    // Notify user of success
                    MessageBox.Show("Claim Has Been Successfully Updated.");
                }
            }
            catch (SqlException ex)
            {
                // Display error message
                MessageBox.Show("Error: " + ex.Message);
            }
            finally
            {
                // Ensure connection is closed
                con.Close();
                // Refresh GridView after saving data
                disp_data();
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {

        }

        protected void BtnDownload_Click(object sender, EventArgs e)
        {

        }

        private void disp_data()
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM TBLLECTURECLAIM", con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView1.DataSource = dt; // Bind data to GridView
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message); // Handle exceptions gracefully
            }
        }
    }
}