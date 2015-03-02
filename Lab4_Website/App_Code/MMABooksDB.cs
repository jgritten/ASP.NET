using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

public static class MMABooksDB
{
    public static SqlConnection GetConnection()
    {
        string connectionString =
	    "Data Source=localhost\\sqlexpress;Initial Catalog=MMABooks;Integrated Security=True";
        //@"Data Source=(LocalDB)\v11.0;AttachDbFilename='C:\Users\684146\Documents\Visual Studio 2013\Projects\ObjectDatasourceExample\ObjectDatasourceExample\bin\Debug\MMABooks_New.mdf';Integrated Security=True;Connect Timeout=30";
            // "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|\\MMABooks.mdf;" +
            //  "Integrated Security=True";
        SqlConnection connection = new SqlConnection(connectionString);
        return connection;
    }
}
