using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;

namespace tvieira.Controles.Ecommerce
{
    /// <summary>
    /// Renders a virtual window that can be dragged
    /// </summary>
    [ParseChildren(false)]
    public class WebWindow : WebControl, IPostBackEventHandler
    {
        private string _windowTitleText = "Untitled";
        private bool _showCloseButton;

        public event EventHandler Closed;

        /// <summary>
        /// The text that appears in the WebWindow
        /// title bar
        /// </summary>
        public string WindowTitleText
        {
            get
            {
                return _windowTitleText;
            }
            set
            {
                _windowTitleText = value;
            }
        }

        /// <summary>
        /// Sets CSS display=none
        /// </summary>
        public bool Hide
        {
            get 
            {
                if (ViewState["Hide"] == null)
                    return true;
                else
                    return (bool)ViewState["Hide"];
            }
            set 
            {
                ViewState["Hide"] = value;
            }
        }

        /// <summary>
        /// Displays close button
        /// </summary>
        public bool ShowCloseButton
        {
            get { return _showCloseButton; }
            set { _showCloseButton = value; }
        }

        /// <summary>
        /// Wire-up the JavaScripts
        /// </summary>
        protected override void OnPreRender(EventArgs e)
        {
            if (!Page.ClientScript.IsClientScriptIncludeRegistered("WebWindow"))
                Page.ClientScript.RegisterClientScriptInclude("WebWindow", Page.ResolveClientUrl("~/Scripts/WebWindow.js"));

            String startupScript = String.Format("WebWindow.init('{0}');", this.ClientID);
            Page.ClientScript.RegisterStartupScript(this.GetType(), this.ClientID, startupScript, true);
        }

        /// <summary>
        /// Render the body of the WebWindow
        /// </summary>
        protected override void RenderContents(HtmlTextWriter writer)
        {
            RenderTitleBar(writer);
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "webWindowBody");
            writer.RenderBeginTag(HtmlTextWriterTag.Div);
            this.RenderChildren(writer);
            writer.RenderEndTag();
        }

        /// <summary>
        /// Render the WebWindow title bar
        /// </summary>
        private void RenderTitleBar(HtmlTextWriter writer)
        {
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "webWindowTitleBar");
            writer.AddAttribute("onmousedown", "WebWindow.mouseDown(event)");
            writer.AddStyleAttribute(HtmlTextWriterStyle.TextAlign, "right");
            writer.RenderBeginTag(HtmlTextWriterTag.Div);

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "webWindowTitleText");
            writer.RenderBeginTag(HtmlTextWriterTag.Span);
            writer.Write(_windowTitleText);
            writer.RenderEndTag();

           RenderCloseButton(writer);

            writer.RenderEndTag();
        }

        /// <summary>
        /// Render the WebWindow Close button
        /// </summary>
        private void RenderCloseButton(HtmlTextWriter writer)
        {
            if (_showCloseButton)
            {
                String eventRef = Page.ClientScript.GetPostBackEventReference(this, String.Empty);
                writer.AddAttribute(HtmlTextWriterAttribute.Onclick, eventRef);
                writer.AddAttribute(HtmlTextWriterAttribute.Class, "webWindowClose");
                writer.RenderBeginTag(HtmlTextWriterTag.Span);
                writer.Write("X");
                writer.RenderEndTag();
            }
            else
            {
                writer.WriteBreak();
            }
        }

        /// <summary>
        /// Add required style attributes
        /// </summary>
        protected override void AddAttributesToRender(HtmlTextWriter writer)
        {
            if (Hide)
                writer.AddStyleAttribute(HtmlTextWriterStyle.Display, "none");
            writer.AddStyleAttribute(HtmlTextWriterStyle.Position, "absolute");
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "webWindow");
            base.AddAttributesToRender(writer);
        }

        /// <summary>
        /// Render the WebWindow as a DIV tag
        /// </summary>
        protected override HtmlTextWriterTag TagKey
        {
            get
            {
                return HtmlTextWriterTag.Div;
            }
        }

        /// <summary>
        /// Raise Close event when the Close button
        /// is clicked
        /// </summary>
        public void RaisePostBackEvent(string eventArgument)
        {
            if (Closed != null)
                Closed(this, EventArgs.Empty);
        }
    }
}