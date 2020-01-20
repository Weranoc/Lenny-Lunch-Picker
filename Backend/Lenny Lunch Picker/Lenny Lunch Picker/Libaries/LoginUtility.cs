using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Lenny_Lunch_Picker.Libraries.Utilities;
using Lenny_Lunch_Picker.Models;

namespace Lenny_Lunch_Picker.Libraries
{
    public class LoginUtility
    {
        private LennyLunchPickerEntities1 db = new LennyLunchPickerEntities1();

        public string Login(string email, string password)
        {
            var Member = db.users.Where(u => u.email == email).FirstOrDefault<user>();

            if (Member != null)
            {
                if (Member.password == password)
                {
                    return CreateTokenString(email);
                } else
                {
                    return string.Empty;
                }
            } else
            {
                return string.Empty;
            }
        }

        public string CreateTokenString(string uid)
        {
            var guid = Guid.NewGuid();
            var ret = uid + ":" + guid.ToString();
            return Base64.Encode(ret);
        }
    }
}