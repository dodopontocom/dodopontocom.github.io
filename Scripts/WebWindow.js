var WebWindow = new Object();

WebWindow.init = function(winId)
    {
		eval("place=" + this.getCookie(winId + "_place"));
		place = place || {left:20, top:20};
		
		var win = document.getElementById(winId);
		
		win.style.left = place.left;
		win.style.top = place.top;
    }

WebWindow.mouseDown = function(e)
    {
        var e = e || window.event;
        var src = e.target || e.srcElement;
        var win = src.offsetParent;

        var startWinX = win.offsetLeft;
        var startWinY = win.offsetTop;
        var startMouseX = e.clientX;
        var startMouseY = e.clientY;
                     
        var move = function(e)
            {
                var e = e || window.event;
                win.style.left = (startWinX - (startMouseX - e.clientX)) + 'px';
                win.style.top = (startWinY - (startMouseY - e.clientY)) + 'px';

                if (document.all)
                {
                    e.cancelBubble = true;
                    e.returnValue = false;
                }
                if (e.preventDefault)
                {
                    e.preventDefault();
                }
            }
            
        var up = function(e)
            {
                document.onmousemove = null;
                document.onmouseup = null;
    			WebWindow.setCookie(win.id + "_place", "{left:'" + win.style.left + "', top:'" + win.style.top + "'}");
            }    

        document.onmousemove = move;   
        document.onmouseup = up;
    }

WebWindow.setCookie = function(name, value)
	{
			var expires = new Date();
			expires.setTime( expires.getTime() + 365 * 24 * 60 * 60 * 1000 );
			document.cookie = name + "=" + escape(value) + ";expires=" + expires.toGMTString();
	}


WebWindow.getCookie = function(name)
    {
			var aCookie = document.cookie.split("; ");
			for (var i=0; i < aCookie.length; i++)
			{
				var aCrumb = aCookie[i].split("=");
				if (name == aCrumb[0]) 
				return unescape(aCrumb[1]);
			}
			return null;
    }

    