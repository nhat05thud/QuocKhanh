using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ConvertTitle
/// </summary>
public class ConvertTitle
{
    public ConvertTitle()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string convertToLowerCase(string input)
    {
        string[] sequenCharacters = { "~", "`", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "+", "=", "{", "}", "[", "]", "|", "\\", "'", ":", ";", "\"", "<", ",", ">", ".", "?", "/", " " };
        input = input.ToLower();

        foreach (string s in sequenCharacters)
        {
            if (input.Contains(s))
            {
                input = input.Replace(s, "-");
            }
        }
        var changeSymbol = new ChangeSymBol();
        input = changeSymbol.doChange(input);
        while (input.Contains("--"))
        {
            input = input.Replace("--", "-");
        }
        if (input.EndsWith("-"))
        {
            input = input.Remove(input.Length - 1);
        }
        return input;
    }
}