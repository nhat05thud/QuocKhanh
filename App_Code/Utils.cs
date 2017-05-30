using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Utils
/// </summary>
public static class Utils
{    
    public static string progressTitle(object input)
    {
        var convertTitle = new ConvertTitle();
        return convertTitle.convertToLowerCase(input.ToString());
    }
}