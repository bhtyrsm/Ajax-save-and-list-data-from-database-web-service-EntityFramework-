using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace jqueryDatatable
{
    public class UsersContext:DbContext
    {

        public DbSet<User> Users { get; set; }


        public UsersContext()
        {
            Database.SetInitializer<UsersContext>(new CreateDatabaseIfNotExists<UsersContext>());
            Database.Connection.ConnectionString = @"Server=localhost;Database=UsersContext;Trusted_Connection=True;";

        }
    }
}
