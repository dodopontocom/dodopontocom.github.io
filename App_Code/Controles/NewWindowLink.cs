using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tvieira.Controles.Ecommerce
{

    public class NewWindowLink : WebControl
    {
        private string _text = "Click Here!";
        private string _navigateUrl;
        private string _target = "_blank";
        private int _windowWidth = 400;
        private int _windowHeight = 300;
        private int _windowLeft = 100;
        private int _windowTop = 100;
        private bool _fullScreen = false;
        private bool _resizable = true;

        public string Text
        {
            get { return _text; }
            set { _text = value; }
        }

        public string NavigateUrl
        {
            get { return _navigateUrl; }
            set { _navigateUrl = value; }
        }

        public string Target
        {
            get { return _target; }
            set { _target = value; }
        }

        public int WindowWidth
        {
            get { return _windowWidth; }
            set { _windowWidth = value; }
        }

        public int WindowHeight
        {
            get { return _windowHeight; }
            set { _windowHeight = value; }
        }

        public int WindowLeft
        {
            get { return _windowLeft; }
            set { _windowLeft = value; }
        }

        public int WindowTop
        {
            get { return _windowTop; }
            set { _windowTop = value; }
        }

        public bool FullScreen
        {
            get { return _fullScreen; }
            set { _fullScreen = value; }
        }

        public bool Resizable
        {
            get { return _resizable; }
            set { _resizable = value; }
        }

        protected override void AddAttributesToRender(HtmlTextWriter writer)
        {
            string fullscreenValue = "no";
            if (_fullScreen)
                fullscreenValue = "yes";
            string resizableValue = "no";
            if (_resizable)
                resizableValue = "yes";
            string features = "width={0},height={1},left={2},top={3},fullscreen={4},resizable={5},status=no,toolbar=no,menubar=no,location=no";
            string featuresValue = String.Format(features, _windowWidth, _windowHeight, _windowLeft, _windowTop, fullscreenValue, resizableValue);
            string script = String.Format("window.open('{0}','{1}','{2}');return false;", Page.ResolveUrl(_navigateUrl), _target, featuresValue);
            writer.AddAttribute(HtmlTextWriterAttribute.Onclick, script);
            writer.AddAttribute(HtmlTextWriterAttribute.Href, Page.ResolveUrl(_navigateUrl));
            base.AddAttributesToRender(writer);
        }


        protected override void RenderContents(HtmlTextWriter writer)
        {
            writer.Write(_text);
        }

        protected override HtmlTextWriterTag TagKey
        {
            get
            {
                return HtmlTextWriterTag.A;
            }
        }

    }
}
