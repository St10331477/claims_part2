﻿using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Windows;

namespace claims_part2
{
    public partial class WebForm1 : Page
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

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            // Validate input lengths and other fields...

            int hoursWorked = Convert.ToInt32(HourTextBox.Text);
            int salaryRate = Convert.ToInt32(SalaryTextBox.Text);
            int total = hoursWorked * salaryRate;

            try
            {
                // Path to save PDF files
                string folderPath = Server.MapPath("~/PDF FILE/"); 
                string fileName = Path.GetFileName(FileUpload1.FileName);
                // Full path to save the file
                string filePath = Path.Combine(folderPath, fileName);
                // Save uploaded PDF
                FileUpload1.SaveAs(filePath);

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
                    cmd.Parameters.AddWithValue("@FileName", fileName);
                    // Store relative path
                    cmd.Parameters.AddWithValue("@FileLocation", "~/PDF FILE/" + fileName);

                    // Ensure connection is open
                    con.Open();
                    cmd.ExecuteNonQuery();
                    // Notify user of success
                    MessageBox.Show("Claim Has Been Successfully Created.");
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