using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Collections.Specialized;

namespace tvieira.Controles.Ecommerce
{
    [ParseChildren(false)]
    public class ClientTabs : WebControl, IPostBackDataHandler
    {
        /// <summary>
        /// Ignore every child tag except for Tabs
        /// </summary>
        protected override void AddParsedSubObject(Object obj)
        {
            if (obj is Tab)
                base.AddParsedSubObject(obj);
        }

        /// <summary>
        /// Gets or sets the selected tab index
        /// </summary>
        public int SelectedIndex
        {
            get
            {
                if (ViewState["SelectedIndex"] == null)
                    return 0;
                else
                    return (int)ViewState["SelectedIndex"];
            }
            set
            {
                ViewState["SelectedIndex"] = value;
            }
        }

        /// <summary>
        /// Helper method which returns the hidden
        /// form field ID
        /// </summary>
        private string HiddenFieldID
        {
            get
            {
                return String.Format("{0}_hidden", this.ClientID);
            }
        }

        /// <summary>
        /// ID for the DIV tag which contains all of the tabs
        /// </summary>
        private string TabContainerID
        {
            get
            {
                return String.Format("{0}_tabs", this.ClientID);
            }
        }

        /// <summary>
        /// ID for the DIV tag which contains all of the tab contents
        /// </summary>
        private string TabContentContainerID
        {
            get
            {
                return String.Format("{0}_tabContent", this.ClientID);
            }
        }

        /// <summary>
        /// Register all client-side content including scripts and CSS
        /// </summary>
        protected override void OnPreRender(EventArgs e)
        {
            // Process server events
            Page.RegisterRequiresPostBack(this);

            // Make sure selected index is possible
            if (SelectedIndex > (Controls.Count - 1))
                throw new Exception("SelectedIndex must be less than Tab count");

            // Register hidden field to maintain state
            Page.ClientScript.RegisterHiddenField(HiddenFieldID, Controls[SelectedIndex].ClientID);

            // Add link to external Cascading Style Sheet
            HtmlLink styleLink = new HtmlLink();
            styleLink.Href = "~/ClientScripts/ClientTabs.css";
            styleLink.Attributes.Add("rel", "stylesheet");
            styleLink.Attributes.Add("type", "text/css");
            Page.Header.Controls.Add(styleLink);

            // Register javascript include
            if (!Page.ClientScript.IsClientScriptIncludeRegistered("ClientTabs"))
                Page.ClientScript.RegisterClientScriptInclude("ClientTabs", Page.ResolveUrl("~/ClientScripts/ClientTabs.js"));

            base.OnPreRender(e);
        }

        /// <summary>
        /// Contain control content in a DIV
        /// </summary>
        protected override HtmlTextWriterTag TagKey
        {
            get
            {
                return HtmlTextWriterTag.Div;
            }
        }


        /// <summary>
        /// Render tabs and tab content
        /// </summary>
        protected override void RenderContents(HtmlTextWriter writer)
        {
            RenderTabs(writer);
            RenderTabContent(writer);
        }

        /// <summary>
        /// Render the tab strip
        /// </summary>
        private void RenderTabs(HtmlTextWriter writer)
        {
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "tabs");
            writer.RenderBeginTag(HtmlTextWriterTag.Table);
            writer.RenderBeginTag(HtmlTextWriterTag.Tbody);
            writer.AddAttribute(HtmlTextWriterAttribute.Id, TabContainerID);
            writer.RenderBeginTag(HtmlTextWriterTag.Tr);

            for (int index = 0; index < Controls.Count; index++)
            {
                Tab currentTab = (Tab)Controls[index];
                String script = String.Format("ClientTabs.selectTab('{0}','{1}')", this.ClientID, currentTab.ClientID);
                writer.AddAttribute(HtmlTextWriterAttribute.Onclick, script);
                if (index == SelectedIndex)
                    writer.AddAttribute(HtmlTextWriterAttribute.Class, "tab selectedTab");
                else
                    writer.AddAttribute(HtmlTextWriterAttribute.Class, "tab unselectedTab");
                writer.AddAttribute(HtmlTextWriterAttribute.Id, currentTab.ClientID + "_tab");
                writer.RenderBeginTag(HtmlTextWriterTag.Td);
                writer.Write(currentTab.Text);
                writer.RenderEndTag();
            }

            writer.RenderEndTag();
            writer.RenderEndTag();
            writer.RenderEndTag();
        }

        /// <summary>
        /// Render the tab contents
        /// </summary>
        private void RenderTabContent(HtmlTextWriter writer)
        {
            writer.AddAttribute(HtmlTextWriterAttribute.Id, TabContentContainerID);
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "tabContent");
            writer.RenderBeginTag(HtmlTextWriterTag.Div);

            for (int index = 0; index < Controls.Count; index++)
            {
                Tab currentTab = (Tab)Controls[index];
                if (index != SelectedIndex)
                    currentTab.Style.Add("display", "none");

                currentTab.RenderControl(writer);
            }
            writer.RenderEndTag();
        }

        /// <summary>
        /// Process postback data
        /// </summary>
        public bool LoadPostData(string postDataKey, NameValueCollection postCollection)
        {
            String selectedTabId = postCollection[HiddenFieldID];
            EnsureChildControls();
            for (int index = 0; index < Controls.Count; index++)
            {
                if (Controls[index].ClientID == selectedTabId)
                    SelectedIndex = index;
            }
            return false;
        }

        /// <summary>
        /// If selected tab changed, raise event
        /// </summary>
        public void RaisePostDataChangedEvent()
        {
        }
    }


    [ParseChildren(false)]
    public class Tab : WebControl
    {
        private string _text;

        /// <summary>
        /// Represents tab label
        /// </summary>
        public string Text
        {
            get
            {
                return _text;
            }
            set
            {
                _text = value;
            }
        }

        /// <summary>
        /// Make sure each tab has an id
        /// </summary>
        protected override void OnLoad(EventArgs e)
        {
            this.EnsureID();
            base.OnLoad(e);
        }


        /// <summary>
        /// Render tab in a DIV
        /// </summary>
        protected override HtmlTextWriterTag TagKey
        {
            get
            {
                return HtmlTextWriterTag.Div;
            }
        }

    }

}