using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Web.Configuration;

namespace tvieira.ECommerce
{
    public class Criptografia
    {
        const string Salt = "This is secret!";

        private static readonly byte[] Key;
        private static readonly byte[] IV;

        /// <summary>
        /// Encrypt a string using the machineKey decryptionKey
        /// attribute from the Web configuration file
        /// </summary>
        public static byte[] Encrypt(string text)
        {
            //Get an encryptor.
            RijndaelManaged myRijndael = new RijndaelManaged();
            ICryptoTransform encryptor = myRijndael.CreateEncryptor(Key, IV);

            //Encrypt the data.
            MemoryStream msEncrypt = new MemoryStream();
            CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write);

            //Convert the data to a byte array.
            byte[] toEncrypt = Encoding.ASCII.GetBytes(text);

            //Write all data to the crypto stream and flush it.
            csEncrypt.Write(toEncrypt, 0, toEncrypt.Length);
            csEncrypt.FlushFinalBlock();

            //Get encrypted array of bytes.
            return msEncrypt.ToArray();
        }

        /// <summary>
        /// Decrypts a string
        /// </summary>
        public static string Decrypt(byte[] encrypted)
        {
            RijndaelManaged myRijndael = new RijndaelManaged();

            //Get a decryptor that uses the same key and IV as the encryptor.
            ICryptoTransform decryptor = myRijndael.CreateDecryptor(Key, IV);

            // Decrypt into memory stream
            MemoryStream msDecrypt = new MemoryStream(encrypted);
            CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read);

            byte[] fromEncrypt = new byte[encrypted.Length];

            //Read the data out of the crypto stream.
            try
            {
                csDecrypt.Read(fromEncrypt, 0, fromEncrypt.Length);
            }
            catch
            {
                return "?????";
            }

            //Convert the byte array back into a string.
            return Encoding.ASCII.GetString(fromEncrypt);
        }


        /// <summary>
        /// Load decryptionKey from machineKey section of the Web configuration file
        /// </summary>
        static Criptografia()
        {

            // Get the encryption key
            MachineKeySection section = (MachineKeySection)WebConfigurationManager.GetWebApplicationSection("system.web/machineKey");
            if (section.DecryptionKey == null)
                throw new Exception("You must specify a decryptionKey in the Web configuration file");
            string decryptionKey = section.DecryptionKey;

            // Derive the encryption Key and IV
            byte[] bSalt = Encoding.ASCII.GetBytes(Salt);
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(decryptionKey, bSalt);
            Key = pdb.GetBytes(32);
            IV = pdb.GetBytes(16);
        }

    }
}