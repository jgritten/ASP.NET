<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Please Use the Drop Down list to change States
        <br />
        <br />
        <asp:DropDownList ID="ddlStates" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource_States" DataTextField="StateName" DataValueField="StateCode">
        </asp:DropDownList>
        <br />
        <asp:ObjectDataSource ID="ObjectDataSource_States" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetStates" TypeName="StateDB"></asp:ObjectDataSource>
        <br />
        <br />
        <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource_Customers" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" AllowPaging="True" DataKeyNames="CustomerID" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" OnClick="LinkButton1_Click" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" OnClick="LinkButton3_Click" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <%--<EditItemTemplate>
                        <asp:LinkButton ID="lbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>--%>
                    <FooterTemplate>
                        <asp:LinkButton ValidationGroup="Insert" ID="lbInsert" runat="server" onClick="lbInsert_Click" CausesValidation="True" CommandName="Insert" Text="Insert"></asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <%--<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />    
                <asp:TemplateField>
                    <FooterTemplate>
                        <asp:LinkButton ID="lbInsert" runat="server" OnClientClick="return AddCustomer(customer)">Insert</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField> --%>         
                <asp:TemplateField HeaderText="CustomerID" SortExpression="CustomerID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CustomerID") %>' Enabled="False"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CustomerID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="Name is Required" ControlToValidate="TextBox2" Text="*"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Name is Required" ControlToValidate="txtName" ValidationGroup="Insert" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address" SortExpression="Address">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ForeColor="Red" runat="server" ErrorMessage="Address is Required" ControlToValidate="TextBox3" Text="*"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Insert" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Address is Required" ControlToValidate="txtAddress" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City" SortExpression="City">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="City is required" ForeColor="Red" ControlToValidate="TextBox4" Text="*"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Insert" ID="RequiredFieldValidator6" runat="server" ErrorMessage="City is Required" ControlToValidate="txtCity" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="State" SortExpression="State">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlEditState" runat="server" DataSourceID="ObjectDataSource_States" DataTextField="StateCode" DataValueField="StateCode" SelectedValue='<%# Bind("State") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlNewState" runat="server" DataSourceID="ObjectDataSource_States" DataTextField="StateCode" DataValueField="StateCode"></asp:DropDownList>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ZipCode" SortExpression="ZipCode">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ZipCode") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server" ErrorMessage="Zip Code is Required" ControlToValidate="TextBox6" Text="*"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ZipCode") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Zip Code is Required" ValidationGroup="Insert" ControlToValidate="txtZip" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Insert" ForeColor="Red" />
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" />
        <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
        <asp:ObjectDataSource ID="ObjectDataSource_Customers" runat="server" DataObjectTypeName="Customer" DeleteMethod="DeleteCustomer" InsertMethod="AddCustomer" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomersByState" TypeName="CustomerDB" UpdateMethod="UpdateCustomer" ConflictDetection="CompareAllValues">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlStates" Name="stateCode" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="oldCustomer" Type="Object" />
                <asp:Parameter Name="newCustomer" Type="Object" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <br />
        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        <br />
        <br />
    </div>
    </form>
</body>
</html>
