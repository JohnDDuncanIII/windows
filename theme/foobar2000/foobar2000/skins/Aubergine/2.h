//------------------Button---------------------
function Button(x,y,w,h,ImageNormal,ImageHover,ImageDown,TooltipText){
    this.State = 0; //0-normal ;1-hover ;2-down
    var g_image = ImageNormal;
    var tooltip = window.CreateTooltip();
    tooltip.Text = TooltipText;
    
    var r = x + w;
    var b = y + h;

    this.SetSize = function(_x,_y,_w,_h){
    x = _x; y = _y; w = _w; h = _h;
    r = x + w;
    b = y + h;
    this.Reset();
    }

    this.SetTooltipText = function(t){
        TooltipText = t;
        tooltip.Text = t;
    }

    this.Draw = function(gr){
        gr.DrawImage(g_image,x,y,w,h,0,0,w,h,0);
    }
    
    this.SetTooltipText = function(text){
        tooltip.Deactivate();
        tooltip.Text = text;
    }

    this.Activate = function(_x,_y){
        if(_x>x && _x<r && _y>y && _y<b){
            if(this.State == 0){
                g_image = ImageHover;
                this.State = 1;
                tooltip.Activate();
                window.Repaint();
             }
        }
        else this.Reset();
    }
    
    this.Down = function(){
        if(this.State == 1){
            g_image = ImageDown;
            this.State = 2;
            window.Repaint();
            return true;
        }
        else return false;
    }
    
    this.Click = function(){
        if(this.State == 2){
            this.Reset();
            return true;
        }
        else return false;
    }
    
    this.Reset = function(){
        if(this.State != 0){
            g_image = ImageNormal;
            this.State = 0;
            tooltip.Deactivate();
            window.Repaint();
        }
    }
    
    this.Kill = function(){
        tooltip.Dispose();
        ImageNormal.Dispose();
        ImageHover.Dispose();
        ImageDown.Dispose();
    }
}
//------------------Dragbar---------------------
function Dragbar(){

    this.Pos = 0;
    this.X = 0;
    this.Y = 0;
    this.W = 0;
    this.H = 0;

    var r = this.X + this.W;
    var b = this.Y + this.H;

    var dragging = false;
    
    this.SetSize = function(_x,_y,_w,_h){
        this.X = _x;this.Y = _y;this.W = _w;this.H = _h;
        r = _x + _w;b = _y + _h;
	
    }

    this.Click = function(_x,_y){
        if(_x>this.X && _x<r && _y>this.Y && _y<b){
            dragging = true;
            this.Pos = _x - this.X;
            window.Repaint();
            return true;
        }
        else return false;
    }
    
    this.Drag = function(_x,_y){
        if(dragging){
	    if(_x > this.X){
                this.Pos = _x - this.X;
	    }else{
	        this.Pos = 0;
	    }
            window.Repaint();
            return true;
        }
        else return false;
    }
    
    this.Reset = function(){
        dragging = false;
        window.Repaint();
    }
}
//------------------TooltipTextArea---------------------
function TooltipTextArea(x,y,w,h,text,font,color,tooltip_text){
    
    this.Text = text;
    this.TooltipText = tooltip_text;
    
    var tooltip = window.CreateTooltip();
    tooltip.Text = tooltip_text;
    
    var r = x + w;
    var b = y + h;
    var active = false;
    
    this.SetText = function(t){
        this.Text = t;
    }
    
    this.SetTooltipText = function(t){
        this.TooltipText = t;
        tooltip.Text = t;
    }
    
    this.Draw = function(gr){
        gr.DrawString(this.Text,font,color,x,y,w,h,StringFormat(1,1,0,0x1000))
    }
    
    this.Activate = function(_x,_y){
        if(_x>x && _x<r && _y>y && _y<b){
            if(!active){
                active = true;
                tooltip.Activate();
            }
        }else{
            this.Reset();
        }
    }
    
    this.Reset = function(){
        active = false;
        tooltip.Deactivate();
    }
}
