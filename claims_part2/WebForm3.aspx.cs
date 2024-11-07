using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Windows;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace claims_part2
{
    public partial class WebForm3 : Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Any initialization logic can go here.
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Validate Lecture ID input
            if (string.IsNullOrWhiteSpace(LectureIDTextBox.Text))
            {
                MessageBox.Show("Please enter a Lecture ID.");
                return;
            }

            try
            {
                int lectureID = Convert.ToInt32(LectureIDTextBox.Text);

                // Fetch data from database
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM TBLLECTURECLAIM WHERE LectureID = @LectureID", con))
                {
                    cmd.Parameters.AddWithValue("@LectureID", lectureID);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Populate textboxes with data from the database
                        LectureNameTextBox.Text = reader["LectureName"].ToString();
                        ModuleCodeTextBox.Text = reader["ModuleCode"].ToString();
                        ModuleNameTextBox.Text = reader["ModuleName"].ToString();
                     
                    }
                    else
                    {
                        MessageBox.Show("No record found with that Lecture ID.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error retrieving data: " + ex.Message);
            }
            finally
            {
                con.Close(); // Ensure connection is closed
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            // Validate that a Lecture ID is entered
            if (string.IsNullOrWhiteSpace(LectureIDTextBox.Text))
            {
                MessageBox.Show("Please enter a Lecture ID.");
                return;
            }

            try
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE TBLLECTURECLAIM SET LectureName = @LectureName, ModuleCode = @ModuleCode, ModuleName = @ModuleName  WHERE LectureID = @LectureID", con))
                {
                    cmd.Parameters.AddWithValue("@LectureID", Convert.ToInt32(LectureIDTextBox.Text));
                    cmd.Parameters.AddWithValue("@LectureName", LectureNameTextBox.Text);
                    cmd.Parameters.AddWithValue("@ModuleCode", Convert.ToInt32(ModuleCodeTextBox.Text));
                    cmd.Parameters.AddWithValue("@ModuleName", ModuleNameTextBox.Text);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Information updated successfully.");
                    }
                    else
                    {
                        MessageBox.Show("No lecture found with that ID.");
                    }
                }
            }
            catch (SqlException ex)
            {
                MessageBox.Show("Error updating information: " + ex.Message);
            }
            finally
            {
                con.Close(); // Ensure connection is closed
            }
        }

        protected void BtnINVOICES_Click(object sender, EventArgs e)
        {
            // Ensure that a Lecture ID is entered
            if (string.IsNullOrWhiteSpace(LectureIDTextBox.Text))
            {
                MessageBox.Show("Please enter a Lecture ID.");
                return;
            }

            try
            {
                int lectureID = Convert.ToInt32(LectureIDTextBox.Text);

                // Fetch data from database for invoice generation
                string lectureName, moduleCode, moduleName;

                using (SqlCommand cmd = new SqlCommand("SELECT * FROM TBLLECTURECLAIM WHERE LectureID = @LectureID", con))
                {
                    cmd.Parameters.AddWithValue("@LectureID", lectureID);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        lectureName = reader["LectureName"].ToString();
                        moduleCode = reader["ModuleCode"].ToString();
                        moduleName = reader["ModuleName"].ToString();
                        
                    }
                    else
                    {
                        MessageBox.Show("No record found with that Lecture ID.");
                        return; // Exit if no record found
                    }
                }

                // Generate PDF invoice
                Document pdfDoc = new Document();
                string pdfPath = Server.MapPath("C:\\Users\\RC_Student_lab\\source\\repos\\claims_part2\\claims_part2\\Invoice\\" + lectureID + ".pdf");
                PdfWriter.GetInstance(pdfDoc, new FileStream(pdfPath, FileMode.Create));
                pdfDoc.Open();

                // Add content to PDF
                pdfDoc.Add(new Paragraph("INVOICE"));
                pdfDoc.Add(new Paragraph($"Lecture ID: {lectureID}"));
                pdfDoc.Add(new Paragraph($"Lecture Name: {lectureName}"));
                pdfDoc.Add(new Paragraph($"Module Code: {moduleCode}"));
                pdfDoc.Add(new Paragraph($"Module Name: {moduleName}"));
                pdfDoc.Close();

                // Provide download link for the generated PDF
                Response.ContentType = "application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=Invoice_" + lectureID + ".pdf");
                Response.TransmitFile(pdfPath);
                Response.End();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error generating invoice: " + ex.Message);
            }
            finally
            {
                con.Close(); // Ensure connection is closed
            }
        }
    }
}