using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Windows;

namespace claims_part2
{
    public partial class WebForm2 : Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void BtnAccept_Click(object sender, EventArgs e)
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
                // Update the status of the selected lecture
                using (SqlCommand cmd = new SqlCommand("UPDATE TBLLECTURECLAIM SET STATUS = @Status WHERE LectureID = @LectureID", con))
                {
                    cmd.Parameters.AddWithValue("@Status", STATUSTextBox.Text);
                    cmd.Parameters.AddWithValue("@LectureID", Convert.ToInt32(LectureIDTextBox.Text));

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Status updated successfully.");
                        LectureViewGrid.DataBind(); // Refresh the GridView to show updated data
                    }
                    else
                    {
                        MessageBox.Show("No lecture found with that ID.");
                    }
                }
            }
            catch (SqlException ex)
            {
                MessageBox.Show("Error updating status: " + ex.Message);
            }
            finally
            {
                con.Close(); // Ensure connection is closed
            }
        }
    }
}