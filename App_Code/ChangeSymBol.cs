using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ChangeSymBol
/// </summary>
public class ChangeSymBol
{
    public ChangeSymBol()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string doChange(string input)
    {
        //string[] specWrd = { "é", "è", "ẻ", "ẽ", "ẹ", "ê", "ệ", "ế", "ề", "ể", "ễ", "ệ", "ý", "ỳ", "ỷ", "ỹ", "ỵ", "ú", "ù", "ủ", "ũ", "ụ", "í", "ì", "ỉ", "ĩ", "ị", "ó", "ò", "ỏ", "õ", "ọ", "ô", "ố", "ồ", "ổ", "ổ", "ỗ", "á", "à", "ả", "ã", "ạ", "â", "ấ", "ầ", "ẩ", "ẫ", "ậ" };
        string[] specWrd1 = { "é", "è", "ẻ", "ẽ", "ẹ", "ê", "ế", "ề", "ể", "ễ", "ệ" };
        string[] specWrd2 = { "ý", "ỳ", "ỷ", "ỹ", "ỵ" };
        string[] specWrd3 = { "ú", "ù", "ủ", "ũ", "ụ", "ư", "ứ", "ừ", "ử", "ữ", "ự" };
        string[] specWrd4 = { "í", "ì", "ỉ", "ĩ", "ị" };
        string[] specWrd5 = { "ó", "ò", "ỏ", "õ", "ọ", "ô", "ố", "ồ", "ổ", "ỗ", "ộ", "ơ", "ớ", "ờ", "ở", "ỡ", "ợ" };
        string[] specWrd6 = { "á", "à", "ả", "ã", "ạ", "â", "ấ", "ầ", "ẩ", "ẫ", "ậ", "ă", "ắ", "ằ", "ẳ", "ẵ", "ặ" };
        string[] specWrd7 = { "đ" };
        input = input.ToLower();
        foreach (string s in specWrd1)
        {
            if (input.Contains(s))
            {
                input = input.Replace(s, "e");
            }
        }
        foreach (string s in specWrd2)
        {
            if (input.Contains(s))
            {
                input = input.Replace(s, "y");
            }
        }
        foreach (string s in specWrd3)
        {
            if (input.Contains(s))
            {
                input = input.Replace(s, "u");
            }
        }
        foreach (string s in specWrd4)
        {
            if (input.Contains(s))
            {
                input = input.Replace(s, "i");
            }
        }
        foreach (string s in specWrd5)
        {
            if (input.Contains(s))
            {
                input = input.Replace(s, "o");
            }
        }
        foreach (string s in specWrd6)
        {
            if (input.Contains(s))
            {
                input = input.Replace(s, "a");
            }
        }
        foreach (string s in specWrd7)
        {
            if (input.Contains(s))
            {
                input = input.Replace(s, "d");
            }
        }
        return input;
    }
}