using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
//using System.Reflection.Metadata;
using System.Web.UI;
using System.Windows;
using System.Windows.Documents;
using System.Xml.Linq;

namespace claims_part2
{
    public partial class WebForm3 : Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataBind(); // Bind data on initial load
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            // Validate that a Lecture ID is entered
            if (string.IsNullOrWhiteSpace(LectureIDTextBox.Text))
            {
                // Display an error message
                MessageBox.Show("Please enter a Lecture ID.");
                return;
            }

            try
            {
                // Update the lecture information based on LectureID
                using (SqlCommand cmd = new SqlCommand(
                    "UPDATE TBLLECTURECLAIM SET LectureName = @LectureName, ModuleCode = @ModuleCode, ModuleName = @ModuleName, " +
                    "CellPhoneNumber = @CellPhoneNumber, HOURS = @Hours, Email = @Email, SalaryRate = @SalaryRate WHERE LectureID = @LectureID", con))
                {
                    cmd.Parameters.AddWithValue("@LectureID", Convert.ToInt32(LectureIDTextBox.Text));
                    cmd.Parameters.AddWithValue("@LectureName", LectureNameTextBox.Text);
                    cmd.Parameters.AddWithValue("@ModuleCode", Convert.ToInt32(ModuleCodeTextBox.Text));
                    cmd.Parameters.AddWithValue("@ModuleName", ModuleNameTextBox.Text);
                    cmd.Parameters.AddWithValue("@CellPhoneNumber", CellTextBox.Text);
                    cmd.Parameters.AddWithValue("@Hours", Convert.ToInt32(HourTextBox.Text));
                    cmd.Parameters.AddWithValue("@Email", EmailTextBox.Text);
                    cmd.Parameters.AddWithValue("@SalaryRate", Convert.ToDecimal(SalaryTextBox.Text));

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Information updated successfully.");
                        GridView1.DataBind(); // Refresh the GridView to show updated data
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
            // Ensure that a row is selected in the GridView
            if (GridView1.SelectedRow == null)
            {
                MessageBox.Show("Please select a lecture from the grid.");
                return;
            }

            // Get selected row data
            int lectureID = Convert.ToInt32(GridView1.SelectedDataKey.Value);
            string lectureName = GridView1.SelectedRow.Cells[1].Text; // Assuming LectureName is in column index 1
            string moduleCode = GridView1.SelectedRow.Cells[2].Text; // Assuming ModuleCode is in column index 2
            string moduleName = GridView1.SelectedRow.Cells[3].Text; // Assuming ModuleName is in column index 3
            int hours = Convert.ToInt32(GridView1.SelectedRow.Cells[4].Text); // Assuming HOURS is in column index 4
            decimal salaryRate = Convert.ToDecimal(GridView1.SelectedRow.Cells[5].Text); // Assuming SalaryRate is in column index 5
            decimal totalAmount = Convert.ToDecimal(GridView1.SelectedRow.Cells[6].Text); // Assuming TotalAmount is in column index 6

            // Generate PDF invoice
            Document pdfDoc = new Document();
            string pdfPath = Server.MapPath("~/Invoices/Invoice_" + lectureID + ".pdf");
            PdfWriter.GetInstance(pdfDoc, new FileStream(pdfPath, FileMode.Create));
            pdfDoc.Open();

            // Add content to PDF
            pdfDoc.Add(new iTextSharp.text.Paragraph("INVOICE"));
            pdfDoc.Add(new iTextSharp.text.Paragraph($"Lecture ID: {lectureID}"));
            pdfDoc.Add(new iTextSharp.text.Paragraph($"Lecture Name: {lectureName}"));
            pdfDoc.Add(new iTextSharp.text.Paragraph($"Module Code: {moduleCode}"));
            pdfDoc.Add(new iTextSharp.text.Paragraph($"Module Name: {moduleName}"));
            pdfDoc.Add(new iTextSharp.text.Paragraph($"Hours: {hours}"));
            pdfDoc.Add(new iTextSharp.text.Paragraph($"Salary Rate: {salaryRate:C}")); // Format as currency
            pdfDoc.Add(new iTextSharp.text.Paragraph($"Total Amount: {totalAmount:C}")); // Format as currency

            pdfDoc.Close();

            // Provide download link for the generated PDF
            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=Invoice_" + lectureID + ".pdf");
            Response.TransmitFile(pdfPath);
            Response.End();
        }
    }
}