using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using Newtonsoft.Json.Linq;

namespace ProyectoBases2_Cliente
{
    public class IPLocation
    {
        public string IPAddress { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }

        public static IPLocation GetIPLocation()
        {
            IPLocation Location = new IPLocation();
            Location.IPAddress = GetIPAddress();
            // NOTA : La siguiente linea tira nulo y todo se cae. Revisar.
            string retJson = DownloadDataNoAuth(string.Format("https://www.freegeoip.net/json/{0}", Location.IPAddress));
            var JO = JObject.Parse(retJson);
            Location.Latitude =   (string) JO["latitude"];
            Location.Longitude =  (string) JO["longitude"];
            return Location;
        }

        public static string DownloadDataNoAuth(string hostURI)
        {
            string retXml = string.Empty;
            try
            {
                HttpWebRequest request = (HttpWebRequest) HttpWebRequest.Create(hostURI);
                request.Method = "GET";
                String responseLine = String.Empty;
                using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
                {
                    using (Stream dataStream = response.GetResponseStream())
                    {
                        StreamReader sr = new StreamReader(dataStream);
                        retXml = sr.ReadToEnd();
                        sr.Close();
                        dataStream.Close();
                    }
                }
            }
            catch (Exception e)
            {
                retXml = null;
            }
            return retXml;
        }


        public static string GetIPAddress()
        {
            return HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
    }
}