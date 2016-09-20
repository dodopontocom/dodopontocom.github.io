using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tvieira.Controles.Ecommerce
{

    /// <summary>
    /// Unhides a WebWindow by setting its 
    /// display attribute to block
    /// </summary>
    public class OpenWebWindow : WebControl
    {

        private string _webWindowID;
        private string _text = "Open Window";

        /// <summary>
        /// The ID of the WebWindow to display
        /// </summary>
        public string WebWindowID
        {
            get { return _webWindowID; }
            set { _webWindowID = value; }
        }

        /// <summary>
        /// The text that appears on the link
        /// </summary>
        public string Text
        {
            get { return _text; }
            set { _text = value; }
        }

        /// <summary>
        /// Add the client onclick handler for
        /// opening the WebWindow
        /// </summary>
        protected override void AddAttributesToRender(HtmlTextWriter writer)
        {
            // Create the open script
            Control webWindow = this.NamingContainer.FindControl(_webWindowID);
            if (webWindow == null)
                throw new Exception("Could not find WebWindow with ID " + _webWindowID);
            string webWindowClientId = webWindow.ClientID;
            string openScript = String.Format("document.getElementById('{0}').style.display='block'", webWindowClientId);

            // Add the attributes
            writer.AddAttribute(HtmlTextWriterAttribute.Href, "javascript:void(0)");
            writer.AddAttribute(HtmlTextWriterAttribute.Onclick, openScript);
            base.AddAttributesToRender(writer);
        }

        /// <summary>
        /// Display the label for the link
        /// </summary>
        protected override void RenderContents(HtmlTextWriter writer)
        {
            writer.Write(_text);
        }

        /// <summary>
        /// Render this control as a hyperlink
        /// </summary>
        protected override HtmlTextWriterTag TagKey
        {
            get
            {
                return HtmlTextWriterTag.A;
            }
        }

    }
}