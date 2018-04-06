<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="jqueryDatatable._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 <head>  
     <title>Jquery Table</title>
        <script src="https://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript"></script>  
        <script src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js" type="text/javascript"></script>  
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.9/css/jquery.dataTables.min.css" />  
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  

 <script type="text/javascript">  
     $(document).ready(function () {

      $('#datatable').dataTable();

     
     

      $('#addUser').click(function () {
          
          var user = {};
          user.UserName = $('#usrName').val();
          user.UserLastName = $('#usrLstName').val();
          user.UserAge = $('#usrAge').val();
          user.UserPhoneNum = $('#usrPhone').val();

          $.ajax({
              url: 'UserWebService.asmx/AddNewUser',
              dataType:'json',
              contentType: 'application/json;charset=utf-8',
              data:'{usr:'+JSON.stringify(user)+'}',
              method: 'post',
              success: function () {
                  alert("girdi");
                  getAllUsers();
              },
              error: function (err) {
                  alert(err);
              }

          });
      });


      function getAllUsers() {
        
          $.ajax({
              url: 'UserWebService.asmx/getUsers',
                  dataType: "json",
                  method: 'post',
                  success: function (data) {
                      var userTable = $('#datatable tbody');
                  $(data).each(function (index, usr) {

                      userTable.append('<tr><td>' + usr.UserName + '</td><td>' + usr.UserLastName + '</td><td>' + usr.UserAge + '</td><td>' + usr.UserPhoneNum + '</td></tr>')
                  });

                  
              },
              error: function (err) {
                  alert(err);
              }

          });
      }



  });



 </script>  
  
</head> 
<body style="font-family:Arial;padding:50px">
    <form id="form1" runat="server">
    <table id="datatable">  
            <thead>  
                <tr>  
                    <th>  
                    User Name 
                    </th>  
                    <th>  
                      User Last Name
                    </th>  
                    <th>  
                        User Age
                    </th>  
                    <th>  
                     User Phone
                    </th>
                    <th>  
                       Process
                    </th>
                </tr>  
            </thead>  
            <tbody align="Center">  
               <tr>
                   <td><asp:TextBox ID="usrName" runat="server"  CssClass="form-control" placeholder="Name"></asp:TextBox></td>
                   <td><asp:TextBox ID="usrLstName" runat="server"  CssClass="form-control" placeholder="Last Name"></asp:TextBox></td>
                   <td><asp:TextBox ID="usrAge" runat="server"  CssClass="form-control" placeholder="Age"></asp:TextBox></td>
                   <td><asp:TextBox ID="usrPhone" runat="server"  CssClass="form-control" placeholder="Phone Num"></asp:TextBox></td>
                   <td class="text-center"><a id="addUser" class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-plus"></span> Add</a></td>

               </tr>
            </tbody>  
        </table>  

          

    </form>
</body>
</html>
