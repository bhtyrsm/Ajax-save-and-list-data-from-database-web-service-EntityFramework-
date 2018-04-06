using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace jqueryDatatable
{
    /// <summary>
    /// Summary description for UserWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class UserWebService : System.Web.Services.WebService
    {
        UsersContext db = new UsersContext();

        [WebMethod]
        public void AddNewUser(User usr)
        {
            var User = new User();
            User.UserName = usr.UserName;
            User.UserLastName = usr.UserLastName;
            User.UserAge = usr.UserAge;
            User.UserPhoneNum = usr.UserPhoneNum;

            db.Users.Add(User);
            db.SaveChanges();
        }



        [WebMethod]
        public void getUsers()
        {
            IEnumerable<User> AllUsers = db.Users;
            List<User> ListUser = new List<User>();

            foreach (var user in AllUsers)
            {

                User usr = new User();

                usr.UserName = user.UserName;
                usr.UserLastName = user.UserLastName;
                usr.UserAge = user.UserAge;
                usr.UserPhoneNum = user.UserPhoneNum;

                ListUser.Add(usr);
               
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(ListUser));

        }


    }
    
}