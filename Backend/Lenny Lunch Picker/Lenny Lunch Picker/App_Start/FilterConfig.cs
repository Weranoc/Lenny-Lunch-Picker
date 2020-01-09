using System.Web;
using System.Web.Mvc;

namespace Lenny_Lunch_Picker
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
