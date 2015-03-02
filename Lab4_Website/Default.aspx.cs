using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }



    public void lbInsert_Click(object sender, EventArgs e)
    {
        Customer customer = new Customer();
        customer.Name = ((TextBox)gvCustomers.FooterRow.FindControl("txtName")).Text;
        customer.Address = ((TextBox)gvCustomers.FooterRow.FindControl("txtAddress")).Text;
        customer.City = ((TextBox)gvCustomers.FooterRow.FindControl("txtCity")).Text;
        customer.State = ((DropDownList)gvCustomers.FooterRow.FindControl("ddlNewState")).SelectedValue;
        customer.ZipCode = ((TextBox)gvCustomers.FooterRow.FindControl("txtZip")).Text;

        
        int num = CustomerDB.AddCustomer(customer);
        if (num > 0)
        {
            lblResult.Text = "Customer Added Successfully";
            gvCustomers.DataBind();
        }
        else
        {
            lblResult.Text = "Customer Not Added";
        }
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        lblResult.Text = "Customer Successfully Deleted";
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        lblResult.Text = "Customer Edit Complete";
    }
}